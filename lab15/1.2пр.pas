function sumTo(n: integer): integer; // Параметризация 
begin
  // База рекурсии
  if n <= 1 then 
    Result := 1
  else
    // Декомпозиция
    Result := n + sumTo(n - 1);
end;

begin
  Print('Введите n: ');
  var n := ReadInteger;
  
  Print($'sumTo({n}) = ');
  Println(sumTo(n));
end.