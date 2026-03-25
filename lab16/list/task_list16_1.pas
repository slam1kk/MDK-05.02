begin
  var n := ReadInteger('Длина массива: ');
  var a := arrRandomInteger(n, -5, 20);
  var l1 := new list<integer>;
  var l2 := new list<integer>;
  
  print('Массив: ');
  a.println;
  foreach var i in a do
    if i > 0 then
      l1 += i
    else
      l2 += i;
    
  print('l1: ');
  l1.println;
  print('l2: ');
  l2.println;
end.