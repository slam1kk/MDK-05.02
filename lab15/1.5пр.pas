function gcd(m, n: integer): integer; // Параметризация
begin
  // База рекурсии
  if n = 0 then 
    Result := m
  else
    // Декомпозиция 
    Result := gcd(n, m mod n);
end;

begin
  Print('Введите первое число: ');
  var a := ReadInteger;
  
  Print('Введите второе число: ');
  var b := ReadInteger;
  
  var result := gcd(a, b);
  
  Print('НОД = ');
  Print(result);
end.