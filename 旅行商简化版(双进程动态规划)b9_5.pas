program b9_5;
var ind:array[0..1001,1..2]of real;
     dp:array[0..1001,0..1001]of double;
     i,j,n,m:longint;
     ans,k:double;
function dis(x,y:longint):double;
begin
exit(sqrt(sqr(ind[x,1]-ind[y,1])+sqr(ind[x,2]-ind[y,2])));
end;
procedure sort(i,j:longint);
var x,y:longint;
z:real;
begin
x:=i;
y:=j;
z:=ind[(x+y)shr 1,1];
repeat
while z<ind[y,1] do dec(y);
while z>ind[x,1] do inc(x);
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
readln(ind[i,1],ind[i,2]);

sort(1,n);
fillchar(dp,sizeof(dp),$7f);
dp[2,1]:=dis(1,2);
for i:=3 to n do
for j:=i-1 downto 1 do
begin
 if dp[i,j]> dp[i-1,j]+dis(i,i-1) then
    dp[i,j]:=dp[i-1,j]+dis(i,i-1);

 if dp[i,i-1]>dp[i-1,j]+dis(i,j) then
    dp[i,i-1]:=dp[i-1,j]+dis(i,j);
end;

ans:=1e38;

for i:=1 to n-1 do
if dp[n,i]+dis(n,i)<ans then
ans:=dp[n,i]+dis(n,i);

writeln(ans:0:2);
end.
