program stick;
var l,m:array[0..1001]of longint;
     dp:Array[0..1001]of longint;
   ans,i,j,k,n:longint;
procedure sort(i,j:longint);
var x,y,ll,mm:longint;
begin
x:=i;y:=j;
ll:=l[(x+y)shr 1];
mm:=m[(x+y)shr 1];
repeat
while (ll<l[y])or((ll=l[y])and(mm<m[y]))do dec(y);
while (ll>l[x])or((ll=l[x])and(mm>m[x]))do inc(x);
if x<=y then
 begin
 l[0]:=l[x];l[x]:=l[y];l[y]:=l[0];
 m[0]:=m[x];m[x]:=m[y];m[y]:=m[0];
 inc(x);dec(y);
 end;
until x>y;
if i<y then sort(i,y);
if x<j then sort(x,j);
end;

begin
assign(input,'stick.in');reset(input);
assign(output,'stick.out');rewrite(output);
readln(n);
for i:=1 to n do
read(l[i],m[i]);
sort(1,n);

for i:=1 to n do
begin
dp[i]:=1;
for j:=i-1 downto 1 do
if (m[j]>m[i])and(dp[j]+1>dp[i])then
  dp[i]:=dp[j]+1;
if dp[i]>ans then ans:=dp[i];
end;
writeln(ans);
close(output);
end.