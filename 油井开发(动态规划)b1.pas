var
     sum:array[0..61,0..61]of longint;
     dp:array[0..1,0..3601,0..61]of longint;
     min:array[0..3601,0..61]of longint;
  t,x,y,ans,now,last,z,i,j,k,n,m,l:longint;
begin
assign(input,'b.in');
reset(input);
assign(output,'b.out');rewrite(output);
readln(m,n,k);
for i:=1 to n do
begin
for j:=1 to m do
 begin
 read(x);
 sum[i,j]:=sum[i,j-1]+x;
 end;
readln;
end;
ans:=maxlongint;
fillchar(dp,sizeof(dp),$7f);
for i:=1 to m do
dp[1,i,i]:=sum[1,i];
if m>=k then ans:=dp[1,k,k];
fillchar(min,sizeof(min),$7f);
for i:=2 to n do
begin
now:=i and 1;
last:=1-now;
    for j:=1 to k do
    for z:=m downto 1 do
     begin
     min[j,z]:=min[j,z+1];
     if dp[last,j,z]<min[j,z] then
     min[j,z]:=dp[last,j,z];
     end;

    for z:=1 to m do
    begin
    for j:=1 to k do
    begin
      dp[now,j,z]:=21474836;
     if (j-z>0)and(sum[i,z]+min[j-z,z]<dp[now,j,z])then
      dp[now,j,z]:=sum[i,z]+min[j-z,z];
      l:=dp[now,j,z];
    end;
     if ans >dp[now,k,z] then
        ans:=dp[now,k,z];
 end;
end;
 writeln(ans);
 close(output);
end.
