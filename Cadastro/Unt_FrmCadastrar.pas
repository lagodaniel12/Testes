unit Unt_FrmCadastrar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.ExtCtrls, Data.DB, FIBDataSet, pFIBDataSet;

type
  TFrmCadastrar = class(TForm)
    Panel1: TPanel;
    LblCadastro: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    EdtCod: TDBEdit;
    EdtNome: TDBEdit;
    QryCadastrar: TpFIBDataSet;
    DsCadastrar: TDataSource;
    BtnCadastrar: TButton;
    QryCadastrarCOD_CLIENTE: TFIBIntegerField;
    QryCadastrarNOME_CLIENTE: TFIBStringField;
    procedure BtnCadastrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Function TestaCampos : Boolean;
    procedure FindCod(iCod: Integer);
  public
    CodAtual : Integer;
    { Public declarations }
  end;

var
  FrmCadastrar: TFrmCadastrar;

implementation

uses Unt_FrmDM;

{$R *.dfm}

{ TFrmCadastrar }

procedure TFrmCadastrar.BtnCadastrarClick(Sender: TObject);
begin
  if (not TestaCampos) then Exit;

  QryCadastrarCOD_CLIENTE.AsString := EdtCod.Text;

  try
    QryCadastrar.Post;
    QryCadastrar.UpdateTransaction.Commit;
    FindCod(0);
  Except 
    on E: Exception do begin
      QryCadastrar.UpdateTransaction.Rollback;
      ShowMessage('Erro ao Cadastrar Cliente. Erro: ' +#13+ e.Message);
    end;
  end;
end;

procedure TFrmCadastrar.FindCod(iCod: Integer);
begin
  QryCadastrar.Close;
  QryCadastrar.ParamByName('COD_CLIENTE').AsInteger := iCod;
  QryCadastrar.Open;

  if (QryCadastrar.IsEmpty) then begin //Cadastra
    LblCadastro.Caption := 'Cadastrando Cliente';
    QryCadastrar.Append;
    EdtCod.Clear;
  end else begin // Edita
    LblCadastro.Caption := 'Editando Cliente ' + iCod.ToString;
    QryCadastrar.Edit;
    EdtCod.Text := QryCadastrarCOD_CLIENTE.AsString;
  end;
end;

procedure TFrmCadastrar.FormShow(Sender: TObject);
begin
  FindCod(CodAtual);  
end;

function TFrmCadastrar.TestaCampos : Boolean;
begin
  Result := False;
  if (Trim(EdtCod.Text) = '') then
    begin
      ShowMessage('O Campo Código é Obrigatório');
      EdtCod.SetFocus;
      Exit;
    end;

  if (Trim(EdtNome.Text) = '') then
    begin
      ShowMessage('O Campo Nome é Obrigatório');
      EdtNome.SetFocus;
      Exit;
    end;

  Result := True;
end;

end.
