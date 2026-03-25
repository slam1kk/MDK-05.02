type 
  PNode = ^Node;
  Node = record
    data: integer;
    next: PNode;
  end;
  
var
  Stack: PNode;
  fileIn, fileOut: text;
  val: integer;
  
procedure Push(var Head: PNode; tVal: integer);
var NewNode: PNode;
begin
  New(NewNode);
  NewNode^.data := tVal;
  NewNode^.next := Head;
  Head := NewNode;
end;

function Pop(var Head: PNode): integer;
var temp: PNode;
begin
  if Head <> nil then
  begin
    Result := Head^.data;
    temp := Head;
    Head := Head^.next;
    Dispose(temp);
  end;
end;

begin
  Stack := nil;
  assign(fileIn, 'input.txt');
  reset(fileIn);
  while not eof(fileIn) do
  begin
    read(fileIn, val);
    Push(Stack, val);
  end;
  Close(fileIn);
  
  assign(fileOut, 'output.txt');
  rewrite(fileOut);
  while Stack <> nil do
  begin
    val := Pop(Stack);
    write(fileOut, val, ' ')
  end;
  close(fileOut);
end.