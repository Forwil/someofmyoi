program azshara;
var dp:array[0..1,0..1001]of longint;
    dat:array[0..1001]of longint;
 ans,i,j,k,n,m,now:longint;
function max(a,b:longint):longint;
begin if a>b then max:=a else max:=b;end;
begin
assign(input,'azshara.in');reset(input);
assign(output,'azshara.out');rewrite(output);
 readln(m,n);
 for i:=1 to n do
  begin
   for j:=1 to m do
    read(dat[j]);
    readln;
   now:=i and 1;
   for j:=1 to m do
   if dat[j]<>-1 then
    begin
    dp[now,j]:=max(dp[1-now,j-1],dp[1-now,j+1])+dat[j];
    dp[now,j]:=max(dp[now,j],dp[1-now,j]+dat[j]);
    end
   else dp[now,j]:=-(maxlongint shr 1);
  end;
for i:=1 to m do
 ans:=max(ans,dp[n and 1,i]);
writeln(ans);
close(output);
end.