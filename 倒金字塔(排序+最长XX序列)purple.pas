program purple;
var ind:array[0..100001,1..2]of longint;
    dp:array[0..100000]of longint;
    p:array[0..100000]of longint;
i,j,k,n,m,ans:longint;
function min(a,b:longint):longint;
begin if a>b then min:=b else min:=a;end;
function max(a,b:longint):longint;
begin if a>b then max:=a else max:=b;end;
procedure sort(i,j:longint);
var x,y,z,zz:longint;
begin
x:=i;
y:=j;
z:=ind[(x+y)shr 1,1];
zz:=ind[(x+y)shr 1,2];
repeat
while (z>ind[y,1])or((z=ind[y,1])and(zz>ind[y,2])) do dec(y);
while (z<ind[x,1])or((z=ind[x,1])and(zz<ind[x,2])) do inc(x);
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
assign(input,'purple.in');reset(input);
assign(output,'purple.out');rewrite(output);
readln(n);
for i:=1 to n do
readln(ind[i,1],ind[i,2]);
sort(1,n);
m:=0;
p[0]:=maxlongint;
for i:=1 to n do
begin
  for j:=m downto 0 do
   if p[j]>=ind[i,2] then
    begin
    dp[i]:=j+1;
    break;
    end;
m:=max(m,dp[i]);
if ind[i,2]>p[dp[i]] then p[dp[i]]:=ind[i,2];
end;
writeln(m);
close(output);
end.
