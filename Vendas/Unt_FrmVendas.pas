unit Unt_FrmVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient, Unt_Dm, Datasnap.Provider,
  FIBDataSet, pFIBDataSet, Vcl.Buttons, Vcl.Menus, FIBQuery, pFIBQuery;

type
  TFrmVendas = class(TForm)
    PnlDados: TPanel;
    PnlTotais: TPanel;
    LblCliente: TLabel;
    EdtCodCliente: TEdit;
    EdtNomeCliente: TEdit;
    PnlProduto: TPanel;
    EdtQuant: TEdit;
    LblQuant: TLabel;
    LblProduto: TLabel;
    EdtCodProduto: TEdit;
    EdtNomeProduto: TEdit;
    LblPreco: TLabel;
    EdtPreco: TEdit;
    LblSubtotal: TLabel;
    EdtSubtotal: TEdit;
    GridVendas: TDBGrid;
    QryVendas: TpFIBDataSet;
    CdVendas: TClientDataSet;
    DsVendas: TDataSource;
    CdVendasCOD: TIntegerField;
    CdVendasNome: TStringField;
    CdVendasQuant: TCurrencyField;
    CdVendasUnitário: TCurrencyField;
    CdVendasTotal: TCurrencyField;
    CdVendasSubTotal: TAggregateField;
    BtnFinalizar: TBitBtn;
    MenuGrid: TPopupMenu;
    MenuGridDeletar: TMenuItem;
    LblTotalVenda: TLabel;
    BtnCancelar: TBitBtn;
    QryVendasIns: TpFIBQuery;
    procedure EdtCodProdutoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodClienteExit(Sender: TObject);
    procedure EdtCodClienteKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtQuantKeyPress(Sender: TObject; var Key: Char);
    procedure EdtPrecoKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure BtnFinalizarClick(Sender: TObject);
    procedure EdtQuantChange(Sender: TObject);
    procedure EdtPrecoChange(Sender: TObject);
    procedure MenuGridDeletarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
  private
    Procedure LevarGrid;
    Procedure CalculaSubTotal;
  public
    { Public declarations }
  end;

var
  FrmVendas: TFrmVendas;

implementation

{$R *.dfm}

procedure TFrmVendas.BtnCancelarClick(Sender: TObject);
begin
  EdtCodCliente.Clear;
  EdtNomeCliente.Clear;
  EdtCodProduto.Clear;
  EdtNomeProduto.Clear;
  EdtQuant.Text := '1,00';
  EdtPreco.Text := '0,00';
  EdtSubtotal.Text := '0,00';
  CdVendas.EmptyDataSet;
  EdtCodCliente.SetFocus;
end;

procedure TFrmVendas.BtnFinalizarClick(Sender: TObject);
var
  CodVenda : Integer;
begin
  if (CdVendasSubTotal.AsVariant > 0) then begin
    try
      Dm.TransWrite.Active := True;
      QryVendas.Close;
      QryVendas.SQLs.SelectSQL.Clear;
      QryVendas.SQLs.SelectSQL.Add('Select Max(Cod_Venda) from Vendas');
      QryVendas.Open;
      CodVenda := QryVendas.FieldByName('MAX').AsInteger + 1;

      QryVendasIns.Close;
      QryVendasIns.SQL.Clear;
      QryVendasIns.SQL.Add('Insert Into Vendas Values (' + IntToStr(CodVenda) + ',' + EdtCodCliente.Text + ',' + QuotedStr(StringReplace(DateToStr(Date()),'/','.',[rfReplaceAll])) + ',' + StringReplace(CdVendasSubTotal.AsString,',','.',[rfReplaceAll]) + ')');
      QryVendasIns.ExecQuery;

      CdVendas.First;
      while (not CdVendas.Eof) do begin
        QryVendasIns.Close;
        QryVendasIns.SQL.Clear;
        QryVendasIns.SQL.Add('Insert Into VendaProdutos Values (' + IntToStr(CodVenda) + ',' + CdVendasCOD.AsString + ',' + StringReplace(CdVendasQuant.AsString,',','.',[rfReplaceAll]) + ',' + StringReplace(CdVendasUnitário.AsString,',','.',[rfReplaceAll]) + ',' + StringReplace(CdVendasTotal.AsString,',','.',[rfReplaceAll]) + ',' + '0' + ')');
        QryVendasIns.ExecQuery;

        CdVendas.Next;
      end;
      QryVendasIns.Transaction.Commit;
      MessageDlg('Venda Finalizada Com Sucesso!',mtInformation,[mbOK],0,mbOK);
      CdVendas.EmptyDataSet;
    except
      on E: Exception do begin
        QryVendasIns.Transaction.Rollback;
        MessageDlg('Ocorreu Um Erro Ao Gravar A Venda!' + #13 + E.Message,mtError,[mbOK],0,mbOK);
      end;
    end;
  end;
  //CdVendas.Close;
  CalculaSubTotal;
end;

procedure TFrmVendas.CalculaSubTotal;
begin
  if (CdVendasSubTotal.AsString.IsEmpty) then LblTotalVenda.Caption := 'Subtotal: R$0,00'
  else LblTotalVenda.Caption := 'Subtotal: R$' + FormatCurr('#0.00', CdVendasSubTotal.AsVariant);
end;

procedure TFrmVendas.EdtCodClienteExit(Sender: TObject);
begin
  if (Trim(EdtCodCliente.Text) <> '') then begin
    QryVendas.Close;
    QryVendas.SQLs.SelectSQL.Clear;
    QryVendas.SQLs.SelectSQL.Add('Select Nome_Favor from Favorecido where Cod_Favor = ' + EdtCodCliente.Text);
    QryVendas.Open;
    if (QryVendas.RecordCount = 0) then begin
      EdtCodCliente.Clear;
      EdtNomeCliente.Clear;
      exit;
    end;

    EdtNomeCliente.Text := QryVendas.FieldByName('Nome_Favor').AsString;
  end;
end;

procedure TFrmVendas.EdtCodClienteKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then EdtCodProduto.SetFocus;
end;

procedure TFrmVendas.EdtCodProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then begin
    if (Trim(EdtCodProduto.Text) <> '') then begin
      QryVendas.Close;
      QryVendas.SQLs.SelectSQL.Clear;
      QryVendas.SQLs.SelectSQL.Add('Select * from Produtos where Cod_Produto = ' + EdtCodProduto.Text);
      QryVendas.Open;

      if (QryVendas.RecordCount > 0) then begin
        EdtNomeProduto.Text := QryVendas.FieldByName('Nome_Produto').AsString;
        EdtQuant.Text := '1';
        EdtPreco.Text := QryVendas.FieldByName('Valor_Produto').AsString;
        if (Trim(EdtQuant.Text) <> '') and (Trim(EdtPreco.Text) <> '') then EdtSubtotal.Text := CurrToStr(StrToCurr(EdtQuant.Text) * StrToCurr(EdtPreco.Text));
      end else begin
        EdtCodProduto.Clear;
        EdtNomeProduto.Clear;
      end;
    end;
    if (PnlProduto.Visible = False) then LevarGrid
    else EdtQuant.SetFocus;


  end;
end;

procedure TFrmVendas.EdtCodProdutoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(Key) = #116) then begin
    if (PnlProduto.Visible = True) then PnlProduto.Visible := False
      else if (PnlProduto.Visible = False) then PnlProduto.Visible := True
  end;

end;

procedure TFrmVendas.EdtPrecoChange(Sender: TObject);
begin
  if (Trim(EdtPreco.Text) = '') then EdtPreco.Text := '0';
  EdtSubtotal.Text := CurrToStr(StrToCurr(EdtQuant.Text) * StrToCurr(EdtPreco.Text));
end;

procedure TFrmVendas.EdtPrecoKeyPress(Sender: TObject; var Key: Char);
begin
  if ((not (Key in ['0'..'9'])) and (Key <> #13) and (Key <> #8) and (Key <> #44)) then
    Key := #0;

  if (Key = #13) then LevarGrid;

end;

procedure TFrmVendas.EdtQuantChange(Sender: TObject);
begin
  if (Trim(EdtQuant.Text) = '') then EdtQuant.Text := '0';
  EdtSubtotal.Text := CurrToStr(StrToCurr(EdtQuant.Text) * StrToCurr(EdtPreco.Text));
end;

procedure TFrmVendas.EdtQuantKeyPress(Sender: TObject; var Key: Char);
begin
  if ((not (Key in ['0'..'9'])) and (Key <> #13) and (Key <> #8) and (Key <> #44)) then
    Key := #0;

  if (Key = #13) then EdtPreco.SetFocus;
end;

procedure TFrmVendas.FormCreate(Sender: TObject);
begin
  CdVendas.CreateDataSet;
  CdVendas.Open;
end;

procedure TFrmVendas.LevarGrid;
begin
  if ((Trim(EdtCodProduto.Text) = '') or (Trim(EdtNomeProduto.Text) = '')) then exit
  else begin
    if (QryVendas.FieldByName('Estoque_Produto').AsInteger < StrToCurr(EdtQuant.Text)) then begin
      MessageDlg('Estoque Insuficiente!',mtWarning,[mbOK],0,mbOK);
      EdtCodProduto.SetFocus;
      Exit;
    end;

    if (StrToCurr(EdtQuant.Text) <= 0) then begin
      MessageDlg('Quantidade Inválida!',mtWarning,[mbOK],0,mbOK);
      EdtCodProduto.SetFocus;
      Exit;
    end;

    if (StrToCurr(EdtPreco.Text) <= 0) then begin
      MessageDlg('Valor Inválido!',mtWarning,[mbOK],0,mbOK);
      EdtCodProduto.SetFocus;
      Exit;
    end;

    CdVendas.First;
    while ((not CdVendas.Eof) or (EdtCodProduto.Text = CdVendasCOD.AsString)) do begin
      if (EdtCodProduto.Text = CdVendasCOD.AsString) then begin
        if (MessageDlg('O Produto Já Esta Inserido! Deseja Substitui-lo?', mtConfirmation, [mbYes, mbNo], 0, mbNo) = mrYes) then begin
          CdVendas.Delete
        end else Exit;

        //Exit;
      end;

      CdVendas.Next;
    end;

    CdVendas.Append;
    CdVendasCOD.Text := EdtCodProduto.Text;
    CdVendasNome.Text := EdtNomeProduto.Text;
    CdVendasQuant.Text := EdtQuant.Text;
    CdVendasUnitário.Text := EdtPreco.Text;
    CdVendasTotal.Text := EdtSubtotal.Text;
    CdVendas.Post;

    CalculaSubTotal;

    PnlProduto.Visible := False;
    EdtCodProduto.Clear;
    EdtNomeProduto.Clear;
    EdtQuant.Text := '1,00';
    EdtPreco.Text := '0,00';
    EdtSubtotal.Text := '0,00';
    EdtCodProduto.SetFocus;
  end;
end;

procedure TFrmVendas.MenuGridDeletarClick(Sender: TObject);
begin
  CdVendas.Delete;
  CalculaSubTotal;
end;

end.
