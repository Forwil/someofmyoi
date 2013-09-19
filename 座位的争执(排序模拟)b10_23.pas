program b10_23;
var d,a:array[0..100000]of longint;
  i,j,k,n,m,x:longint;
  ans,y:int64;
procedure sort(i,j:longint);
var x,y,z:longint;
begin
x:=i;y:=j;
Z:=d[(i+J)shr 1];
repeat
while z<d[y] do dec(y);while z>d[x] do inc(x);
if x<=y then
begin
d[0]:=d[x];d[x]:=d[y];d[y]:=d[0];
inc(x);dec(y);
end;
until x>y;
if x<j then sort(x,j);
if i<y then sort(i,y);
end;
begin
assign(input,'b.in');reset(input);
assign(output,'b.out');rewrite(output);
 readln(n,m,k);
for i:=1 to m do
read(d[i]);
sort(1,m);
d[0]:=0;
for i:=1 to m do
 begin
 if a[i-1]<d[i] then
  a[i]:=d[i]
 else
  begin
  a[i]:=a[i-1]+1;
  ans:=ans+abs(d[i]-a[i]);
  end;
 end;
 writeln(ans);
 close(output);
end.
