program d9_4;
var dp:array[0..8001,-1..201]of boolean;
    ind:array[0..201]of integer;
   ans,x,y,z,i,j,k,n,m,s,sum:longint;
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
x:=x+1;y:=y-1;
end;
until x>y;
if x<j then sort(x,j);
if i<y then sort(i,y);
end;
begin
readln(n);
for i:=1 to n do
begin
 readln(ind[i]);
 sum:=sum+ind[i];
end;
sort(1,n);
s:=0;
dp[0,0]:=true;
dp[0,-1]:=true;
for i:=1 to n do
for j:=s downto 0 do
if (dp[j,-1]) then
begin
for z:=0 to n div 2+1 do
if dp[j,z] then
 dp[j+ind[i],z+1]:=true;
 dp[j+ind[i],-1]:=true;
 if j+ind[i]>s then s:=j+ind[i];
end;

ans:=maxlongint;
for i:=s downto 0 do
if dp[i,-1] then
begin
 for z:=0 to n div 2+1 do
 if dp[i,z] then
  if abs(n-2*z)<=1 then
  if abs(sum-2*i)<ans then
    begin
    ans:=abs(sum-2*i);
    x:=i;
    y:=sum-i;
    end;
end;
if x>y then writeln(y,' ',x)
else writeln(x,' ',y);
end.
