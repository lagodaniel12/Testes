program Crud;

uses
  Vcl.Forms,
  Unt_FrmPrincipal in 'Unt_FrmPrincipal.pas' {FrmPrincipal},
  Unt_FrmCadCliente in 'Unt_FrmCadCliente.pas' {FrmCadCliente},
  Unt_DM in 'Unt_DM.pas' {DM: TDataModule},
  Unt_FrmListagemClientes in 'Unt_FrmListagemClientes.pas' {FrmListagemClientes},
  Unt_FrmCadProd in 'Unt_FrmCadProd.pas' {Frm_CadProd},
  Unt_FrmListProd in 'Unt_FrmListProd.pas' {FrmListProd};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
