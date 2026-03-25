type 
  PNode = ^Node;
  Node = record
    word: string[40];
    count: integer;
    next: PNode;
  end;
  
function CreateNode(NewWord: string): PNode;
var NewNode: PNode;
begin
  New(NewNode);
  NewNode^.word := NewWord;
  NewNode^.count := 1;
  NewNode^.next := nil;
  Result := NewNode;
end;
  
procedure AddFirst(var Head: PNode; NewNode: PNode);
begin
  NewNode^.next := Head;
  Head := NewNode;
end;
  
procedure AddAfter(p: PNode; NewNode: PNode);
begin
  NewNode^.next := p^.next;
  p^.next := NewNode;
end;

procedure AddLast(var Head: PNode; NewNode: Pnode);
var pp: PNode;
begin
  if Head = nil then
    AddFirst(Head, NewNode)
  else begin
    pp := Head;
    while pp^.next <> nil do
      pp := pp^.next;
    AddAfter(pp, NewNode);
  end;
end;

procedure AddBefore(var Head: PNode; p, NewNode: PNode);
var pp: PNode;
begin
  pp := Head;
  if p = Head then
    AddFirst(Head, NewNode)
  else begin
    while (pp <> nil) and (pp^.next <> p) do
      pp := pp^.next;
    if pp <> nil then AddAfter(pp, NewNode);
  end;
end;

function Find(Head: PNode; NewWord: string): PNode;
var pp: PNode;
begin
  pp := Head;
  while (pp <> nil) and (NewWord <> pp^.word) do
    pp := pp^.next;
  Result := pp;
end;

function FindPlace(Head: PNode; NewWord: string): PNode;
var pp: PNode;
begin
  pp := Head;
  while (pp <> nil) and (NewWord > pp^.word) do
    pp := pp^.next;
  Result := pp;
end;

function TakeWord(f: text): string;
var c: char;
begin
  Result := '';
  c := ' ';
  while not eof(f) and (c <= ' ') do
    read(f, c);
  while not eof(f) and (c > ' ') do begin
    Result := Result + c;
    read(f, c);
  end;
end;

var 
  Head, p, newNode: PNode;
  f: text;
  s: string;
  total: integer;
  
begin
  Head := nil;
  Assign(f, 'file.txt');
  reset(f);
  
  while not eof(f) do
  begin
    s := TakeWord(f);
    if s <> '' then
    begin
      p := Find(Head, s);
      if p <> nil then
        p^.count += 1
      else
      begin
        NewNode := CreateNode(s);
        p := FindPlace(Head, s);
        AddBefore(Head, p, newNode);
      end;
    end;
  end;
  close(f);
  
  total := 0;
  p := Head;
  while p <> nil do
  begin
    total += 1;
    p := p^.next;
  end;
  
  print(total);
end.