program minmax;
var cost:Array[0..1001,0..1001]of longint;
    dp:array[0..1001,0..51]of longint;
    pass:array[0..1001,0..51]of boolean;
   x,i,j,k,m,n,t,max,min,k1,k2:longint;
   s:ansistring;
function minf(a,b:longint):longint;
begin if a>b then exit(b) else exit(a); end;
begin
assign(input,'minmax.in');reset(input);
assign(output,'minmax.out');rewrite(output);
readln(s);
readln(m);
n:=length(s);
for i:=1 to n do
for j:=i to n do
cost[i,j]:=(cost[i,j-1]*10+ord(s[j])-48)mod m;

fillchar(dp,sizeof(dp),63);
  dp[0,1]:=-1;
pass[0,1]:=true;
for i:=1 to n do
for j:=0 to i-1 do
for k:=0 to m-1 do
if pass[j,k] then
begin
        x:=(k*cost[j+1,i])mod m;
  dp[i,x]:=minf(dp[i,x],dp[j,k]+1);
pass[i,x]:=true;
end;

for k:=0 to m-1 do
if pass[n,k] then
begin max:=k;k2:=dp[n,k];end;
for k:=m-1 downto 0 do
if pass[n,k] then
begin min:=k;k1:=dp[n,k];end;

writeln(min,' ',k1,' ',max,' ',k2);
close(output);
end.
