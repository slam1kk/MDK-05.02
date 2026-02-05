unit HilbertModule;

interface

uses GraphABC;

// Объявляем процедуру, которая будет доступна извне
procedure DrawHilbert(order: integer; startX, startY, sideAngle, stepSize: real);

implementation

var
  curX, curY: real;
  angle: real;

procedure Step(distance: real);
begin
  var newX := curX + distance * cos(DegToRad(angle));
  var newY := curY + distance * sin(DegToRad(angle));
  Line(Round(curX), Round(curY), Round(newX), Round(newY));
  curX := newX;
  curY := newY;
end;

procedure Hilbert(order: integer; a: real; s: real);
begin
  if order = 0 then exit;
  angle += a;
  Hilbert(order - 1, -a, s);
  Step(s);
  angle -= a;
  Hilbert(order - 1, a, s);
  Step(s);
  Hilbert(order - 1, a, s);
  angle -= a;
  Step(s);
  Hilbert(order - 1, -a, s);
  angle += a;
end;

procedure DrawHilbert(order: integer; startX, startY, sideAngle, stepSize: real);
begin
  // Инициализируем начальное состояние перед рисованием
  curX := startX;
  curY := startY;
  angle := sideAngle;
  Hilbert(order, 90, stepSize);
end;

end.
