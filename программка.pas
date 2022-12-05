uses crt;
uses GraphABC;

var
  vvod: byte;

var
  x0, y0, w,s: integer;

var
  mx, my, x, y,k,l: integer;

var
  a, b, x1, y1, n, h: real;

var
  i: integer;

function vibor1(var v: byte): byte;
begin
  Textcolor(2);
  writeln('Увеличить по x - 1');
  Textcolor(4);
  writeln('Увеличить по y - 2');
  Textcolor(15);
  Writeln('Увеличить по x и по y-3');
  readln(s);
  vibor1 := s;
end;

function vibor(var v: byte): byte;
begin
  Textcolor(2);
  writeln('Да - 1');
  Textcolor(4);
  writeln('Нет - 0');
  Textcolor(15);
  Write('Выберите вариант: ');
  readln(v);
  vibor := v;
end;


function fun(var x: real): real;
begin
  var fo: real;
  fo := 2 * power(x, 3) + (-1) * power(x, 2) + (4) * x + (3);
  fun := fo;
end;


function fun1(var x: real): real;
begin
  var fo: real;
  fo := (x * (x * (exp(ln(x) * 3)) - 2 * (exp(ln(x) * 2)) + 15 * x + 18)) / 6;
  fun1 := fo;
end;

function grap1(var a,b,h: real; n:integer): integer;
begin
  var x0, y0, w: integer;
  var mx, my, x, y: integer;
  var x1, y1: real;
  var i: integer;
  Maximizewindow;
  clearwindow;
  x0 := windowwidth div 2;
  y0 := windowheight div 2;
  line(x0, 0, x0, windowheight);
  line(0, y0, windowwidth, y0);
  l := -10;
  k := 10;
  vvod := vibor1(vvod);
  case vvod of
    1:
    begin
      writeln('Введите размер промежутка по x');
      readln(mx);
      my:=30;
    end;
    2:
    begin
      writeln('Введите размер промежутка по y');
      readln(my);
      mx:=30
    end;
    3:
    begin
      writeln('Введите размер промежутка по x');
      readln(mx);
      writeln('Введите размер промежутка по y');
      readln(my);
    end;
  end;
  x1 := l;
  y1 := fun(x1);
  i := 1;
  while i <= windowheight do
  begin
    line(x0 + round(i * mx), y0 - 3, x0 + round(i * mx), y0 + 3);
    line(x0 - round(i * mx), y0 - 3, x0 - round(i * mx), y0 + 3);
    line(x0 - 3, y0 + round(i * my), x0 + 3, y0 + round(i * my));
    line(x0 - 3, y0 - round(i * my), x0 + 3, y0 - round(i * my));
    textout(x0 + round(i * mx), y0 + 5, inttostr(i));
    textout(x0 - round(i * mx), y0 + 5, inttostr(-i));
    textout(x0 - 25, y0 - round(i * my), inttostr(i));
    textout(x0 - 20, y0 + round(i * my), inttostr(-i));
    i += 1;
  end;
  setpencolor(clred);
  while x1 <= b do
  begin
    y1 := fun(x1);
    x := x0 + round(x1 * mx);
    y := y0 - round(y1 * my);
    lineto(x, y);
    x1 += 0.001;
  end;
  textout(10, 10, 'Вычисление площади фигуры, ограниченной кривой 2*x^3+x^2+(-4)*x+15 и осью Ох (в положительной части по оси Оу)');
  textout(x0 + 5, 10, 'y');
  textout(windowheight + 880, y0 + 20, 'x');
  textout(x0 + 5, y0 + 5, '0');
  h := (b - a) / n;
  x1 := a;
  setpencolor(clblue);
  w := 0;
  while x1 <= b do
  begin
    y1 := fun(x1);
    x := x0 + round(x1 * mx);
    y := y0 - round(y1 * my);
    if y < y0 then
    begin
      rectangle(x, y, x0 + round((x1 + h) * mx), y0);
    end;
    inc(w);
    if w = n then
      break;
    x1 += h;
  end;
end;


function grap(var a,b,h: real; n:integer): integer;
begin
  var x0, y0, w: integer;
  var mx, my, x, y: integer;
  var x1, y1: real;
  var i: integer;
  Maximizewindow;
  x0 := windowwidth div 2;
  y0 := windowheight div 2;
  line(x0, 0, x0, windowheight);
  line(0, y0, windowwidth, y0);
  l := -10;
  k := 10;
  mx := 30;
  my := 30;
  x1 := l;
  y1 := fun(x1);
  i := 1;
  while i <= windowheight do
  begin
    line(x0 + round(i * mx), y0 - 3, x0 + round(i * mx), y0 + 3);
    line(x0 - round(i * mx), y0 - 3, x0 - round(i * mx), y0 + 3);
    line(x0 - 3, y0 + round(i * my), x0 + 3, y0 + round(i * my));
    line(x0 - 3, y0 - round(i * my), x0 + 3, y0 - round(i * my));
    textout(x0 + round(i * mx), y0 + 5, inttostr(i));
    textout(x0 - round(i * mx), y0 + 5, inttostr(-i));
    textout(x0 - 25, y0 - round(i * my), inttostr(i));
    textout(x0 - 20, y0 + round(i * my), inttostr(-i));
    i += 1;
  end;
  setpencolor(clred);
  while x1 <= b do
  begin
    y1 := fun(x1);
    x := x0 + round(x1 * mx);
    y := y0 - round(y1 * my);
    lineto(x, y);
    x1 += 0.001;
  end;
  textout(10, 10, 'Вычисление площади фигуры, ограниченной кривой 2*x^3+x^2+(-4)*x+15 и осью Ох (в положительной части по оси Оу)');
  textout(x0 + 5, 10, 'y');
  textout(windowheight + 880, y0 + 20, 'x');
  textout(x0 + 5, y0 + 5, '0');
  h := (b - a) / n;
  x1 := a;
  setpencolor(clblue);
  w := 0;
  while x1 <= b do
  begin
    y1 := fun(x1);
    x := x0 + round(x1 * mx);
    y := y0 - round(y1 * my);
    if y < y0 then
    begin
      rectangle(x, y, x0 + round((x1 + h) * mx), y0);
    end;
    inc(w);
    if w = n then
      break;
    x1 += h;
  end;
end;


function predel: integer;
begin
  ClrScr;
  var a, b, h, f, x, S: real;
  var n: integer;
  Textcolor(14);
  Writeln('Вычисление площади фигуры, ограниченной кривой 2*x^3+x^2+(-4)*x+15 и осью Ох (в положительной части по оси Оу)');
  Textcolor(15);
  println('Введите пределы интегрирования:');
  readln(a, b);
  println('Количество интервалов разбиения:');
  readln(n);
  h := (b - a) / n;
  x := a;
  for var i := 0 to n do
  begin
    f := fun(x);
    S := S + f;
    x := x + h;
  end;
  S := S * h;
  Textcolor(10);
  writeln('Ответ ', S:10:3);
  writeln;
  Textcolor(15);
  writeln('Вывести погрешность полученного результата?');
  vvod := vibor(vvod);
  case vvod of
    1:
      begin
        Textcolor(6);
        writeln('Погрешность = ', abs((fun1(b) - fun(a)) - S):10:3);
      end;
  end;
  writeln;
   vvod := vibor(vvod);
  case vvod of
    1: grap(a,b,h,n);
    0: exit();
  end;
  writeln();
  vvod:=vibor(vvod);
  case vvod of
    1:grap1(a,b,h,n);
    0:
  end;
  predel := 0;
  Textcolor(15);
  writeln('Начать заново?');
  vvod := vibor(vvod);
  case vvod of
    1: predel;
    0: exit();
  end;
  predel := 0;
end;


begin
  ClrScr;
  Textcolor(14);
  Writeln('Вычисление площади фигуры, ограниченной кривой 2*x^3+(-1)*x^2+(4)*x+(3) и осью Ох (в положительной части по оси Оу)');
  Textcolor(15);
  Writeln('Ввести пределы интегрирования в ручную?');
  vvod := vibor(vvod);
  case vvod of
    1: predel;
  end;
end.