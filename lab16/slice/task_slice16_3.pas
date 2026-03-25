begin
  var n := ReadInteger('Длина массива: ');
  var a := ReadArrInteger('Массив: ', n);
  print('Результат: ');
  a[1::2].min().println();
end.