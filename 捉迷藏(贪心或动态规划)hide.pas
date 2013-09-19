program hide;
var dat:array[0..1001]of integer;
     dp:Array[0..1001]of longint;
    i,j,k,n,m,p:longint;
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
end
until x>y;
if i<y then sort(i,y);
if x<j then sort(x,j);
end;

function min(a,b:longint):longint;
begin if a>B then min:=b else min:=a;end;

begin
assign(input,'hide.in');reset(input);
assign(output,'hide.out');rewrite(output);
readln(n,m,p);
for i:=1 to n do
read(dat[i]);
sort(1,n);
fillchar(dp,sizeof(dp),63);
dp[0]:=0;
for i:=1 to n do
 for j:=i-1 downto 0 do
  if dat[i]-dat[j+1]<=p then
     dp[i]:=min(dp[i],dp[j]+1)
  else break;

if dp[n]>m then writeln('No')
else writeln('Yes');
close(output);
end.
