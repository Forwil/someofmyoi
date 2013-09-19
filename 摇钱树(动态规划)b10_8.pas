program b10_8;
var d,r:array[0..1001]of longint;
  dp:Array[-1..1001,0..1001]of longint;
    i,j,k,n,m,ans:longint;
procedure sort(i,j:longint);
var x,y,z:longint;
begin
x:=i;y:=j;z:=r[(x+y)shr 1];
repeat
while z>r[y] do dec(y);
while z<r[x] do inc(x);
if x<=y then
begin
r[0]:=r[x];r[x]:=r[y];r[y]:=r[0];
d[0]:=d[x];d[x]:=d[y];d[y]:=d[0];
inc(x);dec(y);
end;
until x>y;
if i<y then sort(i,y);
if x<j then sort(x,j);
end;
begin
readln(n,k);
while (n<>0)or(k<>0) do
begin
 fillchar(dp,sizeof(dp),0);
 for i:=1 to n do
  read(d[i]);
  readln;
 for i:=1 to n do
  read(r[i]);
  readln;
  sort(1,n);
  ans:=0;
 for i:=0 to k-1 do
 for j:=1 to n do
 begin
 dp[i,j]:=dp[i,j-1];
 if dp[i-1,j-1]+d[j]-r[j]*i>dp[i,j] then
    dp[i,j]:=dp[i-1,j-1]+d[j]-r[j]*i;
  if dp[i,j]>ans then ans:=dp[i,j];
 end;
 writeln(ans);
 readln(n,k);
end;
end.
