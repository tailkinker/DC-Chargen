#!/usr/bin/perl

open INF, "feats.txt";
my $count = 0;
while (<INF>) {
  $count ++;
  <INF>;
  <INF>;
  }
close INF;
$count--;

print "unit lfeats;\n\n";
print "{\$mode objfpc}{\$H+}\n\n";
print "interface\n\n";
print "uses\n  Classes, SysUtils;\n\n";
print "type\n  FeatRec = record\n";
print "  FeatName : string;\n";
print "  ClassNeed : string;\n";
print "  LevelNeed : byte;\n";
print "  SkillNeed : string;\n";
print "  AttrNeed : array [0..1] of byte;\n";
print "  FeatNeed : string;\n";
print "  Affects : array [0..3] of string;\n";
print "end;\n\n";
print "const\n  aFeatCount = $count;\n";
print "  aFeats : array [0..aFeatCount] of FeatRec = (\n";

open INF, "feats.txt";
while (<INF>) {
  my $name = $_;
  chomp ($name);
  print "";
  my $reqline = <INF>;
  chomp ($reqline);
  my @req = split (',', $reqline);

  $req[1] = '0' if ($req[1]=='');
  $req[3] = '0' if ($req[3]=='');
  $req[4] = '0' if ($req[4]=='');
  $req[6] = '0' if ($req[6]=='');
  my $affectline = <INF>;
  chomp ($affectline);
  my @affect = split(',', $affectline);
  
  print "    ( FeatName: '$name';\n";
  print "      ClassNeed: '$req[0]';\n";
  print "      LevelNeed: $req[1];\n";
  print "      SkillNeed: '$req[2]';\n";
  print "      AttrNeed: ($req[3], $req[4]);\n";  
  print "      FeatNeed: '$req[5]';\n";
  print "      Affects: (\n";
  print "        '$affect[0]',\n";
  print "        '$affect[1]',\n";
  print "        '$affect[2]',\n";
  print "        '$affect[4]'\n";
  print "      )\n";
  if (eof(INF)) {
    print "    )\n";
  } else {
    print "    ),\n";
  }
}

close (INF);
print "  );\n\nvar\n";
print "  FeatList : array of FeatRec;\n\n";
print "function FeatCount : integer;\n\n";
print "implementation\n\n";
print "function FeatCount : integer;\n";
print "begin\n";
print "  FeatCount := length (FeatList);\n";
print "end;\n\n";
print "end.\n";

