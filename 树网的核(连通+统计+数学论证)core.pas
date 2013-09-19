program core;
type link=^dff;
  dff=record
  id:longint;
  next:link;
  end;
var  tab:Array[0..310,0..313]of longint;
     ln:array[0..310]of link;
     b:array[0..310]of boolean;
     a:Array[0..301]of longint;
     j,z,o,s,i,k,n,m,x,y,r,min,t,w,mm,ans:longint;
     q:link;
     find:boolean;
function max(a,b:longint):longint;
begin if a>b then max:=a else max:=b;end;
procedure dfs(x,z:longint);
var q:link;
begin
q:=ln[x];
b[x]:=false;
if x=y then begin m:=z-1; find:=true; end;
if find then exit;
while q<>nil do
 begin
 if b[q^.id] then
   begin
   a[z]:=q^.id;
   dfs(q^.id,z+1);
   if find then exit;
   end;
 q:=q^.next;
 end;
end;
begin
assign(input,'core.in');reset(input);
assign(output,'core.out');rewrite(output);
readln(n,s);
fillchar(tab,sizeof(tab),$7f);
r:=tab[0,0];
for i:=1 to n-1 do
 begin
 readln(x,y,z);
 new(q);q^.id:=x;q^.next:=ln[y];ln[y]:=q;
 new(q);q^.id:=y;q^.next:=ln[x];ln[x]:=q;
 tab[x,y]:=z;
 tab[y,x]:=z;
 end;
for k:=1 to n do
for i:=1 to n do if (i<>k)and(tab[i,k]<>R) then
for j:=1 to n do if (k<>i)and(k<>j)and(tab[k,j]<>r) then
if tab[i,j]>tab[i,k]+tab[k,j] then
 begin
  tab[i,j]:=tab[i,k]+Tab[k,j];
  tab[j,i]:=tab[i,j];
 end;
 m:=0;
for i:=1 to n do
for j:=i+1 to n do
 if tab[i,j]>m then
 begin
 m:=tab[i,j];
 x:=i;
 y:=j;
 end;
 m:=0;
 a[1]:=x;
 fillchar(b,sizeof(b),true);
 dfs(x,2);
 min:=maxlongint;
 w:=1;
 t:=1;
 fillchar(b,sizeof(b),false);
 b[a[1]]:=true;
 ans:=maxlongint;
 for i:=2 to m do
  begin
  t:=t+1;
  o:=o+tab[a[i],a[i-1]];
  b[a[t]]:=true;
  while o>s do
    begin
    o:=o-tab[a[w],a[w+1]];
    b[a[w]]:=false;
    w:=w+1;
    end;
    mm:=0;
  for j:=1 to n do
  if b[j]=false then
   begin
   min:=maxlongint;
   for z:=w to t do
   if tab[a[z],j]<min then min:=tab[a[z],j];
   if min>mm then mm:=min;
   end;
  if mm<ans then ans:=mm;
  end;
 writeln(ans);
 close(output);
end.