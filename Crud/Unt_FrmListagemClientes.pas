unit Unt_FrmListagemClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, FIBDataSet, pFIBDataSet, Vcl.Menus,
  frxClass, frxDBSet;

type
  TFrmListagemClientes = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    BtnAtualizar: TButton;
    BtnLimpaCondicoes: TButton;
    DSListagemClientes: TDataSource;
    QryClientes: TpFIBDataSet;
    QryClientesCOD_CLIENTE: TFIBIntegerField;
    QryClientesNOME_CLIENTE: TFIBStringField;
    LbCountReg: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edtNome: TEdit;
    edtCodigo: TEdit;
    PopupMenu1: TPopupMenu;
    EditarCliente1: TMenuItem;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    BtnImprimir: TButton;
    procedure BtnAtualizarClick(Sender: TObject);
    procedure BtnLimpaCondicoesClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditarCliente1Click(Sender: TObject);
    procedure BtnImprimirClick(Sender: TObject);
  private
    procedure getParametros(iSQL: TStrings);
  public
    { Public declarations }
  end;

var
  FrmListagemClientes: TFrmListagemClientes;

implementation

uses Unt_DM, Unt_FrmCadCliente;

{$R *.dfm}

procedure TFrmListagemClientes.BtnAtualizarClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    QryClientes.Close;
    QryClientes.SQLs.SelectSQL.Clear;
    QryClientes.SQLs.SelectSQL.Add('SELECT * FROM CLIENTES');
    QryClientes.SQLs.SelectSQL.Add('WHERE COD_CLIENTE > 0');
    getParametros(QryClientes.SQLs.SelectSQL);
    QryClientes.Open();

    LbCountReg.Caption := QryClientes.RecordCount.ToString + ' Registro(s)';
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmListagemClientes.BtnImprimirClick(Sender: TObject);
begin
  if (QryClientes.Active = True) then
    frxReport1.ShowReport();
end;

procedure TFrmListagemClientes.BtnLimpaCondicoesClick(Sender: TObject);
begin
  edtCodigo.Clear;
  edtNome.Clear;
end;

procedure TFrmListagemClientes.DBGrid1TitleClick(Column: TColumn);
begin
  //QryClientes.DoSortMy(Column.FieldName);
end;

procedure TFrmListagemClientes.EditarCliente1Click(Sender: TObject);
begin
  if (QryClientesCOD_CLIENTE.AsInteger = 0) then Exit;

  try
    if (FrmCadCliente = nil) then Application.CreateForm(TFrmCadCliente, FrmCadCliente);
    FrmCadCliente.CodAtual := QryClientesCOD_CLIENTE.AsInteger;
    FrmCadCliente.ShowModal;
  finally
    FreeAndNil(FrmCadCliente);
  end;
end;

procedure TFrmListagemClientes.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = vk_f5 then BtnAtualizarClick(self);
  if Key = vk_f2 then BtnLimpaCondicoesClick(self);
end;

procedure TFrmListagemClientes.getParametros(iSQL: TStrings);
begin
  if (edtCodigo.Text <> '') then iSQL.Add(' AND COD_CLIENTE = ' + edtCodigo.Text);
  if (edtNome.Text <> '') then iSQL.Add(' AND NOME_CLIENTE = ' + edtNome.Text);
end;

end.
