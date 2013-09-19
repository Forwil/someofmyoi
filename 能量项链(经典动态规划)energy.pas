program energy;
var dp:array[0..101,0..101]of longint;
   ind:array[0..101,1..2]of longint;
  x,y,z,i,j,k,n,m,ans:longint;
function max(a,b:longint):longint;
begin if a>b then max:=a else max:=b;end;
begin
assign(input ,'energy.in');reset(input);
assign(output,'energy.out');rewrite(output);
readln(n);
for i:=1 to n do
 read(ind[i,1]);
for i:=1 to n-1 do
 ind[i,2]:=ind[i+1,1];
 ind[n,2]:=ind[1,1];
for i:=2 to n do
for j:=i-1 downto 1 do
for z:=i-1 downto j do
 dp[j,i]:=max(dp[j,i],dp[j,z]+dp[z+1,i]+(ind[z,2]*ind[i,2]*ind[j,1]));
 ans:=dp[1,n];
for i:=n downto 1 do
for j:=1 to i-1 do
begin
for z:=i to n do
dp[i,j]:=max(dp[i,j],dp[i,z]+dp[z mod n+1,j]+ind[i,1]*ind[z,2]*ind[j,2]);
for z:=1 to j-1 do
dp[i,j]:=max(dp[i,j],dp[i,z]+dp[z+1,j]+ind[i,1]*ind[z,2]*ind[j,2]);
if (ans<dp[i,j])and(j=i-1) then ans:=dp[i,j];
end;
writeln(ans);
close(output);
end.
