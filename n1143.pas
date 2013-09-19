program n1143;
var dp:array[0..41,0..21,0..21,0..21]of longint;
    ind:Array[0..21,0..21]of longint;
    z,i,j,k,n,m,l,o:longint;
function get(x,y,z:longint):longint;
begin
if (x=y)and(y=z) then
  exit(ind[x,i-x+1]);

if ((x=y)and(x<>z))or((x<>z)and(z=y)) then
  exit(ind[x,i-x+1]+ind[z,i-z+1]);

if (x=z)and(y<>z) then
  exit(ind[x,i-x+1]+ind[y,i-y+1]);

if (x<>y)and(x<>z)and(y<>z) then
  exit(ind[x,i-x+1]+ind[y,i-y+1]+ind[z,i-z+1]);
end;
begin
assign(input,'n1143.in');reset(input);
readln(n);
for i:=1 to n do
  for j:=1 to n do
   begin
   read(ind[i,j]);
   if j=n then readln;
   end;
dp[1,1,1,1]:=ind[1,1];

 for i:=2 to n*2-1 do
  begin

  if i<=n then
  begin
   m:=1;
   o:=i;
  end
  else
  begin
  m:=i-n+1;
  o:=n;
  end;
   for j:=m to o do
   for z:=m to o do
   for k:=m to o do
    begin
    l:=get(j,z,k);

    if dp[i,j,z,k]< dp[i-1,j-1,z,k]+l then
       dp[i,j,z,k]:=dp[i-1,j-1,z,k]+l;
    if dp[i,j,z,k]< dp[i-1,j-1,z-1,k]+l then
       dp[i,j,z,k]:=dp[i-1,j-1,z-1,k]+l;
    if dp[i,j,z,k]< dp[i-1,j-1,z,k-1]+l then
       dp[i,j,z,k]:=dp[i-1,j-1,z,k-1]+l;
    if dp[i,j,z,k]< dp[i-1,j-1,z-1,k-1]+l then
       dp[i,j,z,k]:=dp[i-1,j-1,z-1,k-1]+l;

    if dp[i,j,z,k]< dp[i-1,j,z-1,k]+l then
       dp[i,j,z,k]:=dp[i-1,j,z-1,k]+l;
    if dp[i,j,z,k]< dp[i-1,j,z,k-1]+l then
       dp[i,j,z,k]:=dp[i-1,j,z,k-1]+l;
    if dp[i,j,z,k]< dp[i-1,j,z-1,k-1]+l then
       dp[i,j,z,k]:=dp[i-1,j,z-1,k-1]+l;
    if dp[i,j,z,k]< dp[i-1,j,z,k]+l then
       dp[i,j,z,k]:=dp[i-1,j,z,k]+l;
     l:=dp[i,j,z,k];
    end;
  end;
  writeln(dp[n*2-1,n,n,n]);
end.
