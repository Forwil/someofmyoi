program a9_5;
var dp:array[0..1,0..5001]of longint;
   ind:array[0..5001]of longint;
   ans,i,j,k,n,m,now,last:longint;
function min(a,b:longint):longint;
begin if a>b then min:=b else min:=a;end;

begin
 readln(m,n);
for i:=1 to n do
 read(ind[i]);

for i:=1 to m do
begin
now:=i and 1;
last:=1- now;
dp[now,i*2-1]:=maxlongint;
for j:=i*2 to n-((m-i)*3+1) do
 dp[now,j]:=min(dp[last,j-2]+sqr(ind[j]-ind[j-1]),dp[now,j-1]);

for j:=n-((m-i)*3) to n do
 dp[now,j]:=dp[now,j-1];
end;

ans:=maxlongint;
for i:=m*2 to n-1 do
if dp[m and 1,i]<ans then ans:=dp[m and 1,i];

writeln(ans);
end.
