program service;
var dp:array[0..1,0..201,0..201]of longint;
   dis:Array[0..201,0..201]of integer;
   x,y,l,now,kk,o,i,j,k,n,m,r,ans:longint;
function min(a,b:integer):integer;
begin if a>B then min:=b else min:=a;end;
function max(a,b:integer):integer;
begin if a>b then max:=a else max:=b;end;
begin
assign(input,'service.in');reset(input);
assign(output,'service.out');rewrite(output);
readln(n,m);
for i:=1 to n do
for j:=1 to n do
begin
read(dis[i,j]);
if j=n then readln;
end;
fillchar(dp,sizeof(dp),63);
r:=dp[0,0,0];
dp[0,1,2]:=0;
l:=3;
for kk:=1 to m do
 begin
 now:=1-now;
 fillchar(dp[now],sizeof(dp[now]),63);
 read(o);
 for i:=1 to n do
 for j:=i+1 to n do
 if (dp[1-now,i,j]<>R)and(i<>l)and(j<>l) then
  begin

  if (o<>i)and(o<>j)then
  if dp[now,i,j]>dp[1-now,i,j]+dis[l,o] then
    dp[now,i,j]:=dp[1-now,i,j]+dis[l,o];

  x:=min(l,j);y:=max(l,j);
  if (o<>x)and(o<>y) then
  if dp[now,x,y]>dp[1-now,i,j]+dis[i,o] then
    dp[now,x,y]:=dp[1-now,i,j]+dis[i,o];

  x:=min(l,i);y:=max(l,i);
  if (o<>x)and(o<>y)then
  if dp[now,x,y]>dp[1-now,i,j]+dis[j,o] then
    dp[now,x,y]:=dp[1-now,i,j]+dis[j,o];
  end;
 l:=o;
 end;
ans:=maxlongint;
for i:=1 to n do
for j:=i+1 to n do
if dp[now,i,j]<ans then ans:=dp[now,i,j];
writeln(ans);
close(output);
end.
