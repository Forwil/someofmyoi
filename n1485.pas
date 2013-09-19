program n1485;
var dp:array[0..50,0..50]of longint;
   i,j,k,l,m,n:longint;
begin
readln(n,m);
dp[0,1]:=1;
for i:=1 to m do
 for j:=1 to n do
  dp[i,j]:=dp[i-1,(j-1-1+n) mod n +1]+dp[i-1,(j+1-1+n) mod n +1];
writeln(dp[m,1]);
end.