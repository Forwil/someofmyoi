program power;
var dp:Array[0..1001,0..1001,0..1]of longint;
    sr,sl,d,w:array[0..1001]of longint;
   ans,i,j,k,n,m,v:longint;
function min(a,b:longint):longint;
begin if a>B then min:=b else min:=a;end;
begin
assign(input,'power.in');reset(input);
assign(output,'power.out');rewrite(output);
readln(n);
readln(v);
for i:=1 to n do
readln(d[i],w[i]);

for i:=1 to n do
sl[i]:=sl[i-1]+w[i];
for i:=n downto 1 do
sr[i]:=sr[i+1]+w[i];

for i:=1 to n do
for j:=1 to n do
begin
dp[i,j,1]:=maxlongint shr 1;
dp[i,j,0]:=maxlongint shr 1;
end;

dp[v,v,1]:=0;
dp[v,v,0]:=0;

for i:=v downto 1 do
for j:=v to n do
begin
if (i=v)and(j=v) then continue;
dp[i,j,0]:=min(dp[i,j,0],dp[i+1,j,0]+(sl[i]+sr[j+1])*(d[i+1]-d[i]));
dp[i,j,0]:=min(dp[i,j,0],dp[i+1,j,1]+(sl[i]+sr[j+1])*(d[j]-d[i]));
dp[i,j,1]:=min(dp[i,j,1],dp[i,j-1,1]+(sl[i-1]+sr[j])*(d[j]-d[j-1]));
dp[i,j,1]:=min(dp[i,j,1],dp[i,j-1,0]+(sl[i-1]+sr[j])*(d[j]-d[i]));
end;
writeln(min(dp[1,n,1],dp[1,n,0]));
close(output);
end.
