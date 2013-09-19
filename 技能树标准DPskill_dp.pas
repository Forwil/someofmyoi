program skill;
var dp:Array[-1..51,-1..51,0..700]of longint;
   dat,tot,sum:array[-1..51,-1..51]of longint;
   z,i,j,k,n,m,ans:longint;
begin
assign(input,'skill.in');reset(input);
assign(output,'skill.out');rewrite(output);
readln(n,m);
for i:=1 to n do
for j:=1 to n-i+1 do
 begin
  read(dat[i,j]);
  tot[i,j]:=(i+1)div 2;
  sum[i,j]:=sum[i-2,j+1]+dat[i,j];
 end;
 fillchar(dp,sizeof(dp),255);
dp[0,1,0]:=0;
dp[1,1,1]:=dat[1,1];
 for j:=1 to n do
 for i:=0 to n-j+1 do
 for z:=0 to m do
 if dp[i,j,z]<>-1 then
 begin
 if dp[i+1,j,z+tot[i+1,j]]< dp[i,j,z]+sum[i+1,j]then
    dp[i+1,j,z+tot[i+1,j]]:=dp[i,j,z]+sum[i+1,j];
 if dp[i-1,j+1,z+tot[i-1,j+1]]< dp[i,j,z]+sum[i-1,j+1]then
    dp[i-1,j+1,z+tot[i-1,j+1]]:=dp[i,j,z]+sum[i-1,j+1];
   if (i=0)and(dp[i,j,z]>dp[i,j+1,z]) then
 dp[i,j+1,z]:=dp[i,j,z];
 end;
writeln(dp[0,n+1,m]);
close(output);
end.
