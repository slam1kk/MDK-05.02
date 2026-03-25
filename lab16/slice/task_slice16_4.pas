begin
  var n := ReadInteger('Длина массива: ');
  var a := ReadArrInteger('Массив: ', n);
  print('Результат: ');
  a := a[:a.indexMax()] + a[a.indexMax() + 1:];
  a.println();
end.