var
  t : text;
  item,
  stat,
  desc : string;
  index : integer;
  count : integer;  
begin
  count := 0;
  assign (t, 'dc.bgl');
  reset (t);
  
  repeat
    readln (t, item);
    readln (t, desc);
    readln (t, stat);
    item := '''' + item + '''';
    if (stat [1] = '0') then begin
      writeln ('  (Name: ', item:20, '; TypeOf: 0 ),');
      inc (count);
    end;
    for index := 1 to 16 do
      readln (t, stat);
  until (eof (t));
  
  close (t);
end.
