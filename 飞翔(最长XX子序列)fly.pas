program fly;
var dp:Array[0..1001]of longint;
    dat:Array[0..1001,1..2]of longint;
    ans,i,j,k,n,m:longint;
function max(a,b:longint):longint;
begin if a>B then max:=a else max:=b;end;
procedure sort(i,j:longint);
var x,y,z,zz:longint;
begin
x:=i;y:=j;
z:=dat[(x+y)shr 1,1];
zz:=dat[(x+y)shr 1,2];
repeat
while (z<dat[y,1])or((z=dat[y,1])and(zz<dat[y,2])) do dec(y);
while (z>dat[x,1])or((z=dat[x,1])and(zz>dat[x,2])) do inc(x);
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

begin
assign(input,'fly.in');reset(input);
assign(output,'fly.out');rewrite(output);
readln(n,m);
readln(k);
for i:=1 to k  do
 readln(dat[i,1],dat[i,2]);

 sort(1,k);

for i:=1 to k do
begin
if (dat[i,1]>n)or(dat[i,2]>m) then continue;
dp[i]:=1;
for j:=i-1 downto 1 do
 if (dat[i,1]>dat[j,1])and(dat[i,2]>dat[j,2])then
 dp[i]:=max(dp[i],dp[j]+1);
ans:=max(ans,dp[i]);
end;
writeln(100*(m+n-2*ans+sqrt(2)*ans):0:0);
close(output);
end.