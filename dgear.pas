unit dgear;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

const
  gtMelee = 0;
  gtBow = 1;
  gtCrossbow = 2;
  gtArmour = 3;
  gtShield = 4;

  CommaChar : char = ',';

  DamageCodes : array [0..28] of string =
    (
    '1d2', '1d3', '1d4', '1d6', '1d8',
    '2d4', '1d10', '1d12', '2d6', '2d8',
    '3d6', '2d10', '2d12', '3d8', '4d6',
    '3d10', '5d6', '4d8', '3d12', '6d6',
    '4d10', '7d6', '4d12', '5d10', '6d8',
    '8d6', '7d8', '9d6', '5d12'
    );


type
  tDamageRecord = record
    Amount,
    TypeOf,
    MinStr,
    Actions,
    Reach : integer;
  end;

  tGearRecord = record
    Name,
    Description : string;
    TypeOf : byte;
    Cost,
    Mass,
    Length,
    Skill,
    MaxDex,
    Tag : integer;
    Range : array [0..2] of integer;
    Damage : array [0..4, 0..2] of tDamageRecord;
  end;

function ReachVal (aReach : integer) : string;
function WordFor (T : longint) : String;
function InsertCommas (T : LongInt) : String;
function WriteCost (Cost : integer) : string;
function WriteMass (aMass : integer) : string;
function WriteLength (aLength : integer) : string;

implementation

uses
  tmath;

function ReachVal (aReach : integer) : string;
var
	x,
	y : integer;
	t : string;
begin
	if (aReach = 0) then
		t := '0'
	else begin
		x := aReach div 4;
		y := aReach mod 4;
		if (x > 0) then
			str (x, t)
		else
			t := '';
		case (y) of
			1 : t += '\[14]';
			2 : t += '\[12]';
			3 : t += '\[34]';
		end;
	end;
	ReachVal := t;
end;

function WordFor (T : longint) : String;
{
Returns a string representation of an integer, expressed in English.  Values up
to 999,999 can be translated.
}
var
  Thousands,
  Hundreds,
  Tens,
  Ones : byte;
  S : String;
const
  T1 : array [1..9] of string =
  	(
  	'one', 'two', 'three',
  	'four', 'five', 'six',
  	'seven', 'eight', 'nine'
  	);
  T2 : array [0..9] of string =
  	(
  	'ten', 'eleven', 'twelve', 'thirteen', 'fourteen',
  	'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen'
  	);
  T3 : array [2..9] of string =
  	(
  	'twenty', 'thirty', 'forty', 'fifty',
  	'sixty', 'seventy', 'eighty', 'ninety'
  	);
begin
  S := '';
  Thousands := T div 1000;
  Hundreds := (T div 100) - Thousands * 10;
  Ones := T mod 10;
  Tens := (T mod 100) div 10;

  if (Thousands > 0) then
  	S := S + T1 [Thousands] + ' thousand';
  if (Thousands <> 0) and (Hundreds <> 0) then
  	S := S + ' ';
  if (Hundreds > 0) then
  	S := S + T1 [Hundreds] + ' hundred';

  if ((Thousands <> 0) or (Hundreds <> 0)) and ((Tens + Ones) <> 0) then
  	S := S + ' and ';

  if (Tens = 1) then
  	S := S + T2 [Ones]
  else if (Tens > 1) then
  	begin
  		S := S + T3 [Tens];
  		if (Ones > 0) then
  		S := S + '-' + T1 [Ones];
  	end
  else if (Tens = 0) then
  	if (Ones > 0) then
  		S := S + T1 [Ones];
  WordFor := S;
end;


function InsertCommas (T : LongInt) : String;
{
Returns a string representation of a longint, with commas placed every three
digits.  The CommaChar variable defaults to a standard comma, but can be
replaced with any other character.
}
var
	R,
	S : String;
	U : LongInt;
begin
	if (T = 0) then
		S := '0'
	else
		begin
			S := '';
			U := T;
			repeat
			  Str (U mod 1000, R);
			  Trim (R);
			  if (U mod 1000) = 0 then
				  R := '000';
			  if (U div 1000) > 0 then
				  while Length (R) < 3 do
					  R := '0' + R;
			  S := R + S;
			  IF (U >= 1000) then
				  S := CommaChar + S;
			  U := U div 1000;
			until (U = 0);
		end;
	InsertCommas := S;
end;

function WriteCost (Cost : integer) : string;
var
  t : string;
begin
	if (Cost > 150) then begin
    t := InsertCommas (ceil (Cost / 100));
    t += 'gp';
  end else if (Cost > 15) then begin
    str (ceil (Cost / 10), t);
    t += 'sp';
  end else begin
    str (Cost, t);
    t += 'cp';
  end;
	WriteCost := t
end;

function WriteLength (aLength : integer) : string;
var
  feet,
  inches : integer;
  s,
  t : string;
begin
	feet := aLength div 12;
  inches := aLength mod 12;
  s := '';
  if (feet > 0) then begin
    str (feet, t);
    s += t + '''';
  end;
  if (inches > 0) then begin
    str (inches, t);
    s += t + '"';
  end;
  WriteLength := s;
end;

function WriteMass (aMass : integer) : string;
var
  pounds,
  ounces : integer;
  s,
  t : string;
begin
	pounds := aMass div 16;
  ounces := aMass mod 16;
  s := '';
  if (pounds > 0) then begin
  	str (pounds, t);
    s += t + 'lb';
    if (pounds > 1) then
      s += 's';
    if (ounces > 0) then
      s += ' ';
  end;
  if (ounces > 0) then begin
    str (ounces, t);
    s += t + 'oz';
  end;
  WriteMass := s;
end;

end.



