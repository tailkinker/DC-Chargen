unit lfeats;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  FeatRec = record
  FeatName : string;
  ClassNeed : string;
  LevelNeed : byte;
  SkillNeed : string;
  AttrNeed : array [0..1] of byte;
  FeatNeed : string;
  Affects : array [0..3] of string;
end;

const
  aFeatCount = 66;
  aFeats : array [0..aFeatCount] of FeatRec = (
    ( FeatName: 'Acid Mastery';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Affects: (
        'Damage:Acid:+T',
        '',
        '',
        ''
      )
    ),
    ( FeatName: 'Alert';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Affects: (
        'Stat:Perception:+2',
        '',
        '',
        ''
      )
    ),
    ( FeatName: 'Ambidexterity';
      ClassNeed: '';
      LevelNeed: 1;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Affects: (
        '',
        '',
        '',
        ''
      )
    ),
    ( FeatName: 'Arcane Dabbler';
      ClassNeed: '';
      LevelNeed: 6;
      SkillNeed: '';
      AttrNeed: (4, 9);
      FeatNeed: '';
      Affects: (
        '',
        '',
        '',
        ''
      )
    ),
    ( FeatName: 'Blind Fighting';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Affects: (
        '',
        '',
        '',
        ''
      )
    ),
    ( FeatName: 'Cleave';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (1, 13);
      FeatNeed: '';
      Affects: (
        '',
        '',
        '',
        ''
      )
    ),
    ( FeatName: 'Cold Mastery';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Affects: (
        'Damage:Cold:+T',
        '',
        '',
        ''
      )
    ),
    ( FeatName: 'Combat Caster';
      ClassNeed: '';
      LevelNeed: 6;
      SkillNeed: '';
      AttrNeed: (5, 13);
      FeatNeed: '';
      Affects: (
        '',
        '',
        '',
        ''
      )
    ),
    ( FeatName: 'Demonic Heritage';
      ClassNeed: '';
      LevelNeed: 6;
      SkillNeed: '';
      AttrNeed: (6, 9);
      FeatNeed: '';
      Affects: (
        '',
        '',
        '',
        ''
      )
    ),
    ( FeatName: 'Diehard';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (3, 13);
      FeatNeed: '';
      Affects: (
        '',
        '',
        '',
        ''
      )
    ),
    ( FeatName: 'Energy Resistance (Acid)';
      ClassNeed: '';
      LevelNeed: 11;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Affects: (
        '',
        '',
        '',
        ''
      )
    ),
    ( FeatName: 'Energy Resistance (Cold)';
      ClassNeed: '';
      LevelNeed: 11;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Affects: (
        '',
        '',
        '',
        ''
      )
    ),
    ( FeatName: 'Energy Resistance (Fire)';
      ClassNeed: '';
      LevelNeed: 11;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Affects: (
        '',
        '',
        '',
        ''
      )
    ),
    ( FeatName: 'Energy Resistance (Force)';
      ClassNeed: '';
      LevelNeed: 11;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Affects: (
        '',
        '',
        '',
        ''
      )
    ),
    ( FeatName: 'Energy Resistance (Lightning)';
      ClassNeed: '';
      LevelNeed: 11;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Affects: (
        '',
        '',
        '',
        ''
      )
    ),
    ( FeatName: 'Energy Resistance (Necrotic)';
      ClassNeed: '';
      LevelNeed: 11;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Affects: (
        '',
        '',
        '',
        ''
      )
    ),
    ( FeatName: 'Energy Resistance (Psychic)';
      ClassNeed: '';
      LevelNeed: 11;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Affects: (
        '',
        '',
        '',
        ''
      )
    ),
    ( FeatName: 'Energy Resistance (Radiant)';
      ClassNeed: '';
      LevelNeed: 11;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Affects: (
        '',
        '',
        '',
        ''
      )
    ),
    ( FeatName: 'Expert Healer';
      ClassNeed: 'Cleric';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (5, 13);
      FeatNeed: '';
      Affects: (
        'Fast Dodge',
        '',
        '',
        ''
      )
    ),
    ( FeatName: ',,,2,11,';
      ClassNeed: 'Fire Mastery';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Affects: (
        '',
        '',
        '',
        ''
      )
    ),
    ( FeatName: 'Damage:Fire:+T,,,';
      ClassNeed: 'Great Cleave';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Affects: (
        '',
        '',
        '',
        '15'
      )
    ),
    ( FeatName: ',,,';
      ClassNeed: 'Greater Energy Resistance (Acid)';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Affects: (
        '',
        '21',
        '',
        ''
      )
    ),
    ( FeatName: ',,,';
      ClassNeed: 'Greater Energy Resistance (Cold)';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Affects: (
        '',
        '21',
        '',
        ''
      )
    ),
    ( FeatName: ',,,';
      ClassNeed: 'Greater Energy Resistance (Fire)';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Affects: (
        '',
        '21',
        '',
        ''
      )
    ),
    ( FeatName: ',,,';
      ClassNeed: 'Greater Energy Resistance (Force)';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Affects: (
        '',
        '21',
        '',
        ''
      )
    ),
    ( FeatName: ',,,';
      ClassNeed: 'Greater Energy Resistance (Lightning)';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Affects: (
        '',
        '21',
        '',
        ''
      )
    ),
    ( FeatName: ',,,';
      ClassNeed: 'Greater Energy Resistance (Necrotic)';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Affects: (
        '',
        '21',
        '',
        ''
      )
    ),
    ( FeatName: ',,,';
      ClassNeed: 'Greater Energy Resistance (Psychic)';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Affects: (
        '',
        '21',
        '',
        ''
      )
    ),
    ( FeatName: ',,,';
      ClassNeed: 'Greater Energy Resistance (Radiant)';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Affects: (
        '',
        '21',
        '',
        ''
      )
    ),
    ( FeatName: ',,,';
      ClassNeed: 'Improved Cleave';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Affects: (
        '',
        '',
        '',
        '13'
      )
    ),
    ( FeatName: ',,,';
      ClassNeed: 'Improved Critical';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Affects: (
        '',
        '16',
        '',
        ''
      )
    ),
    ( FeatName: ',,,';
      ClassNeed: 'Improved Initiative';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Affects: (
        '',
        '',
        '',
        ''
      )
    ),
    ( FeatName: 'Stat:Initiative:+4,,,';
      ClassNeed: 'Iron Skin';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Affects: (
        '',
        '16',
        '',
        ''
      )
    ),
    ( FeatName: ',,,';
      ClassNeed: 'Iron Will';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Affects: (
        '',
        '',
        '',
        '13'
      )
    ),
    ( FeatName: 'Stat:Will:+2,,,';
      ClassNeed: 'Language Training 1';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Affects: (
        '',
        '',
        '',
        '11'
      )
    ),
    ( FeatName: ',,,';
      ClassNeed: 'Language Training 2';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Affects: (
        '',
        '',
        '',
        '13'
      )
    ),
    ( FeatName: ',,,';
      ClassNeed: 'Language Training 3';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Affects: (
        '',
        '',
        '',
        '15'
      )
    ),
    ( FeatName: ',,,';
      ClassNeed: 'Language Training 4';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Affects: (
        '',
        '',
        '',
        '17'
      )
    ),
    ( FeatName: ',,,';
      ClassNeed: 'Language Training 5';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Affects: (
        '',
        '',
        '',
        '19'
      )
    ),
    ( FeatName: ',,,';
      ClassNeed: 'Language Training 6';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Affects: (
        '',
        '',
        '',
        '21'
      )
    ),
    ( FeatName: ',,,';
      ClassNeed: 'Language Training 7';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Affects: (
        '',
        '',
        '',
        '23'
      )
    ),
    ( FeatName: ',,,';
      ClassNeed: 'Large And In Charge';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Affects: (
        '',
        '',
        '',
        '13'
      )
    ),
    ( FeatName: ',,,';
      ClassNeed: 'Lay Priest';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Affects: (
        '',
        '6',
        '',
        '13'
      )
    ),
    ( FeatName: ',,,';
      ClassNeed: 'Lightning Mastery';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Affects: (
        '',
        '',
        '',
        ''
      )
    ),
    ( FeatName: 'Damage:Lightning:+T,,,';
      ClassNeed: 'Lightning Reflexes';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Affects: (
        '',
        '',
        '',
        '13'
      )
    ),
    ( FeatName: 'Stat:Reflexes:+2';
      ClassNeed: 'Lunge';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Affects: (
        '',
        '',
        '',
        ''
      )
    ),
    ( FeatName: ',,,';
      ClassNeed: 'Mobility';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Affects: (
        '',
        '',
        '',
        '13'
      )
    ),
    ( FeatName: ',,,';
      ClassNeed: 'Mounted Combat';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Affects: (
        '',
        '',
        'Nature',
        ''
      )
    ),
    ( FeatName: ',,,';
      ClassNeed: 'Necrotic Mastery';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Affects: (
        '',
        '',
        '',
        ''
      )
    ),
    ( FeatName: 'Damage:Necrotic:+T,,,';
      ClassNeed: 'Psychic Mastery';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Affects: (
        '',
        '',
        '',
        ''
      )
    ),
    ( FeatName: 'Damage:Psychic:+T,,,';
      ClassNeed: 'Quick Draw';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Affects: (
        '',
        '6',
        '',
        ''
      )
    ),
    ( FeatName: ',,,';
      ClassNeed: 'Radiant Mastery';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Affects: (
        '',
        '',
        '',
        ''
      )
    ),
    ( FeatName: 'Damage:Radiant:+T,,,';
      ClassNeed: 'Rapid Reload';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Affects: (
        '',
        '',
        '',
        ''
      )
    ),
    ( FeatName: ',,,';
      ClassNeed: 'Ritual Caster';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Affects: (
        '',
        '',
        '',
        ''
      )
    ),
    ( FeatName: ',,,';
      ClassNeed: 'Shot On The Run';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Affects: (
        '',
        '6',
        '',
        '15'
      )
    ),
    ( FeatName: ',,,';
      ClassNeed: 'Spell Mastery';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Affects: (
        '',
        '',
        '',
        ''
      )
    ),
    ( FeatName: ',,,';
      ClassNeed: 'Spring Attack';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Affects: (
        '',
        '6',
        '',
        '15'
      )
    ),
    ( FeatName: ',,,';
      ClassNeed: 'Swift';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Affects: (
        '',
        '',
        '',
        '11'
      )
    ),
    ( FeatName: 'Stat:Move:+1,,,';
      ClassNeed: 'Tough As Nails';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Affects: (
        '',
        '',
        '',
        '13'
      )
    ),
    ( FeatName: 'Toughness';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (3, 11);
      FeatNeed: '';
      Affects: (
        'Stat:Surge:+1',
        '',
        '',
        ''
      )
    ),
    ( FeatName: 'Two-Weapon Defense';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (2, 13);
      FeatNeed: '';
      Affects: (
        '',
        '',
        '',
        ''
      )
    ),
    ( FeatName: 'Two-Weapon Fighting';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (2, 15);
      FeatNeed: '';
      Affects: (
        '',
        '',
        '',
        ''
      )
    ),
    ( FeatName: 'Weapon Finesse (Dexterity)';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (2, 13);
      FeatNeed: '';
      Affects: (
        '',
        '',
        '',
        ''
      )
    ),
    ( FeatName: 'Weapon Finesse (Constitution)';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (3, 13);
      FeatNeed: '';
      Affects: (
        '',
        '',
        '',
        ''
      )
    ),
    ( FeatName: 'Weapon Finesse (Intelligence)';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (4, 13);
      FeatNeed: '';
      Affects: (
        '',
        '',
        '',
        ''
      )
    ),
    ( FeatName: 'Weapon Finesse (Wisdom)';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (5, 13);
      FeatNeed: '';
      Affects: (
        '',
        '',
        '',
        ''
      )
    ),
    ( FeatName: 'Weapon Finesse (Charisma)';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (6, 13);
      FeatNeed: '';
      Affects: (
        '',
        '',
        '',
        ''
      )
    )
  );

var
  FeatList : array of FeatRec;

function FeatCount : integer;

implementation

function FeatCount : integer;
begin
  FeatCount := length (FeatList);
end;

end.
