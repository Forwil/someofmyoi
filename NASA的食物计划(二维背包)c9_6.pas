program c9_6;
var dp:array[0..500,0..500]of longint;
    ind:array[0..50,1..3]of longint;
    s,z,mv,i,j,m,k,n,mm,w,ans:longint;
begin

readln(mv,mm);
readln(n);
for i:=1 to n do
readln(ind[i,1],ind[i,2],ind[i,3]);

s:=0;
w:=0;
for i:=1 to n do
for j:=s downto 0 do
for z:=w downto 0 do
if (dp[j,z]>0)or((j=0)and(z=0)) then
if (z+ind[i,2]<=mm)and(j+ind[i,1]<=mv) then
 begin
 if dp[j+ind[i,1],z+ind[i,2]]< dp[j,z]+ind[i,3] then
    dp[j+ind[i,1],z+ind[i,2]]:=dp[j,z]+ind[i,3];

  if j+ind[i,1]>s then s:=j+ind[i,1];
  if z+ind[i,2]>w then w:=z+ind[i,2];

  if ans<dp[j+ind[i,1],z+ind[i,2]] then
    ans:=dp[j+ind[i,1],z+ind[i,2]];
 end;

writeln(ans);
end.
