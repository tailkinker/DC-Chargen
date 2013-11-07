unit fstart;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TfrmStart }

  TfrmStart = class (TForm )
    btnNewChar : TButton;
    btnNewMinion : TButton;
    btnNewStandard : TButton;
    btnNewExcept : TButton;
    btnNewElite : TButton;
    procedure btnNewCharClick (Sender : TObject );
    procedure FormCreate (Sender : TObject );
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmStart : TfrmStart;

implementation

uses
  fchar;

{$R *.lfm}

{ TfrmStart }

procedure TfrmStart.FormCreate (Sender : TObject );
begin
  Top := 0;
  Left := 0;
end;

procedure TfrmStart.btnNewCharClick (Sender : TObject );
var
  NewCharacter : TfrmCharacter;
begin
	NewCharacter := TfrmCharacter.Create (Application);
  if (Sender = btnNewChar) then begin
  	NewCharacter.Caption := 'Player Character';
    NewCharacter.CharacterType := fcPlayer;
  end else if (Sender = btnNewMinion) then begin
    NewCharacter.Caption := 'Monster (Minion)';
    NewCharacter.CharacterType := fcMinion;
  end else if (Sender = btnNewStandard) then begin
    NewCharacter.Caption := 'Monster (Standard)';
    NewCharacter.CharacterType := fcStandard;
  end else if (Sender = btnNewExcept) then begin
    NewCharacter.Caption := 'Monster (Exceptional)';
    NewCharacter.CharacterType := fcExceptional;
  end else if (Sender = btnNewElite) then begin
    NewCharacter.Caption := 'Monster (Elite)';
    NewCharacter.CharacterType := fcElite;
  end;
  NewCharacter.Show;
end;

end.

