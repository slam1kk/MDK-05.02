type anketa = record
  fio: string;
  birth: string;
  kurs: 1..5;
end;

begin
  var students: array[1..3] of anketa;
  
  students[1].fio := 'Pokidkin Yegor Sergeyevich';
  students[1].birth := '28.12.2007';
  students[1].kurs := 2;
  students[2].fio := 'Usatova Veronika Anatolyevna';
  students[2].birth := '08.03.2008';
  students[2].kurs := 2;
  students[3].fio := 'Velkov Roman Yuryevich';
  students[3].birth := '09.10.2008';
  students[3].kurs := 2;
  
  for i: integer := 1 to 3 do begin
    write(students[i].fio:30, ' | ', students[i].birth, ' | ', students[i].kurs);
    println()
  end;
end.