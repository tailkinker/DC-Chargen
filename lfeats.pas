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
      FeatNeed: '';
      Improves: 0
    ),
    ( FeatName: 'Alert';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Improves: 0
    ),
    ( FeatName: 'Ambidexterity';
      ClassNeed: '';
      LevelNeed: 1;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Improves: 0
    ),
    ( FeatName: 'Arcane Dabbler';
      ClassNeed: '';
      LevelNeed: 6;
      SkillNeed: '';
      AttrNeed: (4, 9);
      FeatNeed: '';
      Improves: 0
    ),
    ( FeatName: 'Blind Fighting';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Improves: 0
    ),
    ( FeatName: 'Cleave';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (1, 13);
      FeatNeed: '';
      Improves: 0
    ),
    ( FeatName: 'Cold Mastery';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Improves: 0
    ),
    ( FeatName: 'Combat Caster';
      ClassNeed: '';
      LevelNeed: 6;
      SkillNeed: '';
      AttrNeed: (5, 13);
      FeatNeed: '';
      Improves: 0
    ),
    ( FeatName: 'Demonic Heritage';
      ClassNeed: '';
      LevelNeed: 6;
      SkillNeed: '';
      AttrNeed: (6, 9);
      FeatNeed: '';
      Improves: 0
    ),
    ( FeatName: 'Diehard';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (3, 13);
      FeatNeed: '';
      Improves: 0
    ),
    ( FeatName: 'Energy Resistance (Acid)';
      ClassNeed: '';
      LevelNeed: 11;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Improves: 0
    ),
    ( FeatName: 'Energy Resistance (Cold)';
      ClassNeed: '';
      LevelNeed: 11;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Improves: 0
    ),
    ( FeatName: 'Energy Resistance (Fire)';
      ClassNeed: '';
      LevelNeed: 11;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Improves: 0
    ),
    ( FeatName: 'Energy Resistance (Force)';
      ClassNeed: '';
      LevelNeed: 11;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Improves: 0
    ),
    ( FeatName: 'Energy Resistance (Lightning)';
      ClassNeed: '';
      LevelNeed: 11;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Improves: 0
    ),
    ( FeatName: 'Energy Resistance (Necrotic)';
      ClassNeed: '';
      LevelNeed: 11;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Improves: 0
    ),
    ( FeatName: 'Energy Resistance (Psychic)';
      ClassNeed: '';
      LevelNeed: 11;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Improves: 0
    ),
    ( FeatName: 'Energy Resistance (Radiant)';
      ClassNeed: '';
      LevelNeed: 11;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Improves: 0
    ),
    ( FeatName: 'Expert Healer';
      ClassNeed: 'Cleric';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (5, 13);
      FeatNeed: '';
      Improves: 0
    ),
    ( FeatName: 'Fast Dodge';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (2, 11);
      FeatNeed: '';
      Improves: 0
    ),
    ( FeatName: 'Fire Mastery';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Improves: 0
    ),
    ( FeatName: 'Great Cleave';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (3, 15);
      FeatNeed: 'Improved Cleave';
      Improves: 0
    ),
    ( FeatName: 'Greater Energy Resistance (Acid)';
      ClassNeed: '';
      LevelNeed: 21;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: 'Energy Resistance (Acid)';
      Improves: 0
    ),
    ( FeatName: 'Greater Energy Resistance (Cold)';
      ClassNeed: '';
      LevelNeed: 21;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: 'Energy Resistance (Cold) ';
      Improves: 0
    ),
    ( FeatName: 'Greater Energy Resistance (Fire)';
      ClassNeed: '';
      LevelNeed: 21;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: 'Energy Resistance (Fire)';
      Improves: 0
    ),
    ( FeatName: 'Greater Energy Resistance (Force)';
      ClassNeed: '';
      LevelNeed: 21;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: 'Energy Resistance (Force)';
      Improves: 0
    ),
    ( FeatName: 'Greater Energy Resistance (Lightning)';
      ClassNeed: '';
      LevelNeed: 21;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: 'Energy Resistance (Lightning)';
      Improves: 0
    ),
    ( FeatName: 'Greater Energy Resistance (Necrotic)';
      ClassNeed: '';
      LevelNeed: 21;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: 'Energy Resistance (Necrotic)';
      Improves: 0
    ),
    ( FeatName: 'Greater Energy Resistance (Psychic)';
      ClassNeed: '';
      LevelNeed: 21;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: 'Energy Resistance (Psychic)';
      Improves: 0
    ),
    ( FeatName: 'Greater Energy Resistance (Radiant)';
      ClassNeed: '';
      LevelNeed: 21;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: 'Energy Resistance (Radiant)';
      Improves: 0
    ),
    ( FeatName: 'Improved Cleave';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (3, 13);
      FeatNeed: 'Cleave';
      Improves: 0
    ),
    ( FeatName: 'Improved Critical';
      ClassNeed: '';
      LevelNeed: 16;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Improves: 0
    ),
    ( FeatName: 'Improved Initiative';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Improves: 0
    ),
    ( FeatName: 'Iron Skin';
      ClassNeed: '';
      LevelNeed: 16;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Improves: 0
    ),
    ( FeatName: 'Iron Will';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (5, 13);
      FeatNeed: '';
      Improves: 0
    ),
    ( FeatName: 'Language Training';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (4, 11);
      FeatNeed: '';
      Improves: 1
    ),
    ( FeatName: 'Large And In Charge';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (1, 13);
      FeatNeed: '';
      Improves: 0
    ),
    ( FeatName: 'Lay Priest';
      ClassNeed: '';
      LevelNeed: 6;
      SkillNeed: '';
      AttrNeed: (5, 13);
      FeatNeed: '';
      Improves: 0
    ),
    ( FeatName: 'Lightning Mastery';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Improves: 0
    ),
    ( FeatName: 'Lightning Reflexes';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (2, 13);
      FeatNeed: '';
      Improves: 0
    ),
    ( FeatName: 'Lunge';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Improves: 0
    ),
    ( FeatName: 'Mobility';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (2, 13);
      FeatNeed: 'Fast Dodge';
      Improves: 0
    ),
    ( FeatName: 'Mounted Combat';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: 'Nature';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Improves: 0
    ),
    ( FeatName: 'Necrotic Mastery';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Improves: 0
    ),
    ( FeatName: 'Psychic Mastery';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Improves: 0
    ),
    ( FeatName: 'Quick Draw';
      ClassNeed: '';
      LevelNeed: 6;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Improves: 0
    ),
    ( FeatName: 'Radiant Mastery';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Improves: 0
    ),
    ( FeatName: 'Rapid Reload';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Improves: 0
    ),
    ( FeatName: 'Ritual Caster';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Improves: 0
    ),
    ( FeatName: 'Shot On The Run';
      ClassNeed: '';
      LevelNeed: 6;
      SkillNeed: '';
      AttrNeed: (2, 15);
      FeatNeed: 'Mobility';
      Improves: 0
    ),
    ( FeatName: 'Spell Mastery';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (0, 0);
      FeatNeed: '';
      Improves: 0
    ),
    ( FeatName: 'Spring Attack';
      ClassNeed: '';
      LevelNeed: 6;
      SkillNeed: '';
      AttrNeed: (2, 15);
      FeatNeed: 'Mobility';
      Improves: 0
    ),
    ( FeatName: 'Swift';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (2, 11);
      FeatNeed: '';
      Improves: 0
    ),
    ( FeatName: 'Tough As Nails';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (3, 13);
      FeatNeed: '';
      Improves: 0
    ),
    ( FeatName: 'Toughness';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (3, 11);
      FeatNeed: '';
      Improves: 0
    ),
    ( FeatName: 'Two-Weapon Defense';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (2, 13);
      FeatNeed: '';
      Improves: 0
    ),
    ( FeatName: 'Two-Weapon Fighting';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (2, 15);
      FeatNeed: '';
      Improves: 0
    ),
    ( FeatName: 'Weapon Finesse (Dexterity)';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (2, 13);
      FeatNeed: '';
      Improves: 0
    ),
    ( FeatName: 'Weapon Finesse (Constitution)';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (3, 13);
      FeatNeed: '';
      Improves: 0
    ),
    ( FeatName: 'Weapon Finesse (Intelligence)';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (4, 13);
      FeatNeed: '';
      Improves: 0
    ),
    ( FeatName: 'Weapon Finesse (Wisdom)';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (5, 13);
      FeatNeed: '';
      Improves: 0
    ),
    ( FeatName: 'Weapon Finesse (Charisma)';
      ClassNeed: '';
      LevelNeed: 0;
      SkillNeed: '';
      AttrNeed: (6, 13);
      FeatNeed: '';
      Improves: 0
    )
  );


implementation

end.

