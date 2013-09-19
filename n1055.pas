program n1055;
var ind:array[0..5002,1..2]of integer;
    x,y,ans,u,d,l,r,i,j,k,n,m:longint;
procedure sort(i,j,l:longint);
var x,y,z:longint;
begin
x:=i;
y:=j;
z:=ind[(x+y)shr 1,l];
repeat
while z<ind[y,l] do dec(y);
while z>ind[x,l] do inc(x);
if x<=y then
begin
ind[0]:=ind[x];
ind[x]:=ind[y];
ind[y]:=ind[0];
inc(x);dec(y);
end;
until x>y;
if x<j then sort(x,j,l);
if i<y then sort(i,y,l);
end;
begin
readln(n,m);
readln(k);
for i:=1 to k do
begin
 readln(x,y);
 ind[i,1]:=x;
 ind[i,2]:=y;
end;
ind[k+1,1]:=0;
ind[k+1,2]:=m;
ind[k+2,1]:=n;
ind[k+2,2]:=0;
k:=k+2;
sort(1,k,2);
for i:=1 to k do
begin
u:=0;
d:=n;
l:=ind[i,2];
for j:=i+1 to k do
 begin
  r:=ind[j,2];
  if (r=l)or(u=d) then break;
  if (r-l)*(d-u)>ans then ans:=(r-l)*(d-u);
 if ind[j,1]>ind[i,1] then
  begin
  if ind[j,1]<d then
  d:=ind[j,1];
  end
 else
  begin
  if ind[j,1]>u then
  u:=ind[j,1];
  end;
 end;
end;
for i:=k downto 1 do
begin
u:=0;
d:=n;
r:=ind[i,2];
for j:=i-1 downto 1 do
  begin
  l:=ind[j,2];
  if (l=r)or(u=d)then break;
  if (r-l)*(d-u)>ans then ans:=(r-l)*(d-u);
   if ind[j,1]>ind[i,1] then
  begin
  if ind[j,1]<d then
  d:=ind[j,1];
  end
 else
  begin
  if ind[j,1]>u then
  u:=ind[j,1];
  end;
  end;
end;
sort(1,k,1);
for i:=2 to k do
 begin
 if m*(ind[i,1]-ind[i-1,1])>ans then
 ans:=m*(ind[i,1]-ind[i-1,1]);
 end;
writeln(ans);
end.
