program orz;
var dat:array[0..100000]of longint;
    z:array[0..10000]of longint;
    a:array[0..21]of longint;
   x,t1,t2,i,j,k,n,m,ans:longint;

procedure sort(i,j:longint);
var x,y,z:longint;
begin
x:=i;y:=j;z:=dat[(x+y)shr 1];
repeat
while z<dat[y] do dec(y);
while z>dat[x] do inc(x);
if x<=y then
begin
dat[0]:=dat[x];
dat[x]:=dat[y];
dat[y]:=dat[0];
inc(x);dec(y);
end;
until x>y;
if i<y then sort(i,y);
if x<j then sort(x,j);
end;

function min(a,B:longint):longint;
begin if a>b then min:=b else min:=a;end;

function getsmall:longint;
begin
if (t2<i)and((z[t2]<dat[t1])or(t1>n)) then
 begin t2:=t2+1; exit(z[t2-1]);end
else
begin t1:=t1+1; exit(dat[t1-1]);end;
end;

function  getdp:longint;
var dp:array[0..21,0..21]of longint;
    sum:array[0..21,0..21]of longint;
   i,j,z,minn:longint;
begin
fillchar(dp,sizeof(dp),63);
fillchar(sum,sizeof(sum),0);
for i:=m+1 to m*2 do
a[i]:=a[i-m];

for i:=1 to m*2 do
for j:=i to m*2 do
sum[i,j]:=sum[i,j-1]+a[j];

for i:=1 to m*2 do
dp[i,i]:=0;

for i:=2 to m*2 do
for j:=i-1 downto 1 do
for z:=j to i-1 do
if dp[j,i]>dp[j,z]+dp[z+1,i]+sum[j,i] then
   dp[j,i]:=dp[j,z]+dp[z+1,i]+sum[j,i];
   minn:=maxlongint;

   for i:=1 to m do
  minn:=min(minn,dp[i,i+m-1]);

  ans:=ans+minn;
exit(sum[1,m]);
end;
begin
assign(input,'orz.in');reset(input);
assign(output,'orz.out');rewrite(output);
readln(n,m,k);
for i:=1 to n do
 read(dat[i]);
 readln;
 sort(1,n);
 t1:=1;
 t2:=1;
 ans:=0;
 dat[0]:=0;
for i:=1 to k do
begin
for j:=1 to m do
 begin
 read(x);
 a[x]:=getsmall;
 end;
x:=getdp;
z[i]:=x;
end;
writeln(ans);
close(output);
end.
