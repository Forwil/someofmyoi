program c9_19;
var dp:Array[0..1025,0..1025]of int64;
n,m,r,yan,du,t,ans:int64;
i,j:longint;
begin
readln(n,r,du,yan,t);
fillchar(dp,sizeof(dp),$ff);
dp[0,0]:=0;
for i:=1 to n do
  for j:=0 to i-1 do
  if dp[i-1,j]<>-1 then
    begin
     if dp[i,j+1]< dp[i-1,j]+yan*(i-j-1)*du*(n-i) then
        dp[i,j+1]:=dp[i-1,j]+yan*(i-j-1)*du*(n-i);
     if dp[i,j]< dp[i-1,j]+du*(j*yan+t)*(n-i) then
        dp[i,j]:=dp[i-1,j]+du*(j*yan+t)*(n-i);
     if dp[i,j]<>-1 then
     if ans<dp[i,j]+r*(j*yan+t)*(n-i) then
       ans:=dp[i,j]+r*(j*yan+t)*(n-i);
     if dp[i,j+1]<>-1 then
     if ans<dp[i,j+1]+r*((j+1)*yan+t)*(n-i) then
       ans:=dp[i,j+1]+r*((j+1)*yan+t)*(n-i);
    end;
writeln(ans);
end.
