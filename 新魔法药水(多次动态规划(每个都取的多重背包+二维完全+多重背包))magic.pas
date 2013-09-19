program magic;
type link=^df;
  df=record
  p:Array[0..60]of integer;
  next:link;
  end;
var dp:Array[0..61,0..31]of longint;
    ln:Array[0..61]of link;
    sj:Array[0..61]of longint;
    z:array[0..1,0..31]of longint;
    bag:array[0..1001,0..31]of longint;
    l,zz,ii,jj,x,i,j,k,n,m,v,r:longint;
    q:link;
begin
assign(input,'magic.in');reset(input);
assign(output,'magic.out');rewrite(output);
readln(n,m,v,k);
for i:=1 to n do
 begin
 readln(dp[i,0],sj[i]);
 for j:=1 to k do dp[i,j]:=dp[i,0];
 end;

for i:=1 to m do
 begin
 read(x);
 new(q);
 read(q^.p[0]);
 for j:=1 to q^.p[0] do
  read(q^.p[j]);
 q^.next:=ln[x];
 ln[x]:=q;
 end;

for i:=1 to k do
for j:=1 to n do
 begin
 q:=ln[j];
 while q<>nil do
  begin
  fillchar(z,sizeof(z),63);
  r:=z[0,0];
  z[0,0]:=0;
  for ii:=1 to q^.p[0] do
  begin
  fillchar(z[ii and 1],sizeof(z[ii and 1]),63);
  for jj:=i-1 downto 0 do
  if z[1-ii and 1,jj]<>r then
  for zz:=0 to i-jj-1 do
  if z[ii and 1,zz+jj]>dp[q^.p[ii],zz]+z[1-ii and 1,jj]then
    z[ii and 1,zz+jj]:=dp[q^.p[ii],zz]+z[1-ii and 1,jj];
  end;

  for jj:=0 to i do
  if dp[j,jj+1]>z[q^.p[0] and 1,jj] then
   dp[j,jj+1]:=z[q^.p[0] and 1,jj];
  q:=q^.next;
  end;
 end;

for i:=1 to n do
for ii:=0 to v do
for jj:=0 to k do
for x:=0 to k-jj do
if ii+dp[i,x]<=v then
if bag[ii+dp[i,x],jj+x]<bag[ii,jj]+sj[i]-dp[i,x]then
  bag[ii+dp[i,x],jj+x]:=bag[ii,jj]+sj[i]-dp[i,x];
writeln(bag[v,k]);
close(output);
end.
