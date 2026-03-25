type
  PNode = ^Node;
  Node = record
    data: integer;
    next: PNode;
  end;

var
  Head: PNode;
  choice, value, pos: integer;

function CreateNode(val: integer): PNode;
var newNode: PNode;
begin
  New(newNode);
  newNode^.data := val;
  newNode^.next := nil;
  Result := newNode;
end;

//Добавление в начало
procedure AddFirst(var h: PNode; val: integer);
var newNode: PNode;
begin
  newNode := CreateNode(val);
  newNode^.next := h;
  h := newNode;
end;

//Добавление в конец
procedure AddLast(var h: PNode; val: integer);
var newNode, temp: PNode;
begin
  newNode := CreateNode(val);
  if h = nil then h := newNode
  else begin
    temp := h;
    while temp^.next <> nil do temp := temp^.next;
    temp^.next := newNode;
  end;
end;

//Добавление по позиции
procedure AddByPos(var h: PNode; val, p: integer);
var newNode, temp: PNode;
begin
  if (p <= 1) or (h = nil) then AddFirst(h, val)
  else begin
    temp := h;
    for i: integer := 1 to p - 2 do
      if temp^.next <> nil then temp := temp^.next;
    newNode := CreateNode(val);
    newNode^.next := temp^.next;
    temp^.next := newNode;
  end;
end;

//Удаление
procedure RemoveNode(var h: PNode; p: integer);
var temp, del: PNode;
begin
  if h = nil then Exit;
  if p <= 1 then begin
    del := h; h := h^.next; Dispose(del);
  end else begin
    temp := h;
    for i: integer := 1 to p - 2 do
      if (temp^.next <> nil) and (temp^.next^.next <> nil) then temp := temp^.next;
    del := temp^.next;
    if del <> nil then begin
      temp^.next := del^.next;
      Dispose(del);
    end;
  end;
end;

//Визуализация
procedure PrintList(h: PNode);
begin
  print('Список: ');
  if h = nil then print('пуст');
  while h <> nil do begin
    print(h^.data, '->');
    h := h^.next;
  end;
  println();
end;

begin
  Head := nil;
  repeat
    println('--- МЕНЮ ---');
    println('1. Добавить в начало');
    println('2. Добавить в конец');
    println('3. Добавить по позиции');
    println('4. Удалить по позиции');
    println('5. Просмотр списка');
    println('0. Выход');
    print('Выбор:'); readln(choice);

    case choice of
      1: begin print('Значение:'); readln(value); AddFirst(Head, value); end;
      2: begin print('Значение:'); readln(value); AddLast(Head, value); end;
      3: begin 
           print('Значение:'); readln(value); 
           print('Позиция:'); readln(pos); AddByPos(Head, value, pos); 
         end;
      4: begin print('Позиция для удаления:'); readln(pos); RemoveNode(Head, pos); end;
      5: PrintList(Head);
    end;
    println;
  until choice = 0;
end.
