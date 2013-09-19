 var i,j,n,mi,now:longint;
  f:array[1..100000]of ansistring;

procedure main;
var i,j:longint;
  begin
 f[1]:='2(0)';
 f[2]:='2';
 mi:=1;
 now:=2;
 i:=3;
 while i<=n do
   begin
 j:=1;
 while j<now do
   begin
 f[i]:=f[now]+'+'+f[j];
 inc(i);
 inc(j);
   end;
inc(mi);
f[i]:='2('+f[mi]+')';
now:=i;
inc(i);
   end;
  end;
begin
  readln(n);
  main;
  writeln(f[n]);
end.
