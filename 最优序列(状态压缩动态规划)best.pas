program best;
var dp:array[0..1001,0..1025]of int64;
    ind:array[0..1001]of longint;
    c:array[0..1024]of integer;
    kind:array[0..1200]of longint;
  o,l,t,z,i,j,k,n,m,ans:longint;
function max(a,b:longint):longint;
begin if a>b then max:=a else max:=b;end;
begin
assign(input,'best.in');reset(input);
assign(output,'best.out');rewrite(output);
readln(n,m,k);
for i:=1 to n do
 begin
 read(ind[i]);
 if eof then break;
 end;
for i:=0 to 1 shl m-1 do
   for j:=0 to m-1 do
   if i and (1 shl j)<>0 then inc(c[i]);

for i:=0 to 1 shl m-1 do
 if c[i]<=k then
   begin
   inc(t);
   kind[t]:=i;
   end;

for i:=1 to t do
for j:=0 to m-1 do
if (kind[i] and (1 shl j))<>0 then
dp[m,kind[i]]:=dp[m,kind[i]]+ind[m-j];

 l:=1 shl (m-1);
for i:=m+1 to n do
 begin
  for j:=1 to t do
   begin
    if (kind[j] and 1)=1 then
    dp[i,kind[j]]:=max(dp[i-1,(kind[j]shr 1)+l],dp[i-1,kind[j] shr 1])+ind[i];
    if (kind[j] and 1)=0 then
    dp[i,kind[j]]:=max(dp[i-1,(kind[j]shr 1)+l],dp[i-1,kind[j] shr 1]);
   end;
 end;
for i:=1 to t do
if dp[n,kind[i]]>ans then ans:=dp[n,kind[i]];
writeln(ans);
close(output);
end.
