program n1409;
var ind:Array[0..30001]of integer;
    i,j,k,n,m:longint;
procedure sort(i,j:longint);
var x,y,z:longint;
begin
x:=i;
y:=j;
z:=ind[(x+y) shr 1];
repeat
while z<ind[y] do dec(y);
while z>ind[x] do inc(x);
if x<=y then
 begin
 ind[0]:=ind[x];
 ind[x]:=ind[y];
 ind[y]:=ind[0];
 inc(x);dec(y);
 end;
until x>y;
if i<y then sort(i,y);
if x<j then sort(x,j);
end;
begin
readln(m);
readln(n);
for i:=1 to n do
readln(ind[i]);
sort(1,n);
k:=0;

for i:=1 to n do
 begin
  for j:=n downto i+1 do
   if ind[i]+ind[j]<=m then
     begin
     k:=k+1;
     ind[j]:=m;
     break;
     end;
 if ind[i]*2>m  then break;
 end;
 writeln(n-k);
end.
