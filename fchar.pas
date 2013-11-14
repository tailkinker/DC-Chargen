unit fchar;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  ComCtrls, StdCtrls,
  dChar, lRaces;

type

  { TfrmCharacter }

  TfrmCharacter = class (TForm )
    btnAcquireFeat : TButton;
    btnLevelUp : TButton;
    btnTrainWeapon : TButton;
    btnTrainSkill : TButton;
    cmbClass : TComboBox;
    cmbPreferredWeapon : TComboBox;
    cmbRace : TComboBox;
    cmbSkillSelect : TComboBox;
    grpAttributes : TGroupBox;
    grpSkillList : TGroupBox;
    Label1 : TLabel;
    Label10 : TLabel;
    Label11 : TLabel;
    Label12 : TLabel;
    Label13 : TLabel;
    Label14 : TLabel;
    Label15 : TLabel;
    Label16 : TLabel;
    Label17 : TLabel;
    Label18 : TLabel;
    Label19 : TLabel;
    Label2 : TLabel;
    Label20 : TLabel;
    Label21 : TLabel;
    Label22 : TLabel;
    Label23 : TLabel;
    Label24 : TLabel;
    labPreferredWeapon : TLabel;
    Label3 : TLabel;
    Label4 : TLabel;
    Label5 : TLabel;
    Label6 : TLabel;
    Label7 : TLabel;
    Label8 : TLabel;
    Label9 : TLabel;
    lstFeatsAvailable : TListBox;
    lstFeatsTaken : TListBox;
    lstWeaponSkills : TListBox;
    lstWeaponsTrained : TListBox;
    pcMain : TPageControl;
    tabAttributes : TTabSheet;
    tabFeats : TTabSheet;
    tabEquipment : TTabSheet;
    tabWeapons : TTabSheet;
    tabSkills : TTabSheet;
    txtCharacterLevel : TLabeledEdit;
    txtCharacterName : TLabeledEdit;
    txtFeatsRemaining : TEdit;
    txtHitPoints : TLabeledEdit;
    txtRaceDescription : TMemo;
    txtSkillPointsLeft : TLabeledEdit;
    txtSurgeValue : TLabeledEdit;
    txtWeaponsLeftToTrain : TLabeledEdit;

    procedure btnAcquireFeatClick (Sender : TObject );
    procedure btnIncAttrClick (Sender : TObject );
    procedure btnLevelUpClick (Sender : TObject );
    procedure btnTrainSkillClick (Sender : TObject );
    procedure btnTrainWeaponClick (Sender : TObject );
    procedure cmbClassChange (Sender : TObject );
    procedure cmbRaceChange (Sender : TObject );
    procedure cmbSkillSelectChange (Sender : TObject );
    procedure FormClose (Sender : TObject; var CloseAction : TCloseAction );
    procedure FormCreate (Sender : TObject );
    procedure lstFeatsAvailableClick (Sender : TObject );
    procedure pcMainChange(Sender: TObject);
    procedure SetCharType (aCharType : byte);
  private
    { private declarations }
    t_CharType : byte;
    Character : tCharacter;

    // Dynamic Controls
  	txtClassAttr,
    txtRaceAttr,
    txtLevelAttr,
    txtTotalAttr,
    txtAttrBonus: array [0..5] of TEdit;
    btnIncAttr : array [0..5] of TButton;
    labAttrDec : array [0..5, 0..2] of TLabel;
    labSkillList : array [0..18, 0..5] of TLabel;

    procedure UpdateAttributes;
    procedure PopulateSkillList;
    procedure PopulateWeaponsList;
    procedure PopulateFeatsList;
  public
    property CharacterType : byte read t_CharType write SetCharType;
    { public declarations }
  end;

const
  fcPlayer = 0;
  fcMinion = 1;
  fcStandard = 2;
  fcExceptional = 3;
  fcElite = 4;

implementation

uses
  dweapons, lfeats;

{$R *.lfm}

{ TfrmCharacter }

procedure TfrmCharacter.SetCharType (aCharType : byte);
var
  limit,
  index : integer;
begin
  if (aCharType in [0..4]) then begin
  	t_CharType := aCharType;
    Character.CharacterType := aCharType;
  end;
  cmbClass.ItemIndex := cmbClass.Items.IndexOf ('Soldier');

  if (t_CharType > 0) then
  	cmbClass.Items.Add ('Brute');

  cmbRace.Items.Clear;
  for index := 0 to RaceCount - 1 do
  	if ((t_CharType > 0) or (Races [index].Monster = FALSE)) then
      cmbRace.Items.Add (Races [index].Name);
  cmbRace.ItemIndex := cmbRace.Items.IndexOf ('Human');

  Character.SetRace ('Human');
  Character.SetClass ('Soldier');
  PopulateSkillList;
  UpdateAttributes;
end;

procedure TfrmCharacter.FormClose (Sender : TObject; var CloseAction : TCloseAction );
begin
  CloseAction := caFree;
end;

procedure TfrmCharacter.cmbClassChange (Sender : TObject );
begin
  Character.SetClass (cmbClass.Items [cmbClass.ItemIndex]);
  PopulateSkillList;
  PopulateWeaponsList;
  UpdateAttributes;
end;

procedure TfrmCharacter.btnIncAttrClick (Sender : TObject );
var
  attrIndex : integer;
begin
  attrIndex := TControl (Sender).Tag;
  if (Character.AttrBumps > 0) then begin
    Character.Bump (attrIndex);
    TControl (Sender).Enabled := FALSE;
  end;
  if (Character.AttrBumps = 0) then
  	for attrIndex := 0 to 5 do
      btnIncAttr [attrIndex].Enabled := FALSE;
  UpdateAttributes;
end;

procedure TfrmCharacter.btnAcquireFeatClick (Sender : TObject );
begin
  Character.AcquireFeat(lstFeatsAvailable.Items [lstFeatsAvailable.ItemIndex]);
  btnAcquireFeat.Enabled := FALSE;
  PopulateFeatsList;
end;

procedure TfrmCharacter.btnLevelUpClick (Sender : TObject );
var
  index,
  Highest : integer;
  Matched : boolean;
begin
  // DING!
  btnLevelUp.Enabled := FALSE;
  pcMain.ActivePage := tabAttributes;
  Character.Ding;

  // Enable bumps
  for index := 0 to 5 do
    btnIncAttr [index].Enabled := TRUE;

  // Highest Attribute cannot be bumped
  Highest := 0;
  with (Character) do begin
	  for index := 1 to 5 do
  	  if (Attributes [Highest, 3] < Attributes [index, 3]) then
        Highest := index;
    Matched := FALSE;
    for index := 0 to 5 do
      if ((Attributes [index, 3] = Attributes [Highest, 3])
      	and (Highest <> index)) then
      	Matched := TRUE;
  end;
  if not Matched then
    btnIncAttr [Highest].Enabled := FALSE;

  cmbRace.Enabled := FALSE;
  cmbClass.Enabled := FALSE;
  PopulateSkillList;
  UpdateAttributes;
end;

procedure TfrmCharacter.btnTrainSkillClick (Sender : TObject );
begin
  Character.TrainSkill (cmbSkillSelect.Items [cmbSkillSelect.ItemIndex]);
  PopulateSkillList;
  UpdateAttributes;
end;

procedure TfrmCharacter.btnTrainWeaponClick (Sender : TObject );
var
  WeaponIndex : integer;
begin
  // Find out which weapon they've selected
  if (lstWeaponSkills.ItemIndex >= 0) then begin
    WeaponIndex := 0;
    while ((lstWeaponSkills.Items [lstWeaponSkills.ItemIndex] <>
    	WeaponData [WeaponIndex].Name) AND (WeaponIndex < 50)) do
			WeaponIndex += 1;

    if (WeaponIndex in [0..WeaponCount]) then begin
      // Set the training for that weapon in the character record
			Character.Weapons [WeaponIndex] := Character.Weapons [WeaponIndex] OR 1;
      // Repopulate the Trained Weapons List
      PopulateWeaponsList;
    end;
  end;
end;

procedure TfrmCharacter.cmbRaceChange (Sender : TObject );
var
  index : integer;
begin
  with (Character) do begin
    SetRace (cmbRace.Items [cmbRace.ItemIndex]);

    // Zero out Skill Training
    if (CharClass in [0..8]) then
      PopulateSkillList;

    // Racial Skills
    for index := 0 to 18 do
      Skills [index, 3] := pRace.Skills [index];

    // Zero out Attribute Bumps
    if (Level = 1) then
      for index := 0 to 5 do
        Attributes [index, 2] := 0;

    if (AttrBumps = 0) then
      for index := 0 to 5 do
        btnIncAttr [index].Enabled := FALSE
    else
      for index := 0 to 5 do
        btnIncAttr [index].Enabled := TRUE;
  end;
	txtRaceDescription.Lines.Clear;
  txtRaceDescription.Lines.Add (Character.pRace.Description);
  Character.SetClass (cmbClass.Items [cmbClass.ItemIndex]);
  UpdateAttributes;
end;

procedure TfrmCharacter.cmbSkillSelectChange (Sender : TObject );
begin
  if (Character.SkillPoints > 0) then
    btnTrainSkill.Enabled := true;
end;

procedure TfrmCharacter.FormCreate (Sender : TObject );
var
  column,
  index : integer;
begin
  Left := (Screen.Width div 2) - (Width div 2);
  Top := (Screen.Height div 2) - (Height div 2);

  // Populate list of Feats
  SetLength (FeatList, aFeatCount + 1);
  for index := 0 to aFeatCount do
    FeatList [index] := aFeats [index];

  // Primary Creation
  Character := tCharacter.Create;
  pcMain.ActivePage := tabAttributes;

  for index := 0 to 5 do begin
    // Class Attribute Boxes
  	txtClassAttr [index] := TEdit.Create (self);
    with (txtClassAttr [index]) do begin
      Parent := grpAttributes;
      Text := '10';
      Left := 80;
      Top := 40 + 30 * index;
      Width := 30;
      ReadOnly := TRUE;
      Alignment := taCenter;
    end;
    // Race Attribute Boxes
  	txtRaceAttr [index] := TEdit.Create (self);
    with (txtRaceAttr [index]) do begin
      Parent := grpAttributes;
      Text := '0';
      Left := 140;
      Top := 40 + 30 * index;
      Width := 30;
      ReadOnly := TRUE;
      Alignment := taCenter;
    end;
    // Level Attribute Boxes
  	txtLevelAttr [index] := TEdit.Create (self);
    with (txtLevelAttr [index]) do begin
      Parent := grpAttributes;
      Text := '0';
      Left := 200;
      Top := 40 + 30 * index;
      Width := 30;
      ReadOnly := TRUE;
      Alignment := taCenter;
    end;
    // Total Attribute Boxes
  	txtTotalAttr [index] := TEdit.Create (self);
    with (txtTotalAttr [index]) do begin
      Parent := grpAttributes;
      Text := '10';
      Left := 260;
      Top := 40 + 30 * index;
      Width := 30;
      ReadOnly := TRUE;
      Alignment := taCenter;
    end;
    // Attribute Bonus Boxes
  	txtAttrBonus [index] := TEdit.Create (self);
    with (txtAttrBonus [index]) do begin
      Parent := grpAttributes;
      Text := '+0';
      Left := 320;
      Top := 40 + 30 * index;
      Width := 30;
      ReadOnly := TRUE;
      Alignment := taCenter;
    end;
    // Attribute Increment Button
    btnIncAttr [index] := TButton.Create (self);
    with (btnIncAttr [index]) do begin
      Parent := grpAttributes;
      Caption := '+';
      Left := 5;
      Top := 40 + 30 * index;
      Height := 18;
      Width := 18;
      Tag := index;
      OnClick := @btnIncAttrClick;
    end;
  end;

  // Decorations
  for index := 0 to 5 do
    for column := 0 to 2 do begin
      labAttrDec [index, column] := TLabel.Create (self);
      with (labAttrDec [index, column]) do begin
        Parent := grpAttributes;
        Alignment := taCenter;
        AutoSize := FALSE;
        Left := 115 + Column * 60;
        Top := 45 + 30 * index;
        Width := 20;
        Height := 18;
        if (column = 2) then
          Caption := '='
        else
          Caption := '+';
      end;
    end;

  // Skill List
  for index := 0 to 18 do begin
  	labSkillList [index, 0] := TLabel.Create (self);
    with (labSkillList [index, 0]) do begin
      Parent := grpSkillList;
    	Caption := SkillNames [index];
      Left := 8;
      Top := 24 + 20 * index;
    end;
    for column := 1 to 5 do begin
      labSkillList [index, column] := TLabel.Create (self);
      with (labSkillList [index, column]) do begin
        Parent := grpSkillList;
        AutoSize := FALSE;
        Alignment := taCenter;
      	Caption := '+0';
        Left := 90 + 60 * column;
        Top := 24 + 20 * index;
        Width := 40;
        Height := 18;
      end;
    end;
  end;
  PopulateSkillList;
  PopulateWeaponsList;

  // Fix spacing issues
  // Root
  pcMain.Width := pcMain.Parent.Width - 16;
  txtCharacterLevel.Left := txtCharacterLevel.Parent.Width -
  	(txtCharacterLevel.Width + 8);


  // Skills Page
  grpSkillList.Left := tabSkills.Width - (grpSkillList.Width + 8);

  // Weapon Training Page
    lstWeaponSkills.Width := (tabWeapons.Width - 24) div 2;
  lstWeaponsTrained.Width := lstWeaponSkills.Width;
  lstWeaponsTrained.Left := lstWeaponSkills.Width + 16;
  Label21.Left := lstWeaponsTrained.Left;
  txtWeaponsLeftToTrain.Left := tabWeapons.Width -
  	(txtWeaponsLeftToTrain.Width + 8);
  cmbPreferredWeapon.Left := tabWeapons.Width -
  	(cmbPreferredWeapon.Width + 8);
  labPreferredWeapon.Left := cmbPreferredWeapon.Left -
  	(labPreferredWeapon.Width + 8);

  // Feats Page
  lstFeatsAvailable.Width := (tabFeats.Width - 24) div 2;
  lstFeatsTaken.Width := lstFeatsAvailable.Width;
  lstFeatsTaken.Left := lstFeatsAvailable.Width + 16;
  Label23.Left := lstFeatsTaken.Left;
  txtFeatsRemaining.Left := tabFeats.Width - (txtFeatsRemaining.Width + 8);
  Label24.Left := txtFeatsRemaining.Left - (Label24.Width + 8);

end;

procedure TfrmCharacter.lstFeatsAvailableClick (Sender : TObject );
begin
  if (lstFeatsAvailable.Items [lstFeatsAvailable.ItemIndex] <> '') then
    btnAcquireFeat.Enabled := TRUE;
end;

procedure TfrmCharacter.pcMainChange(Sender: TObject);
begin
  PopulateFeatsList;
end;

procedure TfrmCharacter.UpdateAttributes;
var
  index : integer;
  s : string;
  LevelUp : boolean;
begin
  str (Character.Level, s);
  txtCharacterLevel.Text := s;
	for index := 0 to 5 do begin
    // Class Attributes
    str (Character.Attributes [index, 0], s);
    txtClassAttr [index].Text := s;

    // Race Attributes
    str (Character.Attributes [index, 1], s);
    txtRaceAttr [index].Text := s;

    // Level Attributes
    str (Character.Attributes [index, 2], s);
    txtLevelAttr [index].Text := s;

    // Total Attributes
    Character.Attributes [index, 3] := Character.Attributes [index, 0] +
    	Character.Attributes [index, 1] + Character.Attributes [index, 2];
    str (Character.Attributes [index, 3], s);
    txtTotalAttr [index].Text := s;

    // Bonus
    if (Character.Attributes [index, 3] < 10) then
	    Character.Attributes [index, 4] :=
  	  	trunc ((Character.Attributes [index, 3] - 11) / 2)
    else
      Character.Attributes [index, 4] :=
	  	  trunc ((Character.Attributes [index, 3] - 10) / 2);
    str (Character.Attributes [index, 4], s);
    if (Character.Attributes [index, 4] >= 0) then
    	s := '+' + s;
    txtAttrBonus [index].Text := s;
  end;

  // Hit Points and Mana
  str (Character.SurgeValue, s);
  txtSurgeValue.Text := s;
	str (Character.HitPoints, s);
  txtHitPoints.Text := s;

  // Skills
  with (Character) do begin
		for index := 0 to 18 do begin
    	Skills [index, 0] := Attributes [SkillData [index, 0], 4];

      // Attribute
      str (Skills [index, 0], s);
      if (Skills [index, 0] >= 0) then
        s := '+' + s;
      labSkillList [index, 1].Caption := s;

      // Trained
      str (Skills [index, 1], s);
      if (Skills [index, 1] >= 0) then
        s := '+' + s;
      labSkillList [index, 2].Caption := s;

      // Level Bonus
      Skills [index, 2] := Level div 2;
      str (Skills [index, 2], s);
      if (Skills [index, 2] >= 0) then
        s := '+' + s;
      labSkillList [index, 3].Caption := s;

      // Race
      str (Skills [index, 3], s);
      if (Skills [index, 3] >= 0) then
        s := '+' + s;
      labSkillList [index, 4].Caption := s;

      // Total
      Skills [index, 5] := Skills [index, 0] + Skills [index, 1]
      	+ Skills [index, 2] + Skills [index, 3];
      str (Skills [index, 5], s);
      if (Skills [index, 5] >= 0) then
        s := '+' + s;
      if ((Skills [index, 1] = 0) and (SkillData [index, 1] = 1)) then
        s := '';
      labSkillList [index, 5].Caption := s;
  	end;
    str (SkillPoints, s);
    txtSkillPointsLeft.Text := s;
  end;

  // Check for Level Up Enabled
  LevelUp := TRUE;
  if (Character.AttrBumps > 0) then
    LevelUp := FALSE;
  if (Character.SkillPoints > 0) then
    LevelUp := FALSE;
  btnLevelUp.Enabled := LevelUp;
end;

procedure TfrmCharacter.PopulateSkillList;
var
  index : integer;
begin
  cmbSkillSelect.Items.Clear;
  with (Character) do
    if (SkillPoints > 0) then begin
      btnTrainSkill.Enabled := TRUE;
      for index := 0 to 18 do
      	if (Skills [index, 1] = 0) then
          if (Level > 1) then
            cmbSkillSelect.Items.Add (SkillNames [index])
          else if (ClassSkills [index, CharClass] = 1) then
        	  cmbSkillSelect.Items.Add (SkillNames [index]);
    end else
    	btnTrainSkill.Enabled := FALSE;
end;

procedure TFrmCharacter.PopulateWeaponsList;
var
  t : string;
  Count,
  index : integer;
begin
  Count := ClassAttributes [Character.CharClass, 12];
  for index := 0 to WeaponCount do
    if (Character.Weapons [index] > 0) then
      Count -= 1;
	str (Count, t);
  txtWeaponsLeftToTrain.Text := t;
  if (Count > 0) then
    btnTrainWeapon.Enabled := TRUE
  else
  	btnTrainWeapon.Enabled := FALSE;

  lstWeaponSkills.Items.Clear;
  for index := 0 to WeaponCount do
    if (Character.CharClass = 3) then begin
    	if ((WeaponData [index].TypeOF AND 4) = 4) then
        if (Character.Weapons [index] = 0) then
          lstWeaponSkills.Items.Add (WeaponData [index].Name)
    end else begin
  	  if ((WeaponData [index].TypeOF AND 1) = 1) then
        if (Character.Weapons [index] = 0) then
          lstWeaponSkills.Items.Add (WeaponData [index].Name);
    end;
  lstWeaponsTrained.Items.Clear;
  for index := 0 to WeaponCount do
    if (Character.Weapons [index] > 0) then
      lstWeaponsTrained.Items.Add (WeaponData [index].Name);
end;

procedure TfrmCharacter.PopulateFeatsList;
var
  search,
  index : integer;
  s,
  t : string;
  match,
  Include : boolean;
begin
  lstFeatsAvailable.Items.Clear;
  for index := 0 to (FeatCount - 1) do begin
    s := FeatList [index].FeatName;
    Include := TRUE;

    // Does the character already have it?
    for search := 0 to 19 do
      if (Character.FeatsHave [search] = s) then
        Include := FALSE;

    // Is character of the correct Level?
    if (FeatList [index].LevelNeed = 1) then
       if (Character.Level <> 1) then
         Include := FALSE;
    if (FeatList [index].LevelNeed > Character.Level) then
      Include := FALSE;

    // Does it require a certain Skill?
    search := 0;
    match := FALSE;
    repeat
      if (SkillNames [search] = FeatList [index].SkillNeed) then
        match := true
      else
        search += 1;
    until (match OR (search = 19));

    if (match) then
      if (Character.Skills [search, 1] = 0) then
        Include := FALSE;

    // Does it require a certain Feat?
    t := FeatList [index].FeatNeed;
    if (t <> '') then begin
      match := FALSE;
      for search := 0 to 19 do
        if (Character.FeatsHave [search] = t) then
          match := TRUE;
      Include := match;
    end;

    // Does it require a certain Attribute?
    if (FeatList [index].AttrNeed [0] > 0) then begin
      search := FeatList [index].AttrNeed [0] - 1;
      if (Character.Attributes [search, 3] < FeatList [index].AttrNeed [1]) then
        Include := FALSE;
    end;

    if (Include) then
      lstFeatsAvailable.Items.Add (s);
  end;
  str (Character.Feats, t);
  txtFeatsRemaining.Text := t;

  // Now add the Feats that the character actually has
  lstFeatsTaken.Items.Clear;
  for index := 0 to 19 do
    if (Character.FeatsHave [index] <> '') then
      lstFeatsTaken.Items.Add (Character.FeatsHave [index]);
end;

end.

