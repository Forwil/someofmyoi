program vijos4_3;
type clsd=set of 0..120;
var tab:array[0..1000,0..1000]of byte;
    co:array[0..100]of clsd;
    b:array[0..100]of boolean;
   x1,y1,x2,y2,z,x,y,l,c,i,j,k,n,m,t,s:longint;
    date,kk:clsd;
    can:boolean;
function try(x:longint;var he:clsd):boolean;
var i,j:longint;
 can:boolean;
begin
if co[x]<>[] then
for i:=1 to 100 do
  if (i in he) then
  if (i in co[x]) then
   he:=he-[i]
  else
   begin
   can:=false;
   for j:=1 to 100 do
   if (j in co[x])and(i in co[j])and(x<>j) then
        begin
        can:=try(j,he);
        if can then break;
        end;
   if can=false then exit(false);
   end;
   he:=he+[x];
   exit(true);
end;
begin
 readln(n,m,t);
 b[1]:=true;
 for i:=1 to t do
  begin
  readln(x1,y1,x2,y2,c);
  for x:=x1 to x2 do
  for y:=y1 to y2 do
   tab[x,y]:=c;
   b[c]:=true;
  end;
 while not(eof) do
  begin
  read(x,y);
  for i:=1 to y do
   begin
   read(l);
   co[x]:=co[x]+[l];
   end;
   readln;
  end;
 for i:=1 to n do
 for j:=1 to n do
  date:=date+[tab[i,j]];
 for i:=1 to 100 do
 if (co[i]<>[])and(b[i])  then
 begin
   kk:=date;
  if try(i,kk) then
  begin
  writeln(i);
  halt;
  end;
 end;
 writeln('Escape');
end.
