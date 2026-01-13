procedure rec(n: integer); //параметризация
begin
  if n >= 0 then //база рекурсии
  begin
    print(n, ' ');
    rec(n - 2); //декомпозиция
  end;
end;

begin
  print('Последовательность: ');
  rec(25);
end.