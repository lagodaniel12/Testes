program Cadastro;

uses
  Vcl.Forms,
  Unt_FrmPrincipal in 'Unt_FrmPrincipal.pas' {FrmPrincipal},
  Unt_FrmCadastrar in 'Unt_FrmCadastrar.pas' {FrmCadastrar},
  Unt_FrmDM in 'Unt_FrmDM.pas' {Dm: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TDm, Dm);
  Application.Run;
end.
