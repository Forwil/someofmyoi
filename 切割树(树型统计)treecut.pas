program treecut;
const max=10001;
type link=^dfdf;
   dfdf=record
    id:longint;
    next:link;
    end;
var
    ln:array[0..max]of link;
     f:Array[0..max]of integer;
  pass:Array[0..max]of boolean;
   d,u:Array[0..max]of longint;
    i,j,k,n,m,x,y:longint;
    q:link;
procedure go(x:longint);
var q:link;
begin
pass[x]:=true;
q:=ln[x];
d[x]:=1;
while q<>nil do
 begin
 if pass[q^.id]=false then
   begin
   go(q^.id);
   d[x]:=d[x]+d[q^.id];
   end
   else f[x]:=q^.id;
 q:=q^.next;
 end;
end;
procedure doit(x:longint);
var q:link;
begin
pass[x]:=true;
q:=ln[x];
while q<>nil do
 begin
 if pass[q^.id]=false then
   begin
   u[q^.id]:=u[x]+d[x]-d[q^.id];
   doit(q^.id);
   end;
 q:=q^.next;
 end;
end;
begin
assign(input,'treecut.in');reset(input);
assign(output,'treecut.out');rewrite(output);
 readln(n);
 for i:=1 to n-1 do
  begin
  readln(x,y);
  new(q);
  q^.id:=x;q^.next:=ln[y];ln[y]:=q;
  new(q);
  q^.id:=y;q^.next:=ln[x];ln[x]:=q;
  end;
go(1);
fillchar(pass,sizeof(pass),false);
doit(1);

for i:=1 to n do
begin
m:=u[i];
q:=ln[i];
 while (q<>nil)and(m<=n div 2) do
  begin
  if (q^.id<>f[i])and(d[q^.id]>m) then m:=d[q^.id];
  q:=Q^.next;
  end;
if m<=n div 2 then writeln(i);
end;
close(output);
close(input);
end.