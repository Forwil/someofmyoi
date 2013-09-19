program d9_16;
var dp:array[0..101,0..1001]of longint;
    tab:array[0..101,0..101]of longint;
    ind:array[0..101,0..3]of longint;
   z,i,j,k,n,m,ans:longint;
procedure sort(i,j:longint);
var x,y,z:longint;
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
readln(n,m);
for i:=1 to n do
begin
 readln(ind[i,1],ind[i,2],ind[i,3]);
 ind[i,0]:=i;
end;
for i:=1 to n do
for j:=1 to n do
 begin
 read(tab[i,j]);
 if j=n then readln;
 end;
 sort(1,n);
 for i:=1 to n do
 dp[i,ind[i,3]]:=ind[i,2];
for i:=1 to n do
  for j:=i-1 downto 1 do
   if ind[j,1]<ind[i,1] then
    for z:=0 to m do
    if dp[j,z]>0 then
     begin
     k:=z+ind[i,3]+tab[ind[i,0],ind[j,0]];
     if k<=m then
      if dp[i,k]<dp[j,z]+ind[i,2] then
         dp[i,k]:=dp[j,z]+ind[i,2];
      if dp[i,k]>ans then ans:=dp[i,k];
     end;
writeln(ans);
end.
