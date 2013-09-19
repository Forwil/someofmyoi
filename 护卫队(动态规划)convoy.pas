program convoy;
var dp:Array[0..1001]of real;
    sum:Array[0..1001]of int64;
    ind:array[0..1001]of longint;
  s,i,j,k,n,m,x,y,v:longint;
function min(a,b:real):real;
begin if a>b then min:=b else min:=a;end;
begin
assign(input,'convoy.in');reset(input);
assign(output,'convoy.out');rewrite(output);
readln(m,s,n);
for i:=1 to n do
 begin
 readln(x,ind[i]);
 sum[i]:=sum[i-1]+x;
 end;
fillchar(dp,sizeof(dp),$7f);
dp[0]:=0;
for i:=1 to n do
begin
v:=maxlongint;
 for j:=i-1 downto 0 do
 if sum[i]-sum[j]<=m then
  begin
  if ind[j+1]<v then v:=ind[j+1];
  dp[i]:=min(dp[i],dp[j]+s/v);
  end
  else break;
end;
writeln(dp[n]*60:0:1);
close(output);
end.
