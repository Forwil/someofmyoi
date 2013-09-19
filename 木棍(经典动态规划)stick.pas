program stick;
var dp:Array[0..1,0..2001]of longint;
   dat:array[0..2001]of longint;
   now,i,j,k,n,m:longint;

function min(a,b:longint):longint;
begin if a>B then min:=b else min:=a;end;

procedure sort(i,j:longint);
var x,y,z:longint;
begin
x:=i;y:=j;z:=dat[(x+y) shr 1];
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
if x<j then sort(x,j);
if i<y then sort(i,y);
end;

begin
assign(input,'stick.in');reset(input);
assign(output,'stick.out');rewrite(output);
readln(n,m);
for i:=1 to n do
 readln(dat[i]);

sort(1,n);

for i:=1 to m do
 begin
  now:=i and 1;
  dp[now,i*2-1]:=maxlongint;
  for j:=i*2 to n-(m-i)*2 do
  dp[now,j]:=min(dp[now,j-1],dp[1-now,j-2]+sqr(dat[j]-dat[j-1]));
 end;
writeln(dp[m and 1,n]);
close(output);
end.
