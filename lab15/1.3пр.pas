function stepen(a, b: integer): integer; // Параметризация 
begin
  // База рекурсии
  if b = 0 then
  begin
    Result := 1;
    exit;
  end;
  // Декомпозиция 
  var sp := stepen(a, b - 1);
  Result := a * sp;
end;

begin
  Print('Введите число: ');
  var x := ReadInteger;
  
  Print('Введите степень: ');
  var y := ReadInteger;
  
  Print($'{x}^{y} = ');
  Println(stepen(x, y));
end.