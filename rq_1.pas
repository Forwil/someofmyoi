program rq_1;
var tab:array[0..161,0..161,1..2]of longint;
  i,j,k,n,m,r,z,y,x,m1,m2:longint;
function max(a,b:longint):longint;
begin if a>b then max:=a else max:=b;end;
begin
assign(input,'a.in');reset(input);
readln(n,m);
for i:=1 to n do
for j:=1 to n do
 begin
 tab[i,j,1]:=100000000;
 tab[i,j,2]:=100000000;
 end;
r:=100000000;
for i:=1 to m do
 begin
 readln(x,y,z);
 tab[x,y,1]:=z;
 tab[y,x,1]:=z;
 end;


for k:=1 to n do
for i:=1 to n do if (i<>k)and(tab[i,k,1]<>r) then
for j:=1 to n do if (j<>i)and(j<>k)and(tab[k,j,1]<>r) then
begin
m1:=tab[i,k,1]+Tab[k,j,1];
m2:=tab[i,k,1]+tab[k,j,2];
x :=tab[i,k,2]+tab[k,j,1];

if x<m1 then
 begin
 m2:=m1;
 m1:=x;
 end
else
if x<m2 then m2:=x;

if m1<tab[i,j,1] then
 begin
 tab[i,j,2]:=tab[i,j,1];
 tab[i,j,1]:=m1;
 end
else
if m1<Tab[i,j,2] then
tab[i,j,2]:=m1;

if m2<Tab[i,j,2] then
 tab[i,j,2]:=m2;
end;

readln(m);
for i:=1 to m do
begin
readln(x,y);
if tab[x,y,2]=r then
writeln('Fei Xiang can''t find the second shortest way!')
else writeln(tab[x,y,2]);
end;
end.
