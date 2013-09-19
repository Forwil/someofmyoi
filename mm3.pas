program mm3;
var tab:array[0..181,0..181]of longint;
    ind:array[0..181]of longint;
    name:array[0..181]of string;
    down:array[0..181,0..181]of longint;
    b:array[0..181]of boolean;
    a,out:array[0..181]of integer;
    x,i,j,k,n,m,max,mmm:longint;
function maxf(a,b:longint):longint;
begin if a>b then exit(a) else exit(b);end;
procedure dfs(x,z,mm:longint);
var i,j:longint;
begin

if x<=n then
begin
for i:=1 to n do
if (b[i])and(tab[x,i]>0) then
begin
b[i]:=false;
a[x]:=i;
dfs(x+1,z+tab[x,i],maxf(mm,tab[x,i]));
b[i]:=true;
end;
end
else
if z>max then
begin
 out:=a;
 max:=z;
 mmm:=mm;
end
else
 if (z=max)and(mm<mmm)then
  begin
  out:=a;
  mmm:=mm;
  end;
end;
begin
assign(input,'mm3.in');reset(input);
readln(n);
for i:=1 to n do
read(ind[i]);
for i:=1 to n do
 begin
 read(x);
 tab[i,x]:=ind[i];
 end;
 readln;
for i:=1 to n do
 readln(name[i]);
for i:=1 to n do
for j:=1 to n do
 read(down[i,j]);
for k:=1 to n do
for i:=1 to n do
for j:=1 to n do
 if tab[k,i]-down[i,j]>tab[k,j] then
    tab[k,j]:=tab[k,i]-down[i,j];
fillchar(b,sizeof(b),true);
dfs(1,0,0);
writeln(mmm);
for i:=1 to n do
writeln(name[out[i]]);
end.
