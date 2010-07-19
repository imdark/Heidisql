unit loginform;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmLogin = class(TForm)
    btnOK: TButton;
    editPassword: TEdit;
    lblPrompt: TLabel;
    editUsername: TEdit;
    lblUsername: TLabel;
    lblPassword: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  procedure LoginPrompt(ACaption: String; var AUsername, APassword: String);

implementation

uses helpers;

{$R *.dfm}
{$I const.inc}

procedure LoginPrompt(ACaption: String; var AUsername, APassword: String);
var
  frm: TfrmLogin;
begin
  // Create login box and pass back user + pass
  frm := TfrmLogin.Create(nil);
  frm.lblPrompt.Caption := ACaption;
  frm.editUsername.Text := AUsername;
  frm.editPassword.Text := APassword;
  frm.ShowModal;
  AUsername := frm.editUsername.Text;
  APassword := frm.editPassword.Text;
  frm.Free;
end;


procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  InheritFont(Font);
  Caption := APPNAME + ' - Login';
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  editUsername.SetFocus;
end;

end.
