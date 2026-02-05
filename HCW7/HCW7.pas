uses GraphABC, HilbertModule;

var
  depth: integer := 3;
  scale: real := 1.0;
  offsetX: real := 100;
  offsetY: real := 100;
  const BASE_CANVAS = 500;

procedure RedrawScene();
begin
  LockDrawing();
  ClearWindow(clWhite);
  
  var currentStep := (BASE_CANVAS / (Power(2, depth) - 1)) * scale;
  
  SetPenColor(clBlue);
  if (currentStep < 5) or (depth > 6) then SetPenWidth(1) else SetPenWidth(2);
  
  DrawHilbert(depth, offsetX, offsetY, 0, currentStep);
  
  SetFontSize(10);
  SetFontColor(clGray);
  TextOut(10, 10, 'Глубина (A/D): ' + IntToStr(depth));
  TextOut(10, 25, 'Масштаб (W/S): ' + IntToStr(Round(scale * 100)) + '%');
  TextOut(10, 40, 'Перемещение: Стрелки');
  
  Redraw();
end;

procedure KeyDown(key: integer);
begin
  case key of
    VK_Up: offsetY -= 20;
    VK_Down: offsetY += 20;
    VK_Left: offsetX -= 20;
    VK_Right: offsetX += 20;
    VK_W: scale *= 1.1;
    VK_S: scale /= 1.1;
    VK_D: if depth < 8 then depth += 1;
    VK_A: if depth > 1 then depth -= 1;
  end;
  RedrawScene();
end;

begin
  SetWindowSize(900, 900);
  SetWindowTitle('Кривая Гильберта');
  CenterWindow;
  
  OnKeyDown := KeyDown;
  RedrawScene();
end.
