program cirque;
var dp:Array[0..1,0..2001,0..1]of longint;
   dat:array[0..2001]of integer;
  cost:Array[0..2001,0..2001]of integer;
 r,ans,i,j,k,n,m,t,now:longint;
begin
assign(input,'cirque.in');reset(input);
assign(output,'cirque.out');rewrite(output);
readln(n,m);
for i:=1 to n do
begin
read(dat[i]);
t:=t+dat[i];
end;
for i:=1 to n do
for j:=i to n do
if dat[j]>cost[i,j-1]then cost[i,j]:=dat[j]
else cost[i,j]:=cost[i,j-1];

fillchar(dp,sizeof(dp),63);
r:=dp[0,0,0];
dp[0,n-m+1,1]:=0;
dp[0,n-m+1,0]:=0;
ans:=maxlongint;
now:=1;
for i:=m+1 to n-m+1 do
begin
now:=1-now;
for j:=n-m+1 downto i do
 begin
 if (i=m+1)and(j=n-m+1) then continue;
 dp[now,j,0]:=r;dp[now,j,1]:=r;
 if dp[now,j,0]> dp[1-now,j,0]+cost[i,j-1] then
    dp[now,j,0]:=dp[1-now,j,0]+cost[i,j-1];
 if dp[now,j,0]> dp[1-now,j,1]+cost[i,j-1]*(n-j+1+i-(m*2+1))then
    dp[now,j,0]:=dp[1-now,j,1]+cost[i,j-1]*(n-j+1+i-(m*2+1));
 if dp[now,j,1]> dp[now,j+1,1]+cost[i+1,j] then
    dp[now,j,1]:=dp[now,j+1,1]+cost[i+1,j];
 if dp[now,j,1]> dp[now,j+1,0]+cost[i+1,j]*(n-j+1+i-(m*2+1))then
    dp[now,j,1]:=dp[now,j+1,0]+cost[i+1,j]*(n-j+1+i-(m*2+1));
 if j=i then
  begin
  if dp[now,j,1]<ans then ans:=dp[now,j,1];
  if dp[now,j,0]<ans then ans:=dp[now,j,0];
  end;
 end;
end;
writeln(ans+t);
close(output);
end.
