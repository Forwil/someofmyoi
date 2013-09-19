{$I+,R-,S-,Q-}
const
  maxn = 1001;
var
  node, next : array[1..maxn * 2] of integer;
  first, province, center, num : array[1..maxn] of integer;
  visited : array[1..maxn] of boolean;
  inp, out, std, log : string;
  n, b, k, color, count : integer;
  visited_center : boolean;

procedure init;
begin
  inp :='royal.in'; //paramstr(1);
  out :='royal.out'; //paramstr(2);
//  std := paramstr(3);
//  log := paramstr(4);
end;

procedure readinp;
var
  x, y, i : integer;
begin
  assign(input, inp); reset(input);
  readln(n, b);
  for i := 1 to n - 1 do begin
    readln(x, y);
    node[i + i - 1] := y;
    next[i + i - 1] := first[x];
    first[x] := i + i - 1;
    node[i + i] := x;
    next[i + i] := first[y];
    first[y] := i + i;
  end;
  close(input);
end;

procedure print(score : real);
begin
//  assign(output, log); rewrite(output);
  writeln(score : 0 : 2);
//  close(output);
  halt;
end;

procedure readout;
var
  i, x : integer;
begin
  assign(input, out); reset(input);
  if IOResult <> 0 then print(0);
  readln(k);
  if IOResult <> 0 then print(0);
  for i := 1 to n do begin
    read(x);
    if (IOResult <> 0) or (x < 1) or (x > k) then print(0);
    province[i] := x;
    inc(num[x]);
  end;
  for i := 1 to k do
    if (num[i] < b) or (num[i] > b * 3) then print(0);
  for i := 1 to k do begin
    read(x);
    if (IOResult <> 0) or (x < 1) or (x > n) then print(0);
    center[i] := x;
  end;
  close(input);
end;

procedure dfs(i : integer);
var
  j, t : integer;
begin
  t := first[i];
  while t > 0 do begin
    j := node[t];
    if (province[j] = color) and not visited[j] then begin
       visited[j] := true;
       inc(count);
       dfs(j);
    end else if (j = center[color]) and not visited_center then begin
       visited_center := true;
       dfs(j);
    end;
    t := next[t];
  end;
end;

function check : boolean;
var
  i : integer;
begin
  for i := 1 to n do
    if not visited[i] then begin
       color := province[i];
       count := 1; visited[i] := true;
       visited_center := false;
       dfs(i);
       if count <> num[color] then print(0);
    end;
end;

procedure main;
begin
  readinp;
  readout;
  check;
end;

begin
  init;
  main;
  print(1);
end.
