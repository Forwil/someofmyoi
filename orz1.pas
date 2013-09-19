program orz1;
var ind:array[1..2,0..100001]of longint;
    ind1:array[1..2,0..100001]of longint;
    i,j,k,n,m:longint;
    x,xx,y,yy,ans:int64;
procedure sort(k,i,j:longint);
var x,y,z:longint;
begin
x:=i;
y:=j;
z:=ind[k,(x+y) shr 1];
repeat
while z<ind[k,y] do dec(y);
while z>ind[k,x] do inc(x);
if x<=y then
begin
ind[k,0]:=ind[k,x];
ind[k,x]:=ind[k,y];
ind[k,y]:=ind[k,0];
inc(x);dec(y);
end;
until x>y;
if i<y then sort(k,i,y);
if x<j then sort(k,x,j);
end;
begin
readln(n,k);
for i:=1 to n do
 read(ind[1,i]);
for i:=1 to n do
 read(ind[2,i]);
sort(1,1,n);
sort(2,1,n);
x:=0;xx:=0;
y:=0;yy:=0;
for i:=n downto n-k+1 do
 yy:=yy+ind[1,i];
for i:=1 to k do
 y:=y+ind[2,i];
if (yy-y)>ans  then ans:=(yy-y);
for i:=1 to k do
 begin
  x:=x+ind[1,i];
  xx:=xx+ind[2,n-i+1];
  yy:=yy-ind[1,n-k+i];
  y:=y-ind[2,k-i+1];
  if (xx-x)+(yy-y)>ans then ans:=(xx-x)+(yy-y);
 end;
writeln(ans);
end.
