program vijos6_2;
var dp:array[0..3001]of longint;
   ind:array[0..3001,1..3]of longint;
   time:array[0..3001]of longint;
   p:array[0..3001]of longint;
   z,i,j,k,n,m,t,x,y,ans,l:longint;
procedure sort(i,j:longint);
var x,y,z:longint;
begin
x:=i;
y:=j;
z:=time[(x+y)shr 1];
repeat
while z<time[y] do dec(y);
while z>time[x] do inc(x);
if x<=y then
 begin
 time[0]:=time[x];
 time[x]:=time[y];
 time[y]:=time[0];
 inc(x);dec(y);
 end;
until x>y;
if x<j then sort(x,j);
if i<y then sort(i,y);
end;
begin
assign(input,'n2.in');reset(input);
readln(n,m,t,k);
for i:= 1 to m do
 readln(ind[i,1],ind[i,2],ind[i,3]);
for i:=1 to k do
read(time[i]);
sort(1,k);
x:=1;
for i:=time[1] to t do
 begin
 if time[x+1]<=i then x:=x+1;
  p[i]:=x;
 end;

for i:=1 to k do
begin
dp[i]:=dp[i-1];
 for j:=1 to m do
 if time[i]-ind[j,2]>=0 then
  begin
    x:=p[time[i]-ind[j,2]];
    if x<>0 then
   if dp[x]+ind[j,3]-ind[j,1]>dp[i] then
    dp[i]:=dp[x]+ind[j,3]-ind[j,1];
  end;
end;
 writeln(dp[k]*n);
end.
