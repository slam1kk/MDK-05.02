type TToy = record
  name: string[15];
  price: real;
  age: string[3];
end;

begin
  var f: file of TToy;
  var Toy: TToy;
  
  assign(f, 'toys.dat');
  rewrite(f);

  with Toy do
  begin
    name := 'Teddy Bear';
    price := 999.99;
    age := '0+';
  end;
  write(f, Toy);
  
  with Toy do
  begin
    name := 'LEGO';
    price := 99999.89;
    age := '3+';
  end;
  write(f, toy);
  
  with Toy do
  begin
    name := 'Rubik`s Cube';
    price := 1999.99;
    age := '6+';
  end;
  write(f, Toy);
  
  close(f);
  
  reset(f);
  for i: integer := 1 to 3 do
  begin
    read(f, Toy);
    with Toy do
      write(name:13, ' | ', price:9, ' | ', age);
    println();
  end;
  
  close(f);
end.