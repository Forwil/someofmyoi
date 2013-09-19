program n1011;
var dp:Array[0..501,0..501]of longint;
    tab:array[0..501,0..501]of longint;
    ind:array[0..501*501,0..2]of integer;
  x,y,i,j,k,n,m,ans:longint;
procedure sort(i,j:longint);
var x,y,z:longint;
begin
x:=i;
y:=j;
z:=tab[ind[(x+y)shr 1,1],ind[(x+y)shr 1,2]];
repeat
while z<tab[ind[y,1],ind[y,2]] do dec(y);
while z>tab[ind[x,1],ind[x,2]] do inc(x);
if x<=y then
begin
ind[0]:=ind[x];
ind[x]:=ind[y];
ind[y]:=ind[0];
inc(x);dec(y);
end;
until x>y;
if i<y then sort(i,y);
if x<j then sort(x,j);
end;
begin
readln(n,m);
for i:=1 to n do
for j:=1 to m do
 begin
 read(tab[i,j]);
 ind[(i-1)*m+j,1]:=i;
 ind[(i-1)*m+j,2]:=j;
 if j=m then readln;
 end;
sort(1,n*m);
ans:=1;
for i:=1 to n*m do
 begin
 x:=ind[i,1];
 y:=ind[i,2];
 dp[x,y]:=1;
 if(tab[x,y]>tab[x+1,y])and(dp[x,y]<dp[x+1,y]+1) then  dp[x,y]:=dp[x+1,y]+1;
 if(tab[x,y]>tab[x,y+1])and(dp[x,y]<dp[x,y+1]+1) then  dp[x,y]:=dp[x,y+1]+1;
 if(tab[x,y]>tab[x-1,y])and(dp[x,y]<dp[x-1,y]+1) then  dp[x,y]:=dp[x-1,y]+1;
 if(tab[x,y]>tab[x,y-1])and(dp[x,y]<dp[x,y-1]+1) then  dp[x,y]:=dp[x,y-1]+1;
 if dp[x,y]>ans then ans:=dp[x,y];
 end;
 writeln(ans);
end.
