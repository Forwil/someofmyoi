program medic;
var dp:array[0..1,0..500,0..500]of longint;
    ind:array[0..100,0..2]of longint;
     x,y,z,i,j,k,n,m,l,t,s,w,l1:longint;
function max(a,b:longint):longint;
begin if a>b then max:=a else max:=b;end;
procedure sort(i,j:longint);
var x,y,z:longint;
begin
x:=i;
y:=j;
z:=ind[(i+j)shr 1,2];
repeat
while z<ind[y,2] do dec(y);
while z>ind[x,2] do inc(x);
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
assign(input,'medic.in');
reset(input);
assign(output,'medic.out');rewrite(output);
readln(t,n);
for i:=1 to n do
readln(ind[i,1],ind[i,2],ind[i,0]);
sort(1,n);
for i:=1 to n do
   begin
    for  x:=0 to t do
    for  y:=0 to x do
    begin
     l:=i and 1;
     l1:=1-l;
     dp[l,x,y]:=dp[l1,x,y];
      if x>0 then dp[l,x,y]:=max(dp[l,x,y],dp[l,x-1,y]);
      if y>0 then dp[l,x,y]:=max(dp[l,x,y],dp[l,x,y-1]);
      if x=ind[i,2] then dp[l,x,y]:=max(dp[l,x,y],dp[l1,ind[i,1]-1,y]+ind[i,0]);
      if y=ind[i,2] then dp[l,x,y]:=max(dp[l,x,y],dp[l1,x,ind[i,1]-1]+ind[i,0]);
      dp[l,y,x]:=dp[l,x,y];
    end;
  end;
 writeln(dp[n and 1,t,t]);
 close(output);
end.
