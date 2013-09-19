program cut;
var i,j,k,n,m:longint;
 h,s:array[0..2000]of longint;
 dp:array[-1..2000,-1..2000]of longint;
procedure sort1(i,j:longint);
var x,y,z:longint;
begin
x:=i;y:=j;z:=h[(x+y)shr 1];
repeat
while z>h[y] do dec(y);
while z<h[x] do inc(x);
if x<=y then
begin
h[0]:=h[x];h[x]:=h[y];h[y]:=h[0];
inc(x);dec(y);
end;
until x>y;
if x<j then sort1(x,j);
if i<y then sort1(i,y);
end;

procedure sort2(i,j:longint);
var x,y,z:longint;
begin
x:=i;y:=j;z:=s[(x+y)shr 1];
repeat
while z>s[y] do dec(y);
while z<s[x] do inc(x);
if x<=y then
begin
s[0]:=s[x];s[x]:=s[y];s[y]:=s[0];
inc(x);dec(y);
end;
until x>y;
if x<j then sort2(x,j);
if i<y then sort2(i,y);
end;

function min(a,b:longint):longint;
begin if a>b then min:=b else min:=a;end;
begin
assign(input,'cut.in');reset(input);
assign(output,'cut.out');rewrite(output);
read(n,m);
for i:=1 to n-1 do
 read(h[i]);
for i:=1 to m-1 do
 read(s[i]);

sort1(1,n-1);
sort2(1,m-1);

fillchar(dp,sizeof(dp),63);
dp[0,0]:=0;
dp[-1,0]:=0;
dp[0,-1]:=0;
for i:=0 to n-1 do
for j:=0 to m-1 do
begin
if (i=0)and(j=0) then continue;
dp[i,j]:=min(dp[i,j-1]+s[j]*(i+1),dp[i-1,j]+h[i]*(j+1));
end;
writeln(dp[n-1,m-1]);
close(output);
end.
