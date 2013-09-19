program orz2;
var ind:array[0..2001]of longint;
    dp:Array[0..2001,1..2]of longint;
 i,j,k,n,m,c,nc,cost:longint;
function min(a,b:longint):longint;
begin if a>b then min:=b else min:=a;end;
begin
readln(n);
for i:=1 to n do
read(ind[i]);
fillchar(dp,sizeof(dp),63);
dp[n,1]:=0;
dp[n-1,1]:=abs(ind[n]-ind[n-1]);
dp[n-1,2]:=dp[n-1,1];
dp[n+1,1]:=0;
dp[n+1,2]:=0;
for i:=n-2 downto 1 do
 begin
  dp[i,1]:=min(dp[i+1,1]+abs(ind[i]-ind[i+1]),dp[i+1,2]+abs(ind[i]-ind[i+2]));
  cost:=0;
 for j:=i+1 to n do
   begin
   nc:=dp[j+1,1];
   c:=dp[j+1,2];
   if j<>i+1 then
   cost:=cost+abs(ind[j-1]-ind[j]);
   if j<>n then
   begin
   nc:=nc+abs(ind[j+1]-ind[i]);
   c:=c+abs(ind[j+2]-ind[i]);
   end;
   dp[i,2]:=min(dp[i,2],min(nc,c)+cost+abs(ind[i]-ind[j]));
   end;
 end;
writeln(min(dp[1,1],dp[1,2]));
end.