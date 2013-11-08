unit lraces;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
	tRace = record
		Name : string;
		Speed,
		Size : integer;
   Monster : boolean;
		Attributes : array [0..5] of integer;
		Skills : array [0..18] of integer;
		Traits : array [0..7] of boolean;
		Weapons,
		Feats : array [0..1] of string;
		Description : string;
	end;

const
	TraitNames : array [0..7] of string = (
    'Bonus Feat',
    'Bonus Skill',
    'Bonus Weapon',
    'Bonus Attribute',
    'Darkvision',
    'Extra Carry',
    'Lucky',
    'Natural Attacks'
  );

  RaceCount = 17;
  Races : array [0..RaceCount - 1] of tRace = (
    (
      Name: 'Cat-Folk';
      Speed: 2;
      Size: -1;
      Monster: FALSE;
      Attributes: (0, 2, 0, 0, -2, 2);
      Skills: (3, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0);
      Traits: (FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE);
      Weapons: ('', '');
      Feats: ('Alert', '');
      Description: 'Willowy and sinuous, the Cat-Folk are tricksters and pranksters. They are surprisingly strong for their size, but quite short-sighted.  And they find the proverb, "Curiosity killed the cat", highly offensive.'
    ),
    (
      Name: 'Dwarf';
      Speed: 2;
      Size: -1;
      Monster: FALSE;
      Attributes: (0, 0, 2, 0, 2, -1);
      Skills: (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0);
      Traits: (FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, FALSE, FALSE);
      Weapons: ('Heavy Flail', 'Light Flail');
      Feats: ('', '');
      Description: 'Short, tough, and stubborn, Dwarves make excellent warriors and priests. They are steady and dependable.'
    ),
    (
      Name: 'Elf';
      Speed: 3;
      Size: 0;
      Monster: FALSE;
      Attributes: (0, 2, -2, 2, 0, 0);
      Skills: (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
      Traits: (FALSE, FALSE, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE);
      Weapons: ('Rapier', 'Bow');
      Feats: ('', '');
      Description: 'Viewed as shiftless daydreamers by some, and as enigmatic spirits by others, the Elves live partially in this realm, and partially in Arcadia, homeland of the Fey. Or at least, that?s what they claim.'
    ),
    (
      Name: 'Gnome';
      Speed: 2;
      Size: -1;
      Monster: FALSE;
      Attributes: (-2, 2, 0, 0, 0, 2);
      Skills: (0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0);
      Traits: (FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, FALSE);
      Weapons: ('Warhammer', 'Short Sword');
      Feats: ('', '');
      Description: 'These cheerful people love complexity and magic. They are very likeable, and enjoy company, even that of the larger Races.'
    ),
    (
      Name: 'Half-Giant';
      Speed: 4;
      Size: 1;
      Monster: FALSE;
      Attributes: (6, -2, 2, 0, 2, 0);
      Skills: (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -4, 0, 0);
      Traits: (FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE);
      Weapons: ('', '');
      Feats: ('', '');
      Description: 'Standing an average of nine feet tall, Half- Giants have a reputation for stupidity. While they are certainly massive, and rather clumsy, they are just as intelligent as Humans, and rather more strong-willed. Nonetheless, they frequently find themselves shunted into martial roles, because they excel at such.'
    ),
    (
      Name: 'Half-Ork';
      Speed: 3;
      Size: 0;
      Monster: FALSE;
      Attributes: (2, 0, 2, -4, 0, 0);
      Skills: (0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
      Traits: (FALSE, FALSE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE);
      Weapons: ('', '');
      Feats: ('Toughness', '');
      Description: 'Though no taller than Humans, the Half- Orks are bulky, powerful, and very stupid. Being of demonic heritage, they occasionally become Sorcerers, but typically end up specializing in one of the martial Classes.'
    ),
    (
      Name: 'Human';
      Speed: 3;
      Size: 0;
      Monster: FALSE;
      Attributes: (0, 0, 0, 0, 0, 0);
      Skills: (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
      Traits: (TRUE, TRUE, FALSE, TRUE, FALSE, FALSE, FALSE, FALSE);
      Weapons: ('', '');
      Feats: ('', '');
      Description: 'Humans are the most flexible of the Races, able to perform well in any field. However, their flexibility comes at a cost: Humans cannot specialize quite as well as other Races.'
    ),
    (
      Name: 'Beast, Tiny';
      Speed: 1;
      Size: -2;
      Monster: TRUE;
      Attributes: (-4, 4, 0, -2, 2, 0);
      Skills: (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0);
      Traits: (FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE);
      Weapons: ('', '');
      Feats: ('Swift', '');
      Description: 'Suitable for two- to three-foot-long animals.'
    ),
    (
      Name: 'Beast, Small';
      Speed: 2;
      Size: -1;
      Monster: TRUE;
      Attributes: (0, 2, 0, -2, 2, 0);
      Skills: (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0);
      Traits: (FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE);
      Weapons: ('', '');
      Feats: ('Swift', '');
      Description: 'Suitable for three- to five-foot-long animals.'
    ),
    (
      Name: 'Beast, Medium';
      Speed: 3;
      Size: 0;
      Monster: TRUE;
      Attributes: (0, 0, 2, -2, 2, 0);
      Skills: (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
      Traits: (FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE);
      Weapons: ('', '');
      Feats: ('', '');
      Description: 'Suitable for six- to seven-foot-long animals.'
    ),
    (
      Name: 'Beast, Large';
      Speed: 4;
      Size: 1;
      Monster: TRUE;
      Attributes: (4, -2, 4, -2, 2, 0);
      Skills: (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -4, 0, 0);
      Traits: (FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE);
      Weapons: ('', '');
      Feats: ('', '');
      Description: 'Suitable for animals from eight to ten feet in length.'
    ),
    (
      Name: 'Beast, Huge';
      Speed: 8;
      Size: 2;
      Monster: TRUE;
      Attributes: (8, -4, 6, -2, 2, 0);
      Skills: (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -8, 0, 0);
      Traits: (FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE);
      Weapons: ('', '');
      Feats: ('', '');
      Description: 'Suitable for animals of eleven feet in length or longer.'
    ),
    (
      Name: 'Construct, Tiny';
      Speed: 1;
      Size: -2;
      Monster: TRUE;
      Attributes: (-4, 2, 2, 0, 0, 0);
      Skills: (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0);
      Traits: (FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE);
      Weapons: ('', '');
      Feats: ('Toughness', '');
      Description: 'Suitable for an undead or construct weighing about thirty pounds.'
    ),
    (
      Name: 'Construct, Small';
      Speed: 2;
      Size: -1;
      Monster: TRUE;
      Attributes: (0, 0, 2, 0, 0, 0);
      Skills: (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0);
      Traits: (FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE);
      Weapons: ('', '');
      Feats: ('Toughness', 'Iron Skin');
      Description: 'Suitable for an undead or construct weighing about sixty pounds.'
    ),
    (
      Name: 'Construct, Medium';
      Speed: 3;
      Size: 0;
      Monster: TRUE;
      Attributes: (0, 0, 2, 0, 0, 0);
      Skills: (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
      Traits: (FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE);
      Weapons: ('', '');
      Feats: ('Toughness', 'Iron Skin');
      Description: 'Suitable for an undead or construct weighing about 150 pounds.'
    ),
    (
      Name: 'Construct, Large';
      Speed: 4;
      Size: 1;
      Monster: TRUE;
      Attributes: (4, -2, 4, 0, 0, 0);
      Skills: (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -4, 0, 0);
      Traits: (FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE);
      Weapons: ('', '');
      Feats: ('Iron Skin', '');
      Description: 'Suitable for an undead or construct weighing about half a tonne.'
    ),
    (
      Name: 'Construct, Huge';
      Speed: 8;
      Size: 2;
      Monster: TRUE;
      Attributes: (8, -4, 6, 0, 0, 0);
      Skills: (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -8, 0, 0);
      Traits: (FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE);
      Weapons: ('', '');
      Feats: ('Toughness', 'Iron Skin');
      Description: 'Suitable for an undead or construct weighing around a tonne.'
    )
  );

implementation

end.
