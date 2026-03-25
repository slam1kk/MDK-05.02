type
  PNode = ^Node;
  Node = record
    val: integer;
    next: PNode;
  end;
  
var
  Head, Last, p: PNode;
  i, min, max: integer;
  
begin
  Randomize;
  Head := nil;
  Last := nil;
  
  for i := 1 to 15 do
  begin
    new(p);
    p^.val := Random(100) + 1;
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
  
  if Head <> nil then
  begin
    min := Head^.val;
    max := Head^.val;
    p := Head^.next;
    
    while p <> nil do
    begin
      if p^.val < min then min := p^.val;
      if p^.val > max then max := p^.val;
      p := p^.next;
    end;
  end;
  
  println('Max:', max);
  print('Min:', min);
end.