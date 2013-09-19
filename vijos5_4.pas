program vijos4_4;
type link=^fsdf;
  fsdf=record
  id:integer;
  nexT:link;
  end;
var tab:array[0..1001,0..1001]of boolean;
    p:array[0..1001]of integer;
    ln:array[0..1001]of link;
    out:array[0..1001]of integer;
    l:array[0..1001]of longint;
    count:array[0..1001]of integer;
    b:array[0..1001]of boolean;
  ans1,ans2,bb,z,i,t,j,k,n,m,x,y:longint;
  q:link;
procedure dfs(x,y:longint);
var i,q:link;
begin
tab[x,y]:=true;
q:=ln[y];
b[y]:=false;
while q<>nil do
 begin
 if (tab[x,q^.id]=false)
 and(q^.id<>x)and(b[q^.id]) then
   begin
   dfs(x,q^.id);
   end;
   q:=q^.next;
 end;
end;
begin
assign(input,'love.in');reset(input);
assign(output,'love.out');rewrite(output);
readln(n,m);
for i:=1 to m do
 begin
 readln(x,y);
 tab[x,y]:=true;
 new(q);
 q^.id:=y;
 q^.next:=ln[x];
 ln[x]:=q;
 end;
for i:=1 to n do
begin
p[i]:=i;
q:=ln[i];
while q<>nil do
 begin
 fillchar(b,sizeof(b),true);
 dfs(i,q^.id);
 q:=q^.next;
 end;
end;
for i:=1 to n do
for j:=i+1 to n do
 begin
 if (tab[i,j])and(tab[j,i]) then
  begin
  x:=p[i];
   for z:=1 to n do
     if p[z]=x then p[z]:=p[j];
  end;
 end;
for i:=1 to n do
 inc(count[p[i]]);
for i:=1 to n do
if count[i]>=2 then inc(ans1);

for i:=1 to n do
for j:=1 to n do
 if tab[i,j] then
 inc(l[p[j]]);
bb:=-1;
 for i:=1 to n do
  begin
  if count[i]>=2 then
   if (n-count[i])*count[i]+(count[i]*(count[i]-1))=l[i] then
    bb:=i;
  end;
if bb<>-1 then
  begin
  for i:=1 to n do
  if bb=p[i] then
   begin
   inc(t);
   out[t]:=i;
   end;
  end;
writeln(ans1);
if bb=-1 then writeln(bb)
else
for i:=1 to  t do
if i<t then write(out[i],' ')
else writeln(out[t],' ');
close(output);
end.
