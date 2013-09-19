program n1680;
var dp:Array[0..201,0..201]of longint;
   i,j,k,n,m:longint;
   s1,s2:string;
function min(a,b:longint):longint;
begin if a>b then min:=b else min:=a;end;
begin
readln(s1);
readln(s2);
readln(k);
fillchar(dp,sizeof(dp),63);
for i:=1 to length(s2) do
 dp[0,i]:=i*k;
for i:=1 to length(s1) do
 dp[i,0]:=i*k;
dp[0,0]:=0;

for i:=1 to length(s1) do
for j:=1 to length(s2) do
 begin
 dp[i,j]:=min(dp[i,j],dp[i-1,j-1]+Abs(ord(s1[i])-ord(s2[j])));
 dp[i,j]:=min(dp[i,j],dp[i,j-1]+k);
 dp[i,j]:=min(dp[i,j],dp[i-1,j]+k);
 m:=dp[i,j];
 end;
 writeln(dp[length(s1),length(s2)]);
end.