type TChs = set of Char;

const
  lett: TChs = ['a'..'z', 'A'..'Z', '_'];
  num: TChs = ['1'..'9'];

var
  str: string;
  i: byte;
  flag: boolean = true;
  
begin
  read(str);
  if str[1] not in lett then
    flag := false;
  
  if flag then
    for i := 2 to length(str) do
      if str[i] not in lett + num then
      begin
        flag := false;
        break;
      end;
  print(flag);
end.