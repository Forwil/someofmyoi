program c10_8;
var dp:array[0..1001,0..1001,0..1]of longint;
    d,t:array[-2..1002]of longint;
    x,ans,i,j,k,n,m,r:longint;
function max(a,b:longint):longint;
begin if a>b then max:=a else max:=b;end;
function min(a,b:longint):longint;
begin if a>b then min:=b else min:=a;end;
procedure sort(i,j:longint);
var x,y,z:longint;
begin
x:=i;
y:=j;
z:=d[(x+y)shr 1];
repeat
while z<d[y] do dec(y);
while z>d[x] do inc(x);
if x<=y then
begin
t[0]:=t[x];t[x]:=t[y];t[y]:=t[0];
d[0]:=d[x];d[x]:=d[y];d[y]:=d[0];
x:=x+1;y:=y-1;
end;
until x>y;
if i<y then sort(i,y);
if x<j then sort(x,j);
end;
begin
readln(n,m,k);
for i:=1 to n do
 readln(d[i],t[i]);
sort(1,n);
t[0]:=0;
d[0]:=0;
fillchar(dp,sizeof(dp),63);
dp[1,n,0]:=0;
d[n+1]:=maxlongint shr 1;
d[n+2]:=maxlongint shr 1;
for i:=1 to n do
for j:=n downto  i do
 begin
 if dp[i,j,0]> max(dp[i-1,j,0]+d[i-1]-d[i-2],t[i-1]) then
    dp[i,j,0]:=max(dp[i-1,j,0]+d[i-1]-d[i-2],t[i-1]);
 if dp[i,j,0]> max(dp[i-1,j,1]+d[j+1]-d[i-1],t[i-1]) then
    dp[i,j,0]:=max(dp[i-1,j,1]+d[j+1]-d[i-1],t[i-1]);
 if dp[i,j,1]> max(dp[i,j+1,1]+d[j+2]-d[j+1],t[j+1])then
    dp[i,j,1]:=max(dp[i,j+1,1]+d[j+2]-d[j+1],t[j+1]);
 if dp[i,j,1]> max(dp[i,j+1,0]+d[j+1]-d[i-1],t[j+1])then
    dp[i,j,1]:=max(dp[i,j+1,0]+d[j+1]-d[i-1],t[j+1]);
 end;
 ans:=maxlongint;
for i:=1 to n do
begin
if ans> max(dp[i,i,0]+d[i]-d[i-1],t[i])+abs(d[i]-k) then
   ans:=max(dp[i,i,0]+d[i]-d[i-1],t[i])+abs(d[i]-k);
if ans> max(dp[i,i,1]+d[i+1]-d[i],t[i])+abs(d[i]-k) then
   ans:=max(dp[i,i,1]+d[i+1]-d[i],t[i])+abs(d[i]-k);
end;
writeln(ans);
end.
