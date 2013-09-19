program n1097;
var ind:array[0..10002]of longint;
     z:array[0..10002]of longint;
     min,t,t1,w1,i,j,k,n,m,ans:longint;
procedure sort(i,j:longint);
var x,y,z:longint;
begin
x:=i;
y:=j;
z:=ind[(x+y)shr 1];
repeat
while z<ind[y] do dec(y);
while z>ind[x] do inc(x);
if x<=y then
begin
ind[0]:=ind[x];
ind[x]:=ind[y];
ind[y]:=ind[0];
X:=x+1;
y:=y-1;
end;
until x>y;
if x<j then sort(x,j);
if i<y then sort(i,y);
end;
begin
readln(n);
for i:=1 to n do
 read(ind[i]);
 sort(1,n);
 t:=1;
 t1:=1;
 w1:=0;
for i:=1 to n-1 do
begin
min:=maxlongint;
if (t+1<=n)and(ind[t]+ind[t+1]<min) then
  begin
  k:=1;
  min:=ind[t]+ind[t+1];
  end;
if (t<=n)and(t1<=i-1)and(ind[t]+z[t1]<min) then
  begin
  k:=2;
  min:=ind[t]+z[t1];
  end;
if (t1+1<=i-1)and(z[t1]+z[t1+1]<min) then
 begin
 k:=3;
 min:=z[t1]+z[t1+1];
 end;
 ans:=ans+min;
if k=1 then t:=t+2;
if k=2 then begin t:=t+1;t1:=t1+1;end;
if k=3 then t1:=t1+2;
z[i]:=min;
end;
writeln(ans);
end.