program msyrup;
type link=^de;
  de=record
  l,r:longint;
  next:link;
  end;
var ln:array[0..1000]of link;
    cost:array[0..1000]of longint;
    dp:array[0..1000,0..1]of longint;
    b:array[0..1000]of boolean;
    x,y,i,j,k,n,m,z:longint;
    P:link;
procedure go(x:longint);
var j:longint;
     q,p:link;
begin
dp[x,0]:=cOst[x];
q:=ln[x];
b[x]:=false;
dp[x,1]:=1;
while q<>nil do
 begin
 if b[q^.l] then go(q^.l);
 if b[q^.r] then go(q^.r);
  if dp[q^.l,0]+dp[q^.r,0]<dp[x,0] then
   begin
   dp[x,0]:=dp[q^.l,0]+dp[q^.r,0];
   dp[x,1]:=dp[q^.l,1]*dp[q^.r,1];
   end
  else
  if dp[q^.l,0]+dp[q^.r,0]=dp[x,0] then
   dp[x,1]:=dp[x,1]+dp[q^.l,1]*dp[q^.r,1];
  q:=q^.next;
 end;
end;
begin
assign(input,'msyrup.in');
reset(input);
assign(output,'msyrup.out');rewrite(output);
readln(n);
for i:=0 to n-1 do
 read(cost[i]);
 while not(eof) do
  begin
  readln(x,y,z);
  new(P);
  P^.l:=x;
  P^.r:=y;
  P^.next:=ln[z];
  ln[z]:=P;
  end;
fillchar(b,sizeof(b),true);
go(0);
writeln(dp[0,0],' ',dp[0,1]);
close(output);
end.
