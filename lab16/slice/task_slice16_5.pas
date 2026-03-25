begin
  var n := ReadInteger('Длина массива: ');
  var a := ReadArrInteger('Массив: ', n);
  n := readInteger('Введите n: ');
  print('Результат: ');
  a := a[:a.IndexMin()] + Arr(n) + a[a.IndexMin():];
  a.println;
end.