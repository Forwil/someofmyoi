program c10_8_;
var h,t:array[0..50001]of longint;
     p:Array[0..50001]of longint;
     i,j,k,n,m,r:longint;
procedure sort(i,j:longint);
var x,y,z,zz:longint;
begin
x:=i;y:=j;z:=h[(x+y)shr 1];zz:=t[(x+y)shr 1];
repeat
while (z<h[y])or((z=h[y])and(zz<t[y]))do dec(y);
while (z>h[x])or((z=h[x])and(zz>t[x]))do inc(x);
if x<=y then begin
h[0]:=h[x];h[x]:=h[y];h[y]:=h[0];
t[0]:=t[x];t[x]:=t[y];t[y]:=t[0];
x:=x+1;y:=y-1; end;
until x>y;
if x<j then sort(x,j);
if i<y then sort(i,y);
end;

begin
readln(n);
for i:=1 to n do
 readln(h[i],t[i]);
sort(1,n);
m:=0;
fillchar(p,sizeof(p),63);
r:=p[0];
p[0]:=0;
m:=0;
for i:=1 to n do
 begin
  for j:=m downto 0 do
   if p[j]+t[i]<=h[i] then
     if p[j]+t[i]<=p[j+1] then
       p[j+1]:=p[j]+t[i];
 if p[m+1]<>r then m:=m+1;
 end;
 writeln(m);
end.