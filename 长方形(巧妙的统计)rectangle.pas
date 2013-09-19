program rectangle;
var dt:Array[0..1001]of qword;
    tab:Array[0..1001,0..1001]of char;
    u,r:array[0..1001]of longint;
    i,j,k,n,m,now:longint;
  ans:qword;
function find(x,y:longint):qword;
var i:longint;k:qword;
begin
find:=0;
if tab[x,y]='*' then exit;
if u[y-1]<=u[y] then
 begin dt[y]:=dt[y-1]+u[y];exit;end;
k:=u[y];
for i:=1 to r[y] do
 begin
 find:=find+k;
 if u[y-i]<k then
  begin
  dt[y]:=dt[y-i]+find;
  exit;
  end;
 end;
dt[y]:=find;
end;
begin
assign(input,'rectangle.in');reset(input);
assign(output,'rectangle.out');rewrite(output);
readln(n,m);
 for i:=1 to n do
 for j:=1 to m do
  begin
   read(tab[i,j]);
   if j=m then readln;
  end;

for i:=1 to n do
 for j:=1 to m do
 begin
 dt[j]:=0;
 if tab[i,j]='.' then
  begin
  r[j]:=r[j-1]+1;
  u[j]:=u[j]+1;
  end
 else
 begin
 r[j]:=0;
 u[j]:=0;
 end;

 find(i,j);
 ans:=ans+dt[j];
 end;
writeln(ans);
close(output);
end.
