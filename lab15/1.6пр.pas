procedure fib(i, n: integer; count: integer := 1); // Параметризация
begin
  var current := i + n;
  Print($'{current} ');
  
  if count < 10 then // База рекурсии 
    fib(n, current, count + 1); // Декомпозиция 
end;

begin
  Print('Первые 10 чисел Фибоначчи: ');
  fib(0, 1);
end.