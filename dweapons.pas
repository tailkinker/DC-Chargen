unit dweapons;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  WeaponRec = record
    Name : String;
    TypeOf : byte;
  end;

const
  WeaponCount = 52;
  WeaponData : array [0..WeaponCount] of WeaponRec = (
  (Name:       'Arming Sword'; TypeOf: 1 ),
  (Name:      'Bastard Sword'; TypeOf: 1 ),
  (Name:         'Battle Axe'; TypeOf: 0 ),
  (Name:      'Bec de Corbin'; TypeOf: 1 ),
  (Name:               'Bill'; TypeOf: 1 ),
  (Name:         'Broadsword'; TypeOf: 1 ),
  (Name:               'Club'; TypeOf: 4 ),
  (Name:               'Dirk'; TypeOf: 0 ),
  (Name:           'Falchion'; TypeOf: 1 ),
  (Name:     'Footman''s Axe'; TypeOf: 0 ),
  (Name:         'Giant Club'; TypeOf: 0 ),
  (Name:        'Giant Flail'; TypeOf: 2 ),
  (Name:        'Giant Sword'; TypeOf: 2 ),
  (Name:            'Gladius'; TypeOf: 1 ),
  (Name:             'Glaive'; TypeOf: 1 ),
  (Name:          'Great Axe'; TypeOf: 0 ),
  (Name:         'Greatsword'; TypeOf: 1 ),
  (Name:            'Halberd'; TypeOf: 1 ),
  (Name:           'Hand Axe'; TypeOf: 0 ),
  (Name:         'Heavy Club'; TypeOf: 0 ),
  (Name:        'Heavy Flail'; TypeOf: 2 ),
  (Name:         'Heavy Mace'; TypeOf: 0 ),
  (Name:    'Horseman''s Axe'; TypeOf: 0 ),
  (Name:            'Javelin'; TypeOf: 0 ),
  (Name:        'Light Flail'; TypeOf: 6 ),
  (Name:         'Light Mace'; TypeOf: 4 ),
  (Name:          'Longsword'; TypeOf: 1 ),
  (Name:               'Maul'; TypeOf: 0 ),
  (Name:      'Military Pick'; TypeOf: 0 ),
  (Name:       'Morning Star'; TypeOf: 0 ),
  (Name:           'Partisan'; TypeOf: 0 ),
  (Name:               'Pike'; TypeOf: 0 ),
  (Name:            'Poleaxe'; TypeOf: 1 ),
  (Name:       'Quarterstaff'; TypeOf: 5 ),
  (Name:             'Rapier'; TypeOf: 1 ),
  (Name:             'Rondel'; TypeOf: 4 ),
  (Name:              'Sabre'; TypeOf: 5 ),
  (Name:         'Shortsword'; TypeOf: 1 ),
  (Name:             'Sickle'; TypeOf: 4 ),
  (Name:         'Side-Sword'; TypeOf: 1 ),
  (Name:       'Single Stick'; TypeOf: 5 ),
  (Name:       'Sledgehammer'; TypeOf: 0 ),
  (Name:         'Smallsword'; TypeOf: 1 ),
  (Name:              'Spear'; TypeOf: 0 ),
  (Name:             'Spetum'; TypeOf: 1 ),
  (Name:       'Throwing Axe'; TypeOf: 0 ),
  (Name:            'Trident'; TypeOf: 0 ),
  (Name:               'Wand'; TypeOf: 0 ),
  (Name:          'Warhammer'; TypeOf: 0 ),
  (Name:         'Zweihander'; TypeOf: 1 ),
  (Name:                'Bow'; TypeOf: 1 ),
  (Name:           'Crossbow'; TypeOf: 0 ),
  (Name:      'Hand Crossbow'; TypeOf: 2 )
);


implementation

end.

