program alamein;
var dp:array[0..1,0..26,0..26]of longint;
   dis:Array[0..26,0..26]of longint;
 kk,q,p,l,o,i,j,k,n,m,x,y,z,now,r,ans:longint;
 ch:char;
function min(a,b:integer):integer;
begin if a>B then exit(b)else exit(a);end;
function max(a,b:integer):integer;
begin if a>B then exit(a)else exit(b);end;
begin
assign(input,'alamein.in');reset(input);
assign(output,'alamein.out');rewrite(output);
readln(n,m);
for i:=1 to n do
for j:=1 to m do
for x:=1 to n do
for y:=1 to m do
dis[(i-1)*m+j,(x-1)*m+y]:=abs(x-i)+abs(y-j);

fillchar(dp,sizeof(dp),63);
r:=dp[0,0,0];
dp[0,1,2]:=0;
read(ch);
l:=3;
while ch in ['A'..'Z'] do
 begin
 now:=1-now;
 fillchar(dp[now],sizeof(dp[now]),63);
 o:=ord(ch)-64;
 for x:=1 to 26 do
 for y:=x to 26 do
 if dp[1-now,x,y]<>r then
  begin
 if dp[now,x,y] >dp[1-now,x,y]+dis[l,o] then
    dp[now,x,y]:=dp[1-now,x,y]+dis[l,o];

 q:=min(y,l);p:=max(y,l);
 if dp[now,q,p] >dp[1-now,x,y]+dis[x,o] then
    dp[now,q,p]:=dp[1-now,x,y]+dis[x,o];

 q:=min(x,l);p:=max(x,l);
 if dp[now,q,p] >dp[1-now,x,y]+dis[y,o] then
    dp[now,q,p]:=dp[1-now,x,y]+dis[y,o];

 end;
 read(ch);
 l:=o;
 end;

 ans:=maxlongint;
for i:=1 to 26 do
for j:=i to 26 do
if dp[now,i,j]<ans then
ans:=dp[now,i,j];
writeln(ans);
close(output);
end.
