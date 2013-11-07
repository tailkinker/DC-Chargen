unit dchar;

{$mode objfpc}{$H+}{$M+}

interface

uses
  Classes, SysUtils,
  lraces, dweapons;

type
  tCharacter = class (tObject)
    private
      t_CharType : byte;
      t_Skills,
      t_Feats,
      t_Bumps,
      t_Race,
      t_Class,
      t_Level : integer;
      procedure SetCharType (aCharType : byte);
      procedure SetLevel (aLevel : integer);
      function GetSurgeValue : integer;
      function GetHitPoints : integer;
      function GetLevel : integer;
      procedure SetSkills (aSkills : integer);
    public
      pRace : tRace;
      Attributes : array [0..5, 0..4] of integer;
      Skills : array [0..18, 0..5] of integer;
      Weapons : array [0..WeaponCount] of byte;
      constructor Init;
      property CharacterType : byte read t_CharType write SetCharType;
      property CharRace : integer read t_Race;
      property CharClass : integer read t_Class;
			property Level : integer read GetLevel write SetLevel;
      property AttrBumps : integer read t_Bumps;
      property SurgeValue : integer read GetSurgeValue;
      property HitPoints : integer read GetHitPoints;
      property SkillPoints : integer read t_Skills write SetSkills;

      procedure SetRace (aRace : string);
      procedure SetClass (aClass : string);
      procedure TrainSkill (aSkill : string);
      procedure Bump (attrIndex : integer);
      procedure Ding;
  end;

const
  MIN_SURGE = 2;


  ClassNames : array [0..8] of string = (
    'Brute',
    'Cleric',
  	'Defender',
    'Monk',
    'Ranger',
    'Rogue',
    'Soldier',
    'Sorcerer',
    'Wizard'
    );

  ClassAttributes : array [0..8, 0..13] of integer = (
  // STR DEX CON INT WIS CHA  D  F  R  W  Sg Ma  Wp Sk
  	( 13, 11, 12,  8, 10,  9, 0, 2, 0, 0, 10, 6, 1, 1 ), // Brute
  	(  8, 11, 10,  9, 13, 12, 0, 2, 0, 2,  5, 4, 1, 1 ), // Cleric
		( 12, 10, 13,  8, 11,  9, 0, 2, 0, 0,  7, 6, 1, 2 ), // Defender
  	( 10, 13, 11,  8, 12,  9, 0, 2, 2, 2,  4, 2, 0, 3 ), // Monk
  	( 12, 13,  9, 10, 11,  8, 1, 2, 2, 0,  5, 6, 1, 2 ), // Ranger
  	(  9, 13, 10, 12,  8, 11, 2, 0, 2, 0,  3, 6, 1, 3 ), // Rogue
  	( 13, 11, 12,  8, 10,  9, 0, 2, 0, 0,  5, 6, 3, 2 ), // Soldier
  	(  8, 12, 11,  9, 10, 13, 0, 0, 2, 2,  3, 5, 1, 2 ), // Sorcerer
  	(  8, 12,  9, 13, 10, 11, 0, 0, 0, 2,  3, 4, 0, 2 )  // Wizard
  );

  SkillNames : array [0..18] of string = (
	  'Acrobatics',
	  'Arcana',
	  'Athletics',
	  'Bluff',
	  'Craft',
	  'Diplomacy',
	  'Dungeoneering',
	  'Endurance',
	  'Healing',
	  'History',
	  'Insight',
	  'Intimidate',
	  'Nature',
	  'Perception',
	  'Religion',
	  'Sleight of Hand',
	  'Stealth',
	  'Streetwise',
	  'Survival'
  );

  SkillData : array [0..18, 0..5] of integer = (
  // Attr Trn
	  (  1,  0,  0,  0,  0,  0 ),
	  (  3,  1,  0,  0,  0,  0 ),
	  (  0,  0,  0,  0,  0,  0 ),
	  (  5,  0,  0,  0,  0,  0 ),
	  (  3,  1,  0,  0,  0,  0 ),
	  (  5,  0,  0,  0,  0,  0 ),
	  (  3,  0,  0,  0,  0,  0 ),
	  (  2,  0,  0,  0,  0,  0 ),
	  (  4,  1,  0,  0,  0,  0 ),
	  (  3,  1,  0,  0,  0,  0 ),
	  (  4,  0,  0,  0,  0,  0 ),
	  (  5,  0,  0,  0,  0,  0 ),
	  (  4,  0,  0,  0,  0,  0 ),
	  (  4,  0,  0,  0,  0,  0 ),
	  (  3,  1,  0,  0,  0,  0 ),
	  (  1,  0,  0,  0,  0,  0 ),
	  (  1,  0,  0,  0,  0,  0 ),
	  (  5,  0,  0,  0,  0,  0 ),
	  (  4,  0,  0,  0,  0,  0 )
  );

  ClassSkills : array [0..18, 0..8] of byte = (
  // Br Cl De Mk Ra Ro So Sr Wi
	  ( 0, 0, 0, 1, 0, 1, 0, 0, 0 ), // Acrobatics
	  ( 0, 0, 0, 0, 0, 1, 0, 1, 1 ), // Arcana
	  ( 0, 0, 1, 1, 1, 1, 1, 0, 0 ), // Athletics
	  ( 0, 0, 0, 0, 0, 1, 0, 1, 0 ), // Bluff
	  ( 0, 1, 0, 0, 1, 1, 1, 0, 1 ), // Craft
	  ( 0, 1, 1, 1, 0, 1, 0, 1, 0 ), // Diplomacy
	  ( 0, 0, 1, 0, 0, 1, 1, 0, 1 ), // Dungeoneering
	  ( 0, 0, 1, 0, 0, 1, 0, 0, 0 ), // Endurance
	  ( 0, 1, 1, 0, 1, 1, 0, 0, 0 ), // Healing
	  ( 0, 1, 0, 1, 0, 1, 0, 0, 1 ), // History
	  ( 0, 1, 0, 1, 0, 1, 0, 0, 0 ), // Insight
	  ( 0, 0, 1, 0, 0, 1, 1, 1, 0 ), // Intimidate
	  ( 0, 0, 0, 0, 1, 1, 0, 0, 0 ), // Nature
	  ( 1, 0, 0, 0, 1, 1, 0, 0, 0 ), // Perception
	  ( 0, 2, 0, 1, 0, 1, 0, 0, 0 ), // Religion
	  ( 0, 0, 0, 0, 0, 2, 0, 0, 0 ), // Sleight of Hand
	  ( 1, 0, 0, 1, 1, 2, 0, 1, 0 ), // Stealth
	  ( 0, 0, 0, 0, 0, 1, 0, 0, 1 ), // Streetwise
	  ( 1, 0, 1, 0, 2, 1, 1, 0, 0 )  // Survival
  );

implementation

uses
  fChar;

constructor tCharacter.Init;
var
  index : integer;
begin
	t_Level := 1;
  t_CharType := fcPlayer;
  for index := 0 to WeaponCount do
    Weapons [index] := 0;
end;

procedure tCharacter.SetCharType (aCharType : byte);
begin
  if (aCharType in [0..4]) then
  	t_CharType := aCharType;
end;

procedure tCharacter.SetRace (aRace : string);
var
  index : integer;
begin
  t_Race := -1;
  for index := 0 to (RaceCount - 1) do
  	if (aRace = Races[index].Name) then
      t_Race := index;

  pRace := Races [t_Race];
  if (t_Race > -1) then begin
    for index := 0 to 5 do
      Attributes [index, 1] := pRace.Attributes [index];
  end;
  t_Bumps := 1;
  if (pRace.Traits [3]) then
  	t_Bumps += 1;
  for index := 0 to 5 do
    Attributes [index, 2] := 0;
  if (CharacterType = fcMinion) then
    t_Bumps -= 1
  else if (CharacterType = fcExceptional) then
    t_Bumps += 1
  else if (CharacterType = fcElite) then
    t_Bumps += 2;
end;

procedure tCharacter.SetClass (aClass : string);
var
  index : integer;
begin
  t_Class := -1;
	for index := 0 to 8 do
  	if (aClass = ClassNames [index]) then
    	t_Class := index;
  if (t_Class > -1) then begin
    for index := 0 to 5 do
    	Attributes [index, 0] := ClassAttributes [t_Class, index];
  end;
  t_Skills := ClassAttributes [t_Class, 13];
  for index := 0 to 18 do
		if (ClassSkills [index, t_Class] = 2) then
      Skills [index, 1] := 3
    else
      Skills [index, 1] := 0;
  if (pRace.Traits [1]) then
    t_Skills += 1;
end;

procedure tCharacter.Bump (attrIndex : integer);
var
  BumpValue : integer;
begin
	if (Level = 1) then
    BumpValue := 2
  else
    BumpValue := 1;
	Attributes [attrIndex, 2] += BumpValue;
  t_Bumps -= 1;
end;

function tCharacter.GetSurgeValue : integer;
var
  t : integer;
begin
	t := ClassAttributes [CharClass, 10] + Attributes [2, 4];
  if (t < MIN_SURGE) then
    t := MIN_SURGE;
  GetSurgeValue := t;
end;

function tCharacter.GetHitPoints : integer;
var
  t : integer;
begin
  t := SurgeValue;
  case (CharacterType) of
  	fcPlayer:
      t *= (Level + 3);
    fcStandard:
      t *= (Level + 3);
    fcExceptional:
      t *= (Level + 3) * 2;
    fcElite:
      t *= (Level + 3) * 4;
  end;
  GetHitPoints := t;
end;

procedure tCharacter.SetLevel (aLevel : integer);
begin
  if (aLevel > t_Level) then
    t_Level := aLevel;
end;

function tCharacter.GetLevel : integer;
var
  t : integer;
begin
  t := t_Level;
  if (pRace.Size = 2) then
    t += 4;
  GetLevel := t
end;

procedure tCharacter.SetSkills (aSkills : integer);
begin
  t_Skills := aSkills;
end;

procedure tCharacter.TrainSkill (aSkill : string);
var
  index : integer;
begin
  if (t_Skills > 0) then begin
  	index := 0;
    while ((SkillNames [index] <> aSkill) and (index < 19)) do
			index += 1;
    if (index in [0..18]) then begin
      Skills [index, 1] := 3;
      t_Skills -= 1;
    end;
  end;
end;


procedure tCharacter.Ding;
begin
  t_Level += 1;
  t_Bumps += 1;
  if ((Level mod 5) = 1) then
    t_Feats += 1;
  if ((t_Class = 5) and ((t_Level mod 5) = 0)) then
    t_Skills += 1;
end;

end.

