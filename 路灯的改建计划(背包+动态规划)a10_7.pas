program a10_7;
var dp:Array[0..8100]of longint;
    ind:array[0..200,1..2]of longint;
    t:array[0..200,0..200]of longint;
    dd:array[0..100,0..200]of longint;
    ans,nn,l,z,i,j,k,n,m,o:longint;
function max(a,b:longint):longint;
begin if a>b then max:=a else max:=b;end;
function min(a,b:longint):longint;
begin if a>b then min:=b else min:=a;end;

begin
readln(n,m,k);
for i:=1 to n do
readln(ind[i,1],ind[i,2]);
for i:=1 to n do
begin
fillchar(dp,sizeof(dp),0);
o:=0;
  for j:=i to n do
  begin
   for z:=o downto 0 do
   begin
   if ((z=0)or(dp[z]<>0))and(z+ind[j,1]<=(k*(n-i+1))) then
   dp[z+ind[j,1]]:=max(dp[z+ind[j,1]],dp[z]+ind[j,2]);
   if (z+ind[j,1]>o)and(z+ind[j,1]<=k*(n-i+1)) then o:=z+ind[j,1];
   end;
   for z:=k*(j-i+1) downto 0 do
   if dp[z]>t[i,j] then t[i,j]:=dp[z];
  end;
end;
for i:=1 to m do
for j:=i to n-(m-i) do
for z:=j-1 downto i-1 do
dd[i,j]:=max(dd[i,j],dd[i-1,z]+t[z+1,j]);

writeln(dd[m,n]);
end.
