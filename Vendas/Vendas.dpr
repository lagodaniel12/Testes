program Vendas;

uses
  Vcl.Forms,
  Unt_FrmVendas in 'Unt_FrmVendas.pas' {FrmVendas},
  Unt_Dm in 'Unt_Dm.pas' {Dm: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmVendas, FrmVendas);
  Application.CreateForm(TDm, Dm);
  Application.Run;
end.
