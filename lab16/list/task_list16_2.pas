begin
  var n := ReadInteger('Длина списка: ');
  var l := lst(arrRandomInteger(n, 1, 100));
  
  print('Список: ');
  l.println;
  l.RemoveAt(l.IndexMax);
    
  print('Результат: ');
  l.println;
end.