program inform;
type link=^df;
 df=record
 id,vi:longint;
 next:link;
 end;
var dp:Array[0..101,0..101]of longint;
    l,r,lv,rv:array[0..101]of longint;
    ln:Array[0..101]of link;
  pass:array[0..101]of boolean;
  i,j,k,n,m,p,x,y,z:longint;
  q:link;

procedure build(x:integer);
var q:link;
begin
pass[x]:=true;
q:=ln[x];
while q<>nil do
 begin
 if not pass[q^.id] then
   begin
   if l[x]=0 then
    begin
    l[x]:=q^.id;
    lv[x]:=q^.vi;
    end
   else
    begin
    r[x]:=q^.id;
    rv[x]:=q^.vi;
    end;
   build(q^.id);
   end;
 q:=q^.next;
 end;
end;

procedure go(x:integer);
var q:link;
   i,j:integer;
begin
if l[x]<>0 then
  begin
  go(l[x]);
  for i:=1 to m do
  dp[x,i]:=dp[l[x],i-1]+lv[x];
  end;
if r[x]<>0 then
  begin
  go(r[x]);
  for i:=m downto 1 do
  for j:=0 to i-1 do
  if dp[x,i]<dp[r[x],i-j-1]+rv[x]+dp[x,j] then
    dp[x,i]:=dp[r[x],i-j-1]+rv[x]+dp[x,j];
  end;
end;
begin
assign(input,'inform.in');reset(input);
assign(output,'inform.out');rewrite(output);
readln(n,m,p);
for i:=1 to n-1 do
begin
readln(x,y,z);
new(q);
q^.id:=y;q^.vi:=z;q^.next:=ln[x];ln[x]:=q;
new(q);
q^.id:=x;q^.vi:=z;q^.next:=ln[y];ln[y]:=q;
end;
build(1);
go(1);
if dp[1,m]>=p then
 writeln('TRUE')
else
 writeln('FALSE');
 writeln(dp[1,m]-p);
close(output);
end.
