{$mode objfpc}{$H+}
uses
	tools;
	
type
	tRace = record
		Name : string;
		Speed,
		Size : integer;
		Monster: Boolean;
		Attributes : array [0..5] of integer;
		Skills : array [0..18] of integer;
		Traits : array [0..7] of boolean;
		Weapons,
		Feats : array [0..1] of string;
		Description : string;
	end;
	
var
	f,
	o : text;
	s,
	t : string;
	totalrace : integer = 0;
	racecount : integer = 0;
	index,
	found,
	work : integer;
	race : tRace;
	line : longint = 0;
	
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
		
	AttrNames : array [0..5] of string = (
		'Strength',
		'Dexterity',
		'Constitution',
		'Intelligence',
		'Wisdom',
		'Charisma'
		);
		
begin
	assign (f, 'races.csv');
	assign (o, '../lraces.pas');
	reset (f);
	
	repeat
		readln (f, s);
		if (upcase (s) = '<RACE>') then 
			racecount += 1;
	until eof (f);
	writeln ('Pass 1:  ', racecount, ' Races found.');
	totalrace := racecount;
	racecount := 0;

	rewrite (o);
	
	// Write unit prologue
	writeln (o, 'unit lraces;');
	writeln (o);
	writeln (o, '{$mode objfpc}{$H+}');
	writeln (o);
	writeln (o, 'interface');
	writeln (o);
	writeln (o, 'uses');
	writeln (o, '  Classes, SysUtils;');
	writeln (o);
	writeln (o, 'type');
	writeln (o, '	tRace = record');
	writeln (o, '		Name : string;');
	writeln (o, '		Speed,');
	writeln (o, '		Size : integer;');
	writeln (o, '   Monster : boolean;');
	writeln (o, '		Attributes : array [0..5] of integer;');
	writeln (o, '		Skills : array [0..18] of integer;');
	writeln (o, '		Traits : array [0..7] of boolean;');
	writeln (o, '		Weapons,');
	writeln (o, '		Feats : array [0..1] of string;');
	writeln (o, '		Description : string;');
	writeln (o, '	end;');
	writeln (o);
	writeln (o, 'const');
	writeln (o, '	TraitNames : array [0..7] of string = (');
	writeln (o, '    ''Bonus Feat'',');
	writeln (o, '    ''Bonus Skill'',');
	writeln (o, '    ''Bonus Weapon'',');
	writeln (o, '    ''Bonus Attribute'',');
	writeln (o, '    ''Darkvision'',');
	writeln (o, '    ''Extra Carry'',');
	writeln (o, '    ''Lucky'',');
	writeln (o, '    ''Natural Attacks''');
	writeln (o, '  );');
	writeln (o);
	writeln (o, '  RaceCount = ', totalrace, ';');
	writeln (o, '  Races : array [0..RaceCount - 1] of tRace = (');
		
	reset (f);
	writeln ('Pass 2:');
	
	repeat
		readln (f, s);
		line += 1;
		if (upcase (s) = '<RACE>') then begin
			racecount += 1;
			readln (f, s);
			line += 1;
			// First thing out of the gate should be the race name.
			writeln ('Found Race:  ', s);
			
			race.Name := s;
			race.Speed := 3;  // Default values
			race.Size := 0;
			for index := 0 to 5 do
				race.Attributes [index] := 0;
			for index := 0 to 18 do
				race.Skills [index] := 0;
			for index := 0 to 7 do
				race.Traits [index] := FALSE;
			race.Weapons [0] := '';
			race.Weapons [1] := '';
			race.Feats [0] := '';
			race.Feats [1] := '';
			race.Monster := FALSE;
			
			repeat
				readln (f, s);
				line += 1;
				if (eof (f)) then begin
					writeln ('ERROR:  Premature end of file at line ', line, '.');
					halt (1);
				end;
				
				// Is it a monster?
				if (copy (upcase (s), 1, 7) = 'MONSTER') then
					race.Monster := TRUE;
				// Is it an attribute?
				found := -1;
				for index := 0 to 5 do
					if (upcase(copy (s, 1, length (AttrNames [index]))) = upcase(AttrNames [index])) then
						found := index;
				// Yes?
				if (found > -1) then begin
					t := copy (s, length(AttrNames [found]) + 1, length (s) - length (AttrNames[found]));
					val (t, work);
					writeln ('  -> ', AttrNames [found], ' <', work, '>');
					race.Attributes [found] := work;
				end;
				
				// Is it a Skill?
				found := -1;
				for index := 0 to 5 do
					if (upcase(copy (s, 1, length (SkillNames [index]))) = upcase(SkillNames [index])) then
						found := index;
				// Yes?
				if (found > -1) then begin
					t := copy (s, length(SkillNames [found]) + 1, length (s) - length (SkillNames[found]));
					val (t, work);
					writeln ('  -> ', SkillNames [found], ' <', work, '>');
					race.Skills [found] := work;
				end;
				
				// Is it a Size?
				if (upcase(copy (s, 1, 5)) = 'SIZE ') then 
					if (upcase(copy(s, 6, 1)) = 'T') then begin
						race.Skills [16] += 8;
						race.Speed := 1;
						race.Size := -2;
						writeln ('  -> Size: Tiny');
					end else if (upcase(copy(s, 6, 1)) = 'S') then begin
						race.Skills [16] += 4;
						race.Speed := 2;
						race.Size := -1;
						writeln ('  -> Size: Small');
					end else if (upcase(copy(s, 6, 1)) = 'L') then begin
						race.Skills [16] -= 4;
						race.Speed := 4;
						race.Size := 1;
						writeln ('  -> Size: Large');
					end else if (upcase(copy(s, 6, 1)) = 'H') then begin
						race.Skills [16] -= 8;
						race.Speed := 8;
						race.Size := 2;
						writeln ('  -> Size: Huge');
					end else
						writeln ('  Failed to parse size...');
						
				if (upcase(copy (s, 1, 6)) = 'TRAIT:') then begin					
					t := upcase (copy (s, 7, length (s) - 6));
					trim (t);
					
					found := -1;
					for index := 0 to 7 do
						if (upcase(TraitNames [index]) = t) then
							found := index;
							
					if (found > -1) then begin
						race.Traits [found] := TRUE;
						writeln ('  -> Trait: ', TraitNames [found]);
					end else
						writeln ('  -! Unknown Trait: >', t, '<');
				end;
				
				// Is it a Feat?
				if (upcase(copy (s, 1, 5)) = 'FEAT:') then begin					
					t := copy (s, 6, length (s) - 5);
					trim (t);
					
					// CamelCase it
					t [1] := UpCase (t [1]);
					for index := 2 to length (t) do
						if (t [index - 1] = ' ') then
							t [index] := upcase (t [index])
						else
							t [index] := chr (ord (t [index]) OR 32);
					
					if (race.Feats [0] = '') then
						race.Feats [0] := t
					else
						race.Feats [1] := t;
					writeln ('  -> Feat: ', t);
				end;
				
				// Is it a weapon?
				if (upcase(copy (s, 1, 7)) = 'WEAPON:') then begin					
					t := copy (s, 8, length (s) - 7);
					trim (t);
					
					// CamelCase it
					t [1] := UpCase (t [1]);
					for index := 2 to length (t) do
						if (t [index - 1] = ' ') then
							t [index] := upcase (t [index])
						else
							t [index] := chr (ord (t [index]) OR 32);
					
					if (race.Weapons [0] = '') then
						race.Weapons [0] := t
					else
						race.Weapons [1] := t;
					writeln ('  -> Weapon Training: ', t);
				end;
				
			until (upcase (s) = '<DESC>');
						
			race.Description := '';
			repeat
				readln (f, s);
				trim (s);
				line += 1;
				if (upcase (s) <> '<END>') then begin
					if (length(race.Description) > 0) then
						race.Description += ' ';
					race.Description += s;
				end;
				if (eof (f)) then begin
					writeln ('ERROR:  Premature end of file at line ', line, '.');
					halt (1);
				end;
			until (upcase (s) = '<END>');
			
			writeln ('Done with Race ', race.Name, '.  Now exporting...');
			
			// Export Race
			writeln (o, '    (');
			with (race) do begin
				writeln (o, '      Name: ''', Name, ''';');
				writeln (o, '      Speed: ', Speed, ';');
				writeln (o, '      Size: ', Size, ';');
				writeln (o, '      Monster: ', Monster, ';');
				write (o,   '      Attributes: (');
				for index := 0 to 5 do begin
					if (index > 0) then
						write (o, ', ');
					write (o, Attributes [index]);
				end;
				writeln (o, ');');
				write   (o,   '      Skills: (');
				for index := 0 to 18 do begin
					if (index > 0) then
						write (o, ', ');
					write (o, Skills [index]);
				end;
				writeln (o, ');');
				write   (o,   '      Traits: (');
				for index := 0 to 7 do begin
					if (index > 0) then
						write (o, ', ');
					write (o, Traits [index]);
				end;
				writeln (o, ');');
				write   (o,   '      Weapons: (');
				for index := 0 to 1 do begin
					if (index > 0) then
						write (o, ', ');
					write (o, '''', Weapons [index], '''');
				end;
				writeln (o, ');');
				write   (o,   '      Feats: (');
				for index := 0 to 1 do begin
					if (index > 0) then
						write (o, ', ');
					write (o, '''', Feats [index], '''');
				end;
				writeln (o, ');');
				writeln (o, '      Description: ''', Description, '''');
				write (o, '    )');
				if (racecount < totalrace) then
					write (o, ',');
				writeln (o);
			end;
		end;
	until ((upcase (s) = '<END FILE>') or (eof (f)));
	
	close (f);
	writeln (o, '  );');
	writeln (o);
	
	writeln ('Done with file.');
	
		writeln (o, 'implementation');
	writeln (o);
	writeln (o, 'end.');
	close (o);
end.