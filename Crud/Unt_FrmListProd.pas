unit Unt_FrmListProd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Unt_Dm, FIBDataSet, pFIBDataSet, Vcl.StdCtrls,
  Vcl.Menus, Unt_FrmCadProd;

type
  TFrmListProd = class(TForm)
    Panel1: TPanel;
    GridProd: TDBGrid;
    QryProd: TpFIBDataSet;
    DsProd: TDataSource;
    QryProdCOD_PRODUTO: TFIBIntegerField;
    QryProdNOME_PRODUTO: TFIBStringField;
    EdtCod: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    EdtNome: TEdit;
    BtnAtualizar: TButton;
    BtnLimpar: TButton;
    PopupMenu1: TPopupMenu;
    AlterarProduto1: TMenuItem;
    procedure BtnLimparClick(Sender: TObject);
    procedure BtnAtualizarClick(Sender: TObject);
    procedure AlterarProduto1Click(Sender: TObject);
  private
    { Private declarations }
    Procedure GetSql(iSql : Tstrings);
  public
    { Public declarations }
  end;

var
  FrmListProd: TFrmListProd;

implementation

{$R *.dfm}

procedure TFrmListProd.AlterarProduto1Click(Sender: TObject);
begin
  if (QryProdCOD_PRODUTO.AsInteger = 0) then exit;

  try
    if (Frm_CadProd = nil) then Application.CreateForm(TFrm_CadProd,Frm_CadProd);
    Frm_CadProd.CodAtual:= QryProdCOD_PRODUTO.AsInteger;
    Frm_CadProd.ShowModal;
  finally
    FreeAndNil(Frm_CadProd);
  end;

end;

procedure TFrmListProd.BtnAtualizarClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;

    QryProd.Close;
    QryProd.SQLs.SelectSQL.Clear;
    QryProd.SQLs.SelectSQL.Add('Select * from Produtos where cod_produto > 0');
    GetSql(QryProd.SQLs.SelectSQL);
    QryProd.Open;

  finally
    Screen.Cursor := crDefault;
  end;

end;

procedure TFrmListProd.BtnLimparClick(Sender: TObject);
begin
  EdtCod.Clear;
  EdtNome.Clear;
  EdtCod.SetFocus;
end;

procedure TFrmListProd.GetSql(iSql: Tstrings);
begin
  if (Trim(EdtCod.Text) <> '') then iSql.Add(' and Cod_Produto = ' + EdtCod.Text);
  if (Trim(EdtNome.Text) <> '') then iSql.Add(' and Nome_Produto like ' + QuotedStr('%' + EdtNome.Text + '%'));

end;

end.
