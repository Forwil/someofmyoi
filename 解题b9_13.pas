program b9_13;
var dp:array[0..301,0..602]of longint;
    sum:Array[0..301,1..2]of longint;
    r,z,x,y,i,j,k,n,m:longint;
begin
fillchar(dp,sizeof(dp),63);
readln(m,n);
r:=dp[0,0];
dp[0,0]:=0;
for i:=1 to n do
 begin
 readln(x,y);
 sum[i,1]:=sum[i-1,1]+x;
 sum[i,2]:=sum[i-1,2]+y;
 for j:=i downto 0 do
 if (sum[i,2]-sum[j,2]<=m)
 and(sum[i,1]-sum[j,1]<=m) then
  for z:=n*2 downto 0 do
     begin
      k:=m-(sum[i,1]-sum[j,1]+dp[j,z]);
     if(sum[i,2]-sum[j,2]<dp[i,z+1])and(k>=0) then
       begin
        dp[i,z+1]:=sum[i,2]-sum[j,2];
        dp[i,z+2]:=0;
       end;
     end;
 end;
for i:=1 to n*2 do
if dp[n,i]<>r then
begin
writeln(i+2);
break;
end;
end.
