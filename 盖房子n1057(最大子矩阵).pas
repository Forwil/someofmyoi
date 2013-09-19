program n1057;
var dp:Array[0..1,0..1001]of longint;
    i,j,k,n,m,now,last,ans:longint;
function min (a,b:longint):longint;
begin if a>b then min:=b else min:=a;end;
begin
readln(n,m);
for i:=1 to n do
begin
now:=i and 1;
last:=1- now;
 for j:=1 to m do
  begin
  read(k);
  if k=1 then dp[now,j]:=min(min(dp[now,j-1],dp[last,j-1]),dp[last,j])+1
  else dp[now,j]:=0;
  if dp[now,j]>ans then ans:=dp[now,j];
  end;
end;
writeln(ans);
end.