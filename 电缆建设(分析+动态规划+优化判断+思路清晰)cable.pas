program cable;
var dp:Array[0..600001,0..1,0..1]of extended;
   a,b:array[0..600001]of int64;
   x1,x2,i,j,k,n,m:longint;
   x:extended;
   re:int64;
function dis(i,j:longint):extended;
begin
exit(sqrt(x+sqr(a[i]-b[j])));
end;

function min(a,b:extended):extended;
begin if a>b then min:=b else min:=a;end;

begin


assign(input,'cable.in');reset(input);
assign(output,'cable.out');rewrite(output);
readln(n,m,x1,x2);
x:=sqr(x1-x2);
for i:=1 to n do
begin
read(re);
a[i]:=re;
if i<>1 then a[i]:=a[i]+a[i-1];
end;

for i:=1 to m do
begin
read(re);
b[i]:=re;
if i<>1 then b[i]:=b[i]+b[i-1];
end;

dp[1,1,1]:=dis(1,1);
dp[1,1,0]:=0;
j:=1;
for i:=1 to n do
 begin
 if i<>1 then
  begin
  dp[i,j and 1,1]:=min(min(dp[i-1,j and 1,1]+dis(i,j),
                           dp[i-1,j and 1,1]+a[i]-a[i-1]),
                           dp[i-1,j and 1,0]+dis(i,j)+a[i]-a[i-1]);
  dp[i,j and 1,0]:=min(dp[i-1,j and 1,1],
                       dp[i-1,j and 1,0]+a[i]-a[i-1]);
  end;
 while (j<m)and((i=n)or(b[j]<=a[i])) do
  begin
  j:=j+1;{可以证明，应该先+1，
  先判断可能考虑了不存在的状态，
  导致答案小于标准答案.如果不大放心可以考虑赋初值
  经验证。初值后全部216。所以还是要+1后判断。标准转移}
  dp[i,j and 1,1]:=min(min(dp[i,1-j and 1,1]+dis(i,j),
                           dp[i,1-j and 1,1]+b[j]-b[j-1]),
                           dp[i,1-j and 1,0]+dis(i,j)+b[j]-b[j-1]);

  dp[i,j and 1,0]:=min(dp[i,1-j and 1,1],
                       dp[i,1-j and 1,0]+b[j]-b[j-1]);

  end;
 end;
writeln(dp[n,m and 1,1]:0:2);
close(output);
end.
