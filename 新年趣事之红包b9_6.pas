program b9_6;
var dp:array[0..801,0..801]of real;
    ind:array[0..801,1..2]of real;
    i,j,k,n,m:longint;
    ans,tot:real;
function dis(x,y:longint):real;
begin
if (x=0)or(y=0) then exit(0);
exit(sqrt(sqr(ind[x,1]-ind[y,1])+sqr(ind[x,2]-ind[y,2])));
end;
procedure sort(i,j:longint);
var x,y:longint;
  z:real;
begin
x:=i;
y:=j;
z:=ind[(x+y)shr 1,1];
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
 assign(input,'b.in');reset(input);
readln(n);
for i:=1 to n do
begin
readln(ind[i,1],ind[i,2]);
if i>=2 then tot:=tot+dis(i,i-1);
if dis(i,i-1)>ans then ans:=dis(i,i-1);
end;
tot:=tot+dis(1,n);
if dis(1,n)>ans then ans:=dis(1,n);
{sort(1,n);
fillchar(dp,sizeof(dp),$7f);
dp[1,0]:=0;
for i:=2 to n do
for j:=i-2 downto 0 do
begin
if dp[i,j]>dp[i-1,j]+dis(i,i-1) then
   dp[i,j]:=dp[i-1,j]+dis(i,i-1);

if dp[j,i]>dp[j,i-1]+dis(i,i-1) then
   dp[j,i]:=dp[j,i-1]+dis(i,i-1);

if dp[i-1,i]>dp[i-1,j]+dis(i,j) then
   dp[i-1,i]:=dp[i-1,j]+dis(i,j);

if dp[i,i-1]>dp[j,i-1]+dis(i,j) then
   dp[i,i-1]:=dp[j,i-1]+dis(i,j);
end;

ans:=1e38;
for i:=0 to  n-1 do
 if dp[n,i]+dis(i,n)<ans then
    ans:=dp[n,i]+dis(i,n);   }

 writeln(tot-ans:0:3);
end.
