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

implementation

end.

