procedure LoopFor(i, n: integer); // Параметризация 
begin
  // База рекурсии
  if i <= n then
  begin
    Print('рекурсия ');
    PrintLn(i);
    // Декомпозиция 
    var nextI := i + 1;
    
    LoopFor(nextI, n);
  end;
end;

begin
  LoopFor(1, 10);
end.