type
  PNode = ^Node;
  Node = record
    val: integer;
    next: PNode;
  end;
  
var
  Head, Last, p: PNode;
  i: integer;
  
begin
  Head := nil;
  Last := nil;
  
  for i := 1 to 10 do
  begin
    new(p);
    p^.val := i;
    p^.next := nil;
    
    if Head = nil then
      Head := p
    else
      Last^.next := p;
    Last := p;
  end;
  
  print('List:');
  p := Head;
  while p <> nil do
  begin
    print(p^.val);
    p := p^.next;
  end;
  println();
  
  print('Even els:');
  p := Head;
  while p <> nil do
  begin
    if p^.val mod 2 = 0 then
      print(p^.val);
    p := p^.next;
  end;
end.