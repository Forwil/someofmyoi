program d10_7_;
var ind:array[0..201,1..2]of longint;
    dp:array[0..20,0..403]of longint;
    sum:Array[0..201]of longint;
   ans,t,tot,x,y,i,j,k,n,m,r:longint;
function max(a,b:longint):longint;
begin if a>b then max:=a else max:=b;end;
begin

readln(n);
for i:=1 to n do
readln(ind[i,1],ind[i,2]);

for i:=1 to n do
for j:=i+1 to n do
if ind[i,2]<ind[j,2] then
 begin
 ind[0]:=ind[i];
 ind[i]:=ind[j];
 ind[j]:=ind[0];
 end;
for i:=1 to n do
sum[i]:=sum[i-1]+ind[i,1];
 m:=0;
 fillchar(dp,sizeof(dp),63);
 r:=dp[0,0];
 dp[0,0]:=0;

 ans:=maxlongint;
 for i:=1 to n do
 for j:=sum[n] downto 0 do
  begin
  if j-ind[i,1]>=0 then
  if dp[i,j]> max(j+ind[i,2],dp[i-1,j-ind[i,1]]) then
     dp[i,j]:=max(j+ind[i,2],dp[i-1,j-ind[i,1]]);
  if dp[i-1,j]<>r then
  if dp[i,j]> max(dp[i-1,j],sum[i]-j+ind[i,2]) then
     dp[i,j]:=max(dp[i-1,j],sum[i]-j+ind[i,2]);
   if (ans>dp[i,j])and(i=n)then
    ans:=dp[i,j]
  end;
  writeln(ans);
end.
