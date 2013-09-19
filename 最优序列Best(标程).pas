program best;

const
  inf = 'best.in';
  ouf = 'best.out';
  maxn = 1000;

type integer = longint;

const infinite = 1000000;

var f, g : array[0 .. 1 shl 10 - 1] of integer;
    n, m, k : integer;
    sum : array[0 .. 1 shl 10 - 1] of integer;
    value : array[1 .. maxn] of integer;

function max(a, b : integer): integer;
begin
  if a>b then max := a else max := b;
end;

procedure init;
var i : integer;
begin
  readln(n, m, k);
  for i := 1 to n do read(value[i]);
end;

procedure main;
var i, j, bit, answer: integer;
begin
  if m > 10 then begin writeln('YM is SuperMan!'); exit; end;

  sum[0] := 0; bit := 1 shl (m - 1);
  for i := 1 to 1 shl m - 1 do
    if i and 1 = 1
      then sum[i] := sum[i shr 1] + 1
      else sum[i] := sum[i shr 1];
  for i := 1 to 1 shl m - 1 do f[i] := - infinite; f[0] := 0;
  for i := 1 to n do begin
    g := f;
    for j := 0 to 1 shl m - 1 do if g[j] >= 0 then
      if j and bit > 0 then begin
        f[(j - bit) * 2] := max(f[(j - bit) * 2], g[j]);
        f[1 + (j - bit) * 2] := max(f[1 + (j - bit) * 2], g[j] + value[i]);
      end else begin
        f[j * 2] := max(f[j * 2], g[j]);
        if sum[1 + j * 2] <= k
          then f[1 + j * 2] := max(f[1 + j * 2], g[j] + value[i]);
      end;
  end;
  answer := 0;
  for i := 0 to 1 shl m - 1 do answer := max(answer, f[i]);
  writeln(answer);
end;

begin
  assign(input, inf); assign(output, ouf);
  reset(input); rewrite(output);
  init;
  main;
  close(input); close(output);
end.
