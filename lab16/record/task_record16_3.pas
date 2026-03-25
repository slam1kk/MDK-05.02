type toy = record
  name: string;
  price: real;
  age: string;
end;
begin
  var toys: array[1..3] of toy;
  
  with toys[1] do
  begin
    name := 'Teddy Bear';
    price := 999.99;
    age := '0+';
  end;
  
  with toys[2] do
  begin
    name := 'LEGO';
    price := 99999.89;
    age := '3+';
  end;
  
  with toys[3] do
  begin
    name := 'Rubik`s Cube';
    price := 1999.99;
    age := '6+';
  end;
  
  for i: integer := 1 to 3 do begin
    with toys[i] do
      write(name:13, ' | ', price:9, ' | ', age);
     println()
  end;
end.