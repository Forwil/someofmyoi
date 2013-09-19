program n1180;
type link=^fsd;
  fsd=record
  id:longint;
  nexT:link;
  end;
var dp:array[0..301,0..301]of longint;
    ind:array[0..301]of longint;
    p:array[0..301]of longint;
    ln:array[0..301]of link;
    i,j,k,n,m,x:longint;
    q:link;
procedure go(x:longint);
var q:link;
 i,j:longint;
begin
q:=ln[x];
 p[x]:=1;
 dp[x,1]:=ind[x];
while q<>nil do
 begin
  go(q^.id);
   for i:=p[x] downto 1 do
   for j:=p[q^.id] downto 1 do
    if i+j<=m then
     if dp[x,i+j]<dp[x,i]+dp[q^.id,j] then
        dp[x,i+j]:=dp[x,i]+dp[q^.id,j];
  if p[x]+p[q^.id]>m then
    p[x]:=m
   else
    p[x]:=p[x]+p[q^.id];
  q:=q^.next;
 end;
end;
begin
readln(n,m);
m:=m+1;
for i:=1 to n do
 begin
 readln(x,ind[i]);
 new(q);
 q^.id:=i;
 q^.next:=ln[x];
 ln[x]:=q;
 inc(p[x]);
 end;
go(0);
writeln(dp[0,m]);
end.