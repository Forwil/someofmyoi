program quake;
var dp:Array[0..101,-1..201]of longint;
    dat:array[0..101]of integer;
   v,i,j,k,n,m,ans:longint;
function max(a,b:longint):longint;
begin if a>b then max:=a else max:=b;end;
begin
assign(input,'quake.in');reset(input);
assign(output,'quake.out');rewrite(output);
readln(n,v,k);
for i:=2 to n do
 begin
  read(dat[i]);
  m:=max(m,dat[i]);
  end;
 if (dat[n]<=v)and(dat[n]+k>=v) then
   dp[n-1,v]:=v;

  for i:=n-2 downto 1 do
  for j:=dat[i+1] to dat[i+1]+k do
   begin
    if (dp[i+1,j-1]<>0)and(dp[i+1,j-1]+j-1>dp[i,j]) then dp[i,j]:=dp[i+1,j-1]+j;
    if (dp[i+1,j]<>0)and(dp[i+1,j]+j>dp[i,j]) then dp[i,j]:=dp[i+1,j]+j;
    if (dp[i+1,j+1]<>0)and(dp[i+1,j+1]+j+1>dp[i,j]) then dp[i,j]:=dp[i+1,j+1]+j;
  end;

for j:=0 to m+k do
ans:=max(ans,dp[1,j]);
if ans<>0 then
writeln(ans/(n-1):0:2)
else
writeln('YI DING YAO JIAN CHI JI HUA SHENG YU');
close(output);
end.
