program apple;
var  ap,id,wi,ans:array[0..100000]of longint;
  i,j,k,n,m:longint;
procedure sort1(i,j:longint);
var x,y,z:longint;
begin
x:=i;
y:=j;
z:=ap[(x+y)shr 1];
repeat
while z>ap[y] do dec(y);
while z<ap[x] do inc(x);
if x<=y then
begin
ap[0]:=ap[x];
ap[x]:=ap[y];
ap[y]:=ap[0];
inc(x);dec(y);
end;
until x>y;
if x<j then sort1(x,j);
if i<y then sort1(i,y);
end;
procedure sort2(i,j:longint);
var x,y,z:longint;
begin
x:=i;
y:=j;
z:=wi[(x+y)shr 1];
repeat
while z>wi[y] do dec(y);
while z<wi[x] do inc(x);
if x<=y then
begin
wi[0]:=wi[x];
wi[x]:=wi[y];
wi[y]:=wi[0];
id[0]:=id[x];
id[x]:=id[y];
id[y]:=id[0];
inc(x);dec(y);
end;
until x>y;
if x<j then sort2(x,j);
if i<y then sort2(i,y);
end;
begin
assign(input,'apple.in');reset(input);
assign(output,'apple.out');rewrite(output);
readln(n,m);
for i:=1 to n do
read(ap[i]);
for i:=1 to m do
begin
read(wi[i]);
id[i]:=i;
end;
sort1(1,n);
sort2(1,m);
for i:=1 to n do
 ans[id[(i-1) mod m+1]]:=
 ans[id[(i-1) mod m+1]]+ap[i];
for i:=1 to m do
if i<m then write(ans[i],' ')
else writeln(ans[i]);
close(output);
end.
