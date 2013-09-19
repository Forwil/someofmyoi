program river1;
var
    cost:Array[0..110000]of longint;
    dat:Array[0..110]of longint;
    dp:array[0..101,0..101]of longint;
  z,ans,now,l,i,j,k,n,m,x,s,t:longint;
function min(a,b:longint):longint;
begin if a>b then min:=b else min:=a;end;

begin
assign(input,'river.in');reset(input);
assign(output,'river.out');rewrite(output);
readln(l,n,m,s,t);
for i:= 1 to n do
 readln(dat[i]);
fillchar(cost,sizeof(cost),63);
cost[0]:=0;
for i:=1 to l do
for j:=s to t do
if i-j>=0 then
cost[i]:=min(cost[i],cost[i-j]+1);
n:=n+1;
dat[n]:=l+1;
dat[0]:=0;
fillchar(dp,sizeof(dp),63);
dp[0,0]:=0;
for i:=1 to n do
for j:=i-1 downto 0 do
begin
 now:=cost[dat[i]-dat[j]];
 if (i=n)and(dat[i]-dat[j]<s) then now:=1;
 for z:=1 to i do
  dp[i,z]:=min(dp[i,z],dp[j,z-1]+now);
end;
now:=maxlongint;
for i:=0 to n-1 do
 now:=min(now,dp[n,i]-i);
if now<=m then
 begin
 ans:=maxlongint;
 for i:=0 to n-1 do
  if dp[n,i]-i<=m then ans:=min(ans,dp[n,i]);
  writeln(ans);
 end
else
 begin
  for i:=n downto 0 do
  begin
  for j:=i downto 1 do
  if dp[i,j]-j<=m then break;
  if dp[i,j]-j<=m then break;
  end;
  writeln(dat[i]+t*(m-dp[i,j]+j));
 end;
close(output);
end.
