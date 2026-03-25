var
  god, goda, let: set of byte;
  y: integer;

begin
  god := [1];
  goda := [2, 3, 4];
  let := [0, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14];
  read(y);
  
  if (y mod 10 in let) or (y mod 100 in let) then
    print(y, 'лет')
  else if y mod 10 in god then
    print(y, 'год')
  else
    print(y, 'года');
end.