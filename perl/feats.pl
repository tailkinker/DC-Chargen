#!/usr/bin/perl

open INF, "feats.txt";
my $count = 0;
while (<INF>) {
  $count ++;
  <INF>;
  }
close INF;
$count--;

print "  aFeats : array [0..$count] of FeatRec = (\n";

open INF, "feats.txt";
while (<INF>) {
  my $name = $_;
  chomp ($name);
  print "";
  my $reqline = <INF>;
  chomp ($reqline);
  my @req = split (',', $reqline);
  my $eof = eof(INF);

  $req[1] = '0' if ($req[1]=='');
  $req[3] = '0' if ($req[3]=='');
  $req[4] = '0' if ($req[4]=='');
  
  print "    ( FeatName: '$name';\n";
  print "      ClassNeed: '$req[0]';\n";
  print "      LevelNeed: $req[1];\n";
  print "      SkillNeed: '$req[2]';\n";
  print "      AttrNeed: ($req[3], $req[4]);\n";  
  print "      FeatNeed: '$req[5]'\n";
  if (eof(INF)) {
    print "    )\n";
  } else {
    print "    ),\n";
  }
}

close (INF);
print "  );\n";
