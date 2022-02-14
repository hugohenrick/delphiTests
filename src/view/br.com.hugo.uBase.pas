unit br.com.hugo.uBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids;

type
  TFrmBase = class(TForm)
    pnMaster: TPanel;
    pnDetail: TPanel;
    pnButtons: TPanel;
    DBGrid1: TDBGrid;
    dbNavigator: TDBNavigator;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBase: TFrmBase;

implementation

{$R *.dfm}

end.
