unit Unt_FrmCadProd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.DBCtrls, Vcl.StdCtrls,
  Data.DB, FIBDataSet, pFIBDataSet, Unt_Dm, System.Actions, Vcl.ActnList;

type
  TFrm_CadProd = class(TForm)
    LblCod: TLabel;
    LblCadastrar: TLabel;
    LblNome: TLabel;
    EdtCod: TEdit;
    EdtNome: TDBEdit;
    BtnGravar: TButton;
    QryProdutos: TpFIBDataSet;
    DsProdutos: TDataSource;
    ActProdutos: TActionList;
    ActGravar: TAction;
    QryProdutosCOD_PRODUTO: TFIBIntegerField;
    QryProdutosNOME_PRODUTO: TFIBStringField;
    procedure ActGravarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Function TestaCampos : Boolean;
    Procedure FindCod(iCod : Integer);
  public
    { Public declarations }
    CodAtual : Integer;
  end;

var
  Frm_CadProd: TFrm_CadProd;

implementation

{$R *.dfm}

procedure TFrm_CadProd.ActGravarExecute(Sender: TObject);
begin
  if not TestaCampos then exit;
  QryProdutosCOD_PRODUTO.AsString := EdtCod.Text;

  try
    QryProdutos.Post;
    QryProdutos.UpdateTransaction.Commit;
    FindCod(0);
  except
    on E: Exception do begin
      QryProdutos.UpdateTransaction.Rollback;
      ShowMessage('Erro ao Cadastrar Produto. Erro: ' +#13+ e.Message);
    end;
  end;

end;

procedure TFrm_CadProd.FindCod(iCod: Integer);
begin
  QryProdutos.Close;
  QryProdutos.ParamByName('Cod_Produto').AsInteger := iCod;
  QryProdutos.Open;

  if QryProdutos.IsEmpty then begin
    LblCadastrar.Caption := 'Cadastrando Produto';
    QryProdutos.Append;
    EdtCod.Clear;
  end else begin
    LblCadastrar.Caption := 'Editando Produto ' + iCod.ToString;
    QryProdutos.Edit;
    EdtCod.Text := QryProdutosCOD_PRODUTO.AsString;
  end;
end;

procedure TFrm_CadProd.FormShow(Sender: TObject);
begin
  FindCod(CodAtual);
end;

function TFrm_CadProd.TestaCampos: Boolean;
begin
  Result := False;

  if (Trim(EdtCod.Text) = '') then begin
    ShowMessage('O C�digo � Obrigat�rio!');
    EdtCod.SetFocus;
    Exit;
  end;

  if (Trim(EdtNome.Text) = '') then begin
    ShowMessage('O Nome � Obrigat�rio!');
    EdtNome.SetFocus;
    Exit;
  end;

  Result := True;
end;

end.
