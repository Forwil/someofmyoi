program d9_18;
const maxn=3000;
type link=^cxcv;
  cxcv=record
  id,vi:longint;
  next:link;
  end;
type arr=^ar;
ar=array[0..3000]of longint;
var dp:Array[0..maxn]of arr;
    ln:array[0..maxn]of link;
    ind:array[0..3000]of longint;
   p:array[0..maxn]of longint;
  ans,y,x,i,j,k,n,m:longint;
   q:link;
   z:array[0..maxn]of longint;
procedure go(x:longint);
var q:link;
   i,j:longint;
begin
q:=ln[x];
new(dp[x]);
for i:=1 to m do
 dp[x]^[i]:=-123135421;
dp[x]^[0]:=0;
if q=nil then
 begin
 p[x]:=1;
 dp[x]^[1]:=ind[x];
 end;
while q<>nil do
 begin
 go(q^.id);
  for i:=p[x] downto 0 do
   for j:=p[q^.id] downto 1 do
    if i+j<=m then
    if dp[x]^[i+j]<dp[x]^[i]+dp[q^.id]^[j]-q^.vi then
    dp[x]^[i+j]:=dp[x]^[i]+dp[q^.id]^[j]-q^.vi;

 if p[x]+p[q^.id]>m then
  p[x]:=m
 else
 p[x]:=p[x]+p[q^.id];
 dispose(dp[q^.id]);
 q:=q^.next;
 end;
end;
begin
assign(input,'tele.in');reset(input);
assign(output,'tele.out');rewrite(output);
readln(n,m);
for i:=1 to n-m do
 begin
 read(k);
  for j:=1 to k do
    begin
    read(x,y);
    new(q);
    q^.id:=x;
    q^.vi:=y;
    q^.next:=ln[i];
    ln[i]:=q;
    end;
 end;
for i:=n-m+1 to n do
read(ind[i]);
go(1);
for i:=p[1] downto 1 do
  if dp[1]^[i]>=0 then
  begin
  writeln(i);
  break;
  end;
  close(output);
end.
