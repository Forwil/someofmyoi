program c10_7;
var dp:array[0..100001,0..1]of int64;
    a,b:array[0..100001]of longint;
    i,j,k,n,m:longint;
function min(a,b:int64):int64;
begin if a>b then min:=b else min:=a;end;
procedure sort1(i,j:longint);
var x,y,z:longint;
begin
x:=i;y:=j;z:=a[(x+y)shr 1];
repeat
while z<a[y] do dec(y);
while z>a[x] do inc(x);
if x<=y then
begin
 a[0]:=a[x];a[x]:=a[y];a[y]:=a[0];
 x:=x+1;y:=y-1;
end;
until x>y;
if i<y then sort1(i,y);
if x<j then sort1(x,j);
end;
procedure sort2(i,j:longint);
var x,y,z:longint;
begin
x:=i;y:=j;z:=b[(x+y)shr 1];
repeat
while z<b[y] do dec(y);
while z>b[x] do inc(x);
if x<=y then
begin
 b[0]:=b[x];b[x]:=b[y];b[y]:=b[0];
 x:=x+1;y:=y-1;
end;
until x>y;
if i<y then sort2(i,y);
if x<j then sort2(x,j);
end;
begin
fillchar(dp,sizeof(dp),$7f);
dp[0,0]:=0;
dp[0,1]:=0;
readln(n);
for i:=1 to n do
 readln(a[i],b[i]);
sort1(1,n);
sort2(1,n);
if a[1]<>b[1] then dp[1,0]:=abs(a[1]-b[1]);

for i:=2 to n do
 begin
 if a[i]<>b[i] then
 dp[i,0]:=min(dp[i-1,0],dp[i-1,1])+abs(a[i]-b[i]);
 if i>=2 then
   begin
   if (a[i]<>b[i])and(a[i-1]<>b[i-1]) then
    dp[i,0]:=min(dp[i,0],min(dp[i-2,0],dp[i-2,1])+abs(a[i]-b[i])+abs(a[i-1]-b[i-1]));
   if (a[i]<>b[i-1])and(a[i-1]<>b[i]) then
    dp[i,0]:=min(dp[i,0],min(dp[i-2,0],dp[i-2,1])+abs(a[i-1]-b[i])+abs(a[i]-b[i-1]));
   end;
 if i>=3 then
   begin
   if (a[i]<>b[i])and(a[i-1]<>b[i-1])and(a[i-2]<>b[i-2])then
   dp[i,1]:=min(dp[i,1],min(dp[i-3,1],dp[i-3,0])+abs(a[i]-b[i])+abs(a[i-1]-b[i-1])+abs(a[i-2]-b[i-2]));
   if (a[i]<>b[i])and(a[i-1]<>b[i-2])and(a[i-2]<>b[i-1])then
   dp[i,1]:=min(dp[i,1],min(dp[i-3,1],dp[i-3,0])+abs(a[i]-b[i])+abs(a[i-1]-b[i-2])+abs(a[i-2]-b[i-1]));
   if (a[i]<>b[i-1])and(a[i-1]<>b[i])and(a[i-2]<>b[i-2])then
   dp[i,1]:=min(dp[i,1],min(dp[i-3,1],dp[i-3,0])+abs(a[i]-b[i-1])+abs(a[i-1]-b[i])+abs(a[i-2]-b[i-2]));
   if (a[i]<>b[i-1])and(a[i-1]<>b[i-2])and(a[i-2]<>b[i])then
   dp[i,1]:=min(dp[i,1],min(dp[i-3,1],dp[i-3,0])+abs(a[i]-b[i-1])+abs(a[i-1]-b[i-2])+abs(a[i-2]-b[i]));
   if (a[i]<>b[i-2])and(a[i-1]<>b[i])and(a[i-2]<>b[i-1])then
   dp[i,1]:=min(dp[i,1],min(dp[i-3,1],dp[i-3,0])+abs(a[i]-b[i-2])+abs(a[i-1]-b[i])+abs(a[i-2]-b[i-1]));
   if (a[i]<>b[i-2])and(a[i-1]<>b[i-1])and(a[i-2]<>b[i])then
   dp[i,1]:=min(dp[i,1],min(dp[i-3,1],dp[i-3,0])+abs(a[i]-b[i-2])+abs(a[i-1]-b[i-1])+abs(a[i-2]-b[i]));
   end;
 end;
 writeln(min(dp[n,1],dp[n,0]));
end.
