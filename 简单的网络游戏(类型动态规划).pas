program yt{¼òµ¥µÄÍøÂçÓÎÏ·};
var dp:Array[0..1,0..61,0..3601]of longint;
   dat:Array[0..61,0..61]of longint;
   sum:Array[0..61,0..61]of longint;
   now,i,z,j,k,n,m,x,r:longint;
   ans:qword;
begin
assign(input,'b.in');reset(input);
assign(output,'b.out');rewrite(output);
readln(m,n,k);
for i:=1 to n do
for j:=1 to m do
 begin
 read(dat[i,j]);
 sum[i,j]:=sum[i,j-1]+Dat[i,j];
 end;
ans:=maxlongint;
fillchar(dp,sizeof(dp),63);
r:=dp[0,0,0];
for i:=m downto 1 do
begin
dp[1,i]:=dp[1,i+1];
dp[1,i,i]:=sum[1,i];
end;

for i:=2 to n do
begin
 now:=i and 1;
 for j:=m downto 1 do
 for z:=j to k do
 dp[now,j,z]:=r;

 for j:=m downto 1 do
 for z:=j to k do
 begin
 dp[now,j,z]:=dp[now,j+1,z];
 if dp[now,j,z]>dp[1-now,j,z-j]+sum[i,j]then
   dp[now,j,z]:=dp[1-now,j,z-j]+sum[i,j];
 if (z=k)and((dp[now,j,z]<ans)or(ans=0))then
 ans:=dp[now,j,z];
 end;
end;
writeln(ans);
close(output);
end.