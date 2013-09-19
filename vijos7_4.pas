program vijios7_4;
var dp:array[0..1000,0..1000]of longint;
   sum:array[0..1000]of longint;
   out:array[0..1001]of longint;
 ans,t,w,mi,i,j,k,n,m,x:longint;
function max(a,b:longint):longint;
begin if a>b then max:=a else max:=b;end;
function min(a,b:longint):longint;
begin if a>b then min:=b else min:=a;end;
begin
readln(n,m);
for i:=1 to n do
 begin
 read(x);
 sum[i]:=sum[i-1]+x;
 end;
dp[1]:=sum;
for i:=2 to m do
for j:=i to n-(m-i) do
 begin
   t:=1;
   w:=j;
   mi:=(w+t)shr 1;
   dp[i,j]:=maxlongint;
   repeat
    if max(dp[i-1,mi],sum[j]-sum[mi])<dp[i,j] then
       dp[i,j]:=max(dp[i-1,mi],sum[j]-sum[mi]);
    if dp[i-1,mi]>sum[j]-sum[mi] then w:=mi-1
    else t:=mi+1;
    mi:=(w+t)shr 1;
   until t>w;
 end;
 out[m]:=n;

for i:=m-1 downto 1 do
 for j:=out[i+1]-1 downto i do
   if sum[out[i+1]]-sum[j]<=dp[m,n]  then
     out[i]:=j
   else break;
for i:=1 to m  do
writeln(out[i-1]+1,' ',out[i]);
end.
