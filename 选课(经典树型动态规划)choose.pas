program choose;
type link=^dfd;
dfd=record
id:longint;
nexT:link;
end;
var
  ln:array[0..1001]of link;
  vi:Array[0..1001]of longint;
  dp:array[0..1001,0..1001]of longint;
  out:array[0..100,0..100]of set of byte;
  i,j,k,n,m,x:longint;
  q:link;
procedure go(x:longint);
var q:link;
  i,j,y:longint;
begin
 q:=ln[x];
 dp[x,1]:=vi[x];
if n<=90 then  out[x,1]:=[x];
while q<>nil do
 begin
  go(q^.id);
  y:=q^.id;
  for i:=m downto 1-ord(x=0) do
  if (dp[x,i]<>0)or(i=0) then
  for j:=1 to m-i do
  if dp[x,i+j]<dp[x,i]+dp[y,j] then
   begin
    dp[x,i+j]:=dp[x,i]+dp[y,j];
   if n<=90 then  out[x,i+j]:=out[x,i]+out[y,j];
   end;
  q:=q^.next;
 end;
end;
begin
assign(input,'choose.in');reset(input);
assign(output,'choose.out');rewrite(output);
readln(n,m);
for i:=1 to n do
 begin
 readln(x,vi[i]);
 new(q);
 q^.id:=i;q^.next:=ln[x];ln[x]:=q;
 end;

go(0);
writeln(dp[0,m]);
if n<=90 then
 for i:=1 to n do
 if i in out[0,m] then writeln(i);
close(output);
end.
