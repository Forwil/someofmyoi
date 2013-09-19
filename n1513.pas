PROGRAM n1513;
var ind:array[0..50000,1..2]of longint;
      p:Array[0..50000]of longint;
  w,ans,i,j,k,n,m,t,flag:longint;
procedure sort(i,j:longint);
var x,y,z,zz:longint;
begin
x:=i;
y:=j;
z:=ind[(x+y) shr 1,1];
zz:=ind[(x+y)shr 1,2];
repeat
while (z<ind[y,1])or((zz=ind[y,1])and(zz<ind[y,2])) do dec(y);
while (z>ind[x,1])or((zz=ind[x,1])and(zz>ind[x,2])) do inc(x);
if x<=y then
begin
ind[0]:=ind[x];
ind[x]:=ind[y];
ind[y]:=ind[0];
dec(y);inc(x);
end;
until x>y;
if i<y then sort(i,y);
if x<j then sort(x,j);
end;
begin
readln(n);
for i:=1 to n do
 readln(ind[i,1],ind[i,2]);
sort(1,n);
fillchar(p,sizeof(p),$7f);
flag:=p[0];
p[0]:=0;
w:=0;
for i:=1 to n do
begin
for j:=w downto 0 do
 begin
  if ind[i,1]>=p[j]+ind[i,2] then
  begin
  if ind[i,2]+p[j]<p[j+1] then
     p[j+1]:=ind[i,2]+p[j];
  end;
 end;
 if p[w+1]<>flag then inc(w);
end;
writeln(w);
end.