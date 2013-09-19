program service;
var dp:array[0..250,0..500]of longint;
    cost,cl,cr:array[0..500,0..500]of longint;
   w,x,c:Array[0..500]of longint;
ans,z,zz,l,s,i,j,k,n,m,ll:longint;
function min(a,b:longint):longint;
begin if a>b then exit(b) else exit(a);end;
begin
assign(input,'input.txt');reset(input);
assign(output,'output.txt');rewrite(output);
readln(n,k);
for i:=1 to n do
 read(x[i],w[i],c[i]);
for i:=1 to n do
begin
s:=0;
for j:=i+1 to n do
 begin
 s:=s+w[j-1];
 cl[i,j]:=cl[i,j-1]+s*(x[j]-x[j-1]);
 end;
end;

for i:=n downto 1 do
begin
s:=0;
for j:=i-1 downto 1 do
 begin
 s:=s+w[j+1];
 cr[j,i]:=cr[j+1,i]+s*(x[j+1]-x[j]);
 end;
end;

 for i:=1 to n do
 for j:=i to n do
  begin
  cost[i,j]:=maxlongint;
  for z:=i to j do
  cost[i,j]:=min(cost[i,j],cl[i,z]+cr[z,j]+c[z]);
  end;

fillchar(dp,sizeof(dp),63);
for i:=1 to n do
 dp[1,i]:=cost[1,i];
 ans:=dp[1,n];

for i:=2 to k do
begin
for j:=i to n do
for z:=j-1 downto i-1 do
dp[i,j]:=min(dp[i,j],dp[i-1,z]+cost[z+1,j]);
ans:=min(ans,dp[i,n]);
end;

writeln(ans);
close(output);
end.
