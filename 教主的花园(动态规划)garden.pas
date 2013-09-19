program garden;
var  dp:Array[0..100000,1..4]of longint;
  a,b,c:Array[0..100000]of integer;
  t,i,j,k,n,m,ans:longint;
function max(a,b:longint):longint;
begin if a>B then max:=a else max:=b;end;
begin
assign(input,'garden.in');reset(input);
assign(output,'garden.out');rewrite(output);
readln(n);
for i:=1 to n do
 read(a[i],b[i],c[i]);
for t:=1 to 4 do
begin
dp[1,1]:=0;dp[1,2]:=0;dp[1,3]:=0;dp[1,4]:=0;
if t=1 then dp[1,1]:=a[1];
if t=2 then dp[1,2]:=b[1];
if t=3 then dp[1,3]:=b[1];
if t=4 then dp[1,4]:=c[1];
for i:=2 to n do
 begin
 dp[i,1]:=max(dp[i-1,3],dp[i-1,4])+a[i];
 dp[i,2]:=dp[i-1,4]+b[i];
 dp[i,3]:=dp[i-1,1]+b[i];
 dp[i,4]:=max(dp[i-1,1],dp[i-1,2])+c[i];
 end;
if t=1 then ans:=max(ans,max(dp[n,3],dp[n,4]));
if t=2 then ans:=max(ans,dp[n,4]);
if t=3 then ans:=max(ans,dp[n,1]);
if t=4 then ans:=max(ans,max(dp[n,1],dp[n,2]));
end;
writeln(ans);
close(output);
end.