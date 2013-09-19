program n1028;
var ind:array[0..2001]of string[76];
     dp:array[0..2001]of longint;
     i,j,k,n,m,ans:longint;
begin
readln(n);
for i:=1 to n do
 readln(ind[i]);
for i:=1 to n do
 begin
 for j:=i-1 downto 1 do
 if pos(ind[j],ind[i])=1 then
  if dp[j]>dp[i] then
     dp[i]:=dp[j];
 dp[i]:=dp[i]+1;
 if dp[i]>ans then ans:=dp[i];
 end;
 writeln(ans);
end.
