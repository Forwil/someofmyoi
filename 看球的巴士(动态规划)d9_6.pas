program d9_6;
var dp:array[0..2501]of longint;
    sum:array[0..2501,1..2]of longint;
    d,i,j,k,n,m:longint;
    ch:char;
begin

readln(n,d);
for i:=1 to n do
begin
 readln(ch);
 sum[i]:=sum[i-1];
 if ch='H' then sum[i,1]:=sum[i,1]+1;
 if ch='J' then sum[i,2]:=sum[i,2]+1;
end;
fillchar(dp,sizeof(dp),63);
dp[0]:=0;
for i:=1 to n do
  for j:=i-1 downto 0 do
  begin
   if abs((sum[i,1]-sum[j,1])-(sum[i,2]-sum[j,2]))<=d then
    if dp[j]+1<dp[i] then dp[i]:=dp[j]+1;
   if (sum[i,1]-sum[j,1]=0)or(sum[i,2]-sum[j,2]=0) then
    if dp[j]+1<dp[i] then dp[i]:=dp[j]+1;
  end;
 writeln(dp[n]);
end.