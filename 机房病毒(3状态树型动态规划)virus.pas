program virus;
type link=^dfdf;
dfdf=record
   id:longint;
   nexT:link;
    end;
var dp:Array[0..1501,0..2]of longint;
    pass:array[0..1501]of boolean;
    ln:array[0..1501]of link;
    x,i,j,k,n,m,y:longint;
    q:link;
function min(a,b:longint):longint;
begin if a>b then min:=b else min:=a;end;
procedure go(x:longint);
var Q:link;
minn,z:longint;
begin
q:=ln[x];
pass[x]:=true;
minn:=1000000;
z:=0;
while q<>nil do
 begin
 if pass[q^.id]=false then
    begin
    go(q^.id);
    dp[x,0]:=dp[x,0]+min(dp[q^.id,2],min(dp[q^.id,0],dp[q^.id,1]));
    dp[x,2]:=dp[x,2]+dp[q^.id,1];
    if dp[q^.id,0]-min(dp[q^.id,0],dp[q^.id,1])<minn then
     minn:=dp[q^.id,0]-min(dp[q^.id,0],dp[q^.id,1]);
    z:=z+min(dp[q^.id,1],dp[q^.id,0]);
    end;
 q:=q^.next;
 end;
dp[x,1]:=z+minn;
dp[x,0]:=dp[x,0]+1;
if minn=1000000 then
 begin
 dp[x,0]:=1;
 dp[x,1]:=1000000;
 dp[x,2]:=0;
 exit;
 end;
end;
begin
assign(input,'virus.in');reset(input);
assign(output,'virus.out');rewrite(output);
readln(n);
for i:=1 to n do
 begin
  read(x,k);
   for j:=1 to k do
    begin
    read(y);
    new(q);
    q^.id:=y;
    q^.next:=ln[x];
    ln[x]:=q;
    new(q);
    q^.id:=x;
    q^.next:=ln[y];
    ln[y]:=q;
    end;
    readln;
 end;
go(0);
writeln(min(dp[0,0],dp[0,1]));
close(output);
end.
