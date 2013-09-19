program waiter;
var dp:Array[0..2500,0..2500]of longint;
    dat:Array[0..2500]of longint;
    i,j,k,n,m,ans:longint;
function max(a,b:longint):longint;
begin if a>b then max:=a else max:=b;end;
begin
assign(input,'waiter.in');reset(input);
assign(output,'waiter.out');rewrite(output);
readln(n);
for i:=1 to n do
 read(dat[i]);
for i:=2 to n do
 for j:=i-2 downto 0 do
  begin
  dp[i,i-1]:=max(dp[i,i-1],dp[i-1,j]+dat[j]*dat[i]);
  dp[i,j]:=max(dp[i,j],dp[i-1,j]+dat[i-1]*dat[i]);
  end;
for i:=n-1 downto 0 do
ans:=max(ans,dp[n,i]+dat[i]*dat[n]);
writeln(ans);
close(output);
end.
