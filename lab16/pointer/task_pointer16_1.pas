var
  i: integer;
  pInt: ^integer;
  
begin
  i := 2;
  new(pInt);
  pInt^ := i;
  print(pInt^);
end.