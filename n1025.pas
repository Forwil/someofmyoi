program n1025;
var dp:array[0..100001]of longint;
    t,i,j,k,n,m,x,y,s:longint;
begin
readln(n);
readln(t);
s:=0;
for i:=1 to n do
begin
 readln(x,y);
  for j:=s downto 0 do
   if (j+y<=t)and((j=0)or(dp[j]>0)) then
    begin
   if dp[j+y]<dp[j]+x then
      dp[j+y]:=dp[j]+x;
    if j+y>s then s:=j+y;
    if dp[j+y]>k then k:=dp[j+y];
    end;
end;
    writeln(k);
end.