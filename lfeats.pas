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
  end;

const
  aFeats : array [0..61] of FeatRec = (
    ( FeatName: 'Acid Mastery';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: ''
    ),
    ( FeatName: 'Alert';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: ''
    ),
    ( FeatName: 'Ambidexterity';
      ClassNeed: '';
      LevelNeed: 1;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: ''
    ),
    ( FeatName: 'Arcane Dabbler';
      ClassNeed: '';
      LevelNeed: 6;
      SkillNeed: '';
      AttrNeed: (4, 9);
      FeatNeed: ''
    ),
    ( FeatName: 'Blind Fighting';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: ''
    ),
    ( FeatName: 'Cleave';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (1, 13);
      FeatNeed: ''
    ),
    ( FeatName: 'Cold Mastery';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: ''
    ),
    ( FeatName: 'Combat Caster';
      ClassNeed: '';
      LevelNeed: 6;
      SkillNeed: '';
      AttrNeed: (5, 13);
      FeatNeed: ''
    ),
    ( FeatName: 'Demonic Heritage';
      ClassNeed: '';
      LevelNeed: 6;
      SkillNeed: '';
      AttrNeed: (6, 9);
      FeatNeed: ''
    ),
    ( FeatName: 'Diehard';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (3, 13);
      FeatNeed: ''
    ),
    ( FeatName: 'Energy Resistance (Acid)';
      ClassNeed: '';
      LevelNeed: 11;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: ''
    ),
    ( FeatName: 'Energy Resistance (Cold)';
      ClassNeed: '';
      LevelNeed: 11;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: ''
    ),
    ( FeatName: 'Energy Resistance (Fire)';
      ClassNeed: '';
      LevelNeed: 11;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: ''
    ),
    ( FeatName: 'Energy Resistance (Force)';
      ClassNeed: '';
      LevelNeed: 11;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: ''
    ),
    ( FeatName: 'Energy Resistance (Lightning)';
      ClassNeed: '';
      LevelNeed: 11;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: ''
    ),
    ( FeatName: 'Energy Resistance (Necrotic)';
      ClassNeed: '';
      LevelNeed: 11;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: ''
    ),
    ( FeatName: 'Energy Resistance (Psychic)';
      ClassNeed: '';
      LevelNeed: 11;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: ''
    ),
    ( FeatName: 'Energy Resistance (Radiant)';
      ClassNeed: '';
      LevelNeed: 11;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: ''
    ),
    ( FeatName: 'Expert Healer';
      ClassNeed: 'Cleric';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (5, 13);
      FeatNeed: ''
    ),
    ( FeatName: 'Fast Dodge';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (2, 11);
      FeatNeed: ''
    ),
    ( FeatName: 'Fire Mastery';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: ''
    ),
    ( FeatName: 'Great Cleave';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (3, 15);
      FeatNeed: 'Improved Cleave'
    ),
    ( FeatName: 'Greater Energy Resistance (Acid)';
      ClassNeed: '';
      LevelNeed: 21;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: 'Energy Resistance (Acid)'
    ),
    ( FeatName: 'Greater Energy Resistance (Cold)';
      ClassNeed: '';
      LevelNeed: 21;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: 'Energy Resistance (Cold) '
    ),
    ( FeatName: 'Greater Energy Resistance (Fire)';
      ClassNeed: '';
      LevelNeed: 21;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: 'Energy Resistance (Fire)'
    ),
    ( FeatName: 'Greater Energy Resistance (Force)';
      ClassNeed: '';
      LevelNeed: 21;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: 'Energy Resistance (Force)'
    ),
    ( FeatName: 'Greater Energy Resistance (Lightning)';
      ClassNeed: '';
      LevelNeed: 21;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: 'Energy Resistance (Lightning)'
    ),
    ( FeatName: 'Greater Energy Resistance (Necrotic)';
      ClassNeed: '';
      LevelNeed: 21;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: 'Energy Resistance (Necrotic)'
    ),
    ( FeatName: 'Greater Energy Resistance (Psychic)';
      ClassNeed: '';
      LevelNeed: 21;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: 'Energy Resistance (Psychic)'
    ),
    ( FeatName: 'Greater Energy Resistance (Radiant)';
      ClassNeed: '';
      LevelNeed: 21;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: 'Energy Resistance (Radiant)'
    ),
    ( FeatName: 'Improved Cleave';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (3, 13);
      FeatNeed: 'Cleave'
    ),
    ( FeatName: 'Improved Critical';
      ClassNeed: '';
      LevelNeed: 16;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: ''
    ),
    ( FeatName: 'Improved Initiative';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: ''
    ),
    ( FeatName: 'Iron Skin';
      ClassNeed: '';
      LevelNeed: 16;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: ''
    ),
    ( FeatName: 'Iron Will';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (5, 13);
      FeatNeed: ''
    ),
    ( FeatName: 'Language Training';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (4, 11);
      FeatNeed: ''
    ),
    ( FeatName: 'Large And In Charge';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (1, 13);
      FeatNeed: ''
    ),
    ( FeatName: 'Lay Priest';
      ClassNeed: '';
      LevelNeed: 6;
      SkillNeed: '';
      AttrNeed: (5, 13);
      FeatNeed: ''
    ),
    ( FeatName: 'Lightning Mastery';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: ''
    ),
    ( FeatName: 'Lightning Reflexes';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (2, 13);
      FeatNeed: ''
    ),
    ( FeatName: 'Lunge';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: ''
    ),
    ( FeatName: 'Mobility';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (2, 13);
      FeatNeed: 'Fast Dodge'
    ),
    ( FeatName: 'Mounted Combat';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: 'Nature';
      AttrNeed: (0, 0);
      FeatNeed: ''
    ),
    ( FeatName: 'Necrotic Mastery';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: ''
    ),
    ( FeatName: 'Psychic Mastery';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: ''
    ),
    ( FeatName: 'Quick Draw';
      ClassNeed: '';
      LevelNeed: 6;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: ''
    ),
    ( FeatName: 'Radiant Mastery';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: ''
    ),
    ( FeatName: 'Rapid Reload';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: ''
    ),
    ( FeatName: 'Ritual Caster';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: ''
    ),
    ( FeatName: 'Shot On The Run';
      ClassNeed: '';
      LevelNeed: 6;
      SkillNeed: '';
      AttrNeed: (2, 15);
      FeatNeed: 'Mobility'
    ),
    ( FeatName: 'Spell Mastery';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: ''
    ),
    ( FeatName: 'Spring Attack';
      ClassNeed: '';
      LevelNeed: 6;
      SkillNeed: '';
      AttrNeed: (2, 15);
      FeatNeed: 'Mobility'
    ),
    ( FeatName: 'Swift';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (2, 11);
      FeatNeed: ''
    ),
    ( FeatName: 'Tough As Nails';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (3, 13);
      FeatNeed: ''
    ),
    ( FeatName: 'Toughness';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (3, 11);
      FeatNeed: ''
    ),
    ( FeatName: 'Two-Weapon Defense';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (2, 13);
      FeatNeed: ''
    ),
    ( FeatName: 'Two-Weapon Fighting';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (2, 15);
      FeatNeed: ''
    ),
    ( FeatName: 'Weapon Finesse (Dexterity)';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (2, 13);
      FeatNeed: ''
    ),
    ( FeatName: 'Weapon Finesse (Constitution)';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (3, 13);
      FeatNeed: ''
    ),
    ( FeatName: 'Weapon Finesse (Intelligence)';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (4, 13);
      FeatNeed: ''
    ),
    ( FeatName: 'Weapon Finesse (Wisdom)';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (5, 13);
      FeatNeed: ''
    ),
    ( FeatName: 'Weapon Finesse (Charisma)';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (6, 13);
      FeatNeed: ''
    )
  );


implementation

end.

