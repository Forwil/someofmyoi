program vijos3_3;
var ind:array[0..2000]of longint;
    dp:array[0..2000]of longint;
    sum:array[0..2000]of longint;
    s,i,j,k,n,m,ans,t:longint;
procedure upda(var a,b:longint);
begin if b>a then a:=b;end;
begin
readln(n,m);
for i:=1 to n do
read(ind[i]);
for i:=1 to n do
sum[i]:=sum[i-1]+ind[i];
dp[0]:=m;
for i:=1 to n do
 begin
 for j:=i-1 downto 0 do
  if i*100<=dp[j] then
  begin
  k:=dp[j]+sum[i]-sum[j];
  upda(dp[i],k);
  end;
  dp[i]:=dp[i]-i*100;
 end;
writeln(dp[n]);
end.
