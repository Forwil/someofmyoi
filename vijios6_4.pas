program vijos6_4;
var dp:array[0..11000] of longint;
   r,v,c,i,j,k,n,m,s:longint;
   ind:array[0..10000,1..2]of longint;
function min(a,b:longint):longint;
begin if a> b then min:=b else min:=a;end;
function max(a,b:longint):longint;
begin if a> b then max:=a else max:=b;end;
procedure sort(i,j:longint);
var x,y,z:longint;
begin
x:=i;
y:=j;
z:=ind[(y+x)shr 1,1];
repeat
 while z<ind[y,1] do dec(y);
 while z>ind[x,1] do inc(x);
if x<=y then
begin
ind[0]:=ind[x];
ind[x]:=ind[y];
ind[y]:=ind[0];
inc(x);dec(y);
end;
until x>y;
if x<j then sort(x,j);
if i<y then sort(i,y);
end;
begin
assign(input,'bird.in');reset(input) ;
readln(v,n,c);
for i:=1 to n do
readln(ind[i,1],ind[i,2]);
s:=0;
fillchar(dp,sizeof(dp),$7f);
r:=dp[0];
dp[0]:=0;
sort(1,n);
for i:=1 to n do
begin
if ind[i,2]>v then continue;
for j:=s downto 0 do
 if (dp[j]<>r) then
  begin
  k:=j+ind[i,1];
  if j+ind[i,1]>=v then k:=v;
  dp[k]:=min(dp[j]+ind[i,2],dp[k]);
  s:=max(s,k);
  end;
end;
if c-dp[v]>=0 then
writeln(c-dp[v])
else writeln('Impossible');
end.
