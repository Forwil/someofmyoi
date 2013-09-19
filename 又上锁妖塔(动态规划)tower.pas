program tower;
var dp:array[-3..100001]of longint;
    x,i,n:longint;
function min(a,b:qword):qword;
begin if a>b then min:=b else min:=a;end;
begin
assign(input,'tower.in');
reset(input);
assign(output,'tower.out');rewrite(output);
readln(n);
dp[-1]:=maxlongint;
dp[-2]:=maxlongint;
for i:=1 to n+1 do
 begin
 if i<=n then  readln(x);
 dp[i]:=dp[i-1]+X;
 dp[i]:=min(dp[i],(min(dp[i-2],dp[i-3])+x));
 x:=0;
 end;
 writeln(dp[n+1]);
 close(output);
end.
