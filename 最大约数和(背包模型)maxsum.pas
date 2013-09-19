program maxsum;
var dp:array[0..2000]of longint;
    i,j,k,n,m:longint;
    ind:longint;
function yue(x:longint):longint;
var i,z:longint;
begin
z:=1;
for i:=2 to trunc(sqrt(x)) do
 if (x mod i=0) then
 if not(i*i=x) then
   z:=z+i+x div i
else
  z:=z+i;
 if x=1 then exit(0)
 else
  exit(z);
end;
begin
assign(input,'maxsum.in');
reset(input);
assign(output,'maxsum.out');
rewrite(output);
readln(n);
dp[1]:=0;
for i:=2 to n do
 begin
  dp[i]:=yue(i);
  for j:=1 to i div 2 do
   if dp[j]+dp[i-j]>dp[i] then
    dp[i]:=dp[j]+dp[i-j];
 end;
writeln(dp[n]);
close(output);
end.
