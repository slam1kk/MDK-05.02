type anketa = record
  fio: string;
  birth: string;
  kurs: 1..5;
end;

begin
  var student: anketa;
  
  student.fio := 'Pokidkin Yegor Sergeyevich';
  student.birth := '28.12.2007';
  student.kurs := 2;
  
  print(student.fio, ' | ', student.birth, ' | ', student.kurs);
end.