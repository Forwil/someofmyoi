program vijos7_1;
type link=^sff;
sff=record
id:longint;
next:link;
end;
var ln:array[0..100000]of link;
    dp:Array[0..100000]of longint;
    mm,x,y,i,j,k,n,m,ans:longint;
    q:link;
begin
readln(n,m);
for i:=1 to m do
 begin
  readln(x,y);
  new(q);
  q^.id:=x+y;
  q^.next:=ln[x];
  if q^.id>mm then mm:=q^.id;
  ln[x]:=q;
 end;
for i:=mm downto 0 do
 begin
 dp[i]:=dp[i+1];
 q:=ln[i];
  while q<>nil do
    begin
    if (q^.id-i)+dp[q^.id]>dp[i] then
     dp[i]:=(q^.id-i)+dp[q^.id];
     q:=q^.next;
    end;
 if dp[i]>ans then ans:=dp[i];
 if dp[i]>=n then break;
 end;
if ans>=n then writeln(n)
else writeln(n-ans);
end.