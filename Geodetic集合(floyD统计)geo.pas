program geo;
var ln:array[0..100,0..100]of longint;
     p:array[0..100,0..100]of set of byte;
   i,j,k,n,m,x,y,t:longint;
begin
assign(input,'geo.in');reset(input);
assign(output,'geo.out');rewrite(output);
readln(n,m);
for i:=1 to m do
 begin
 readln(x,y);
 ln[x,y]:=1;
 p[x,y]:=[x]+[y];
 ln[y,x]:=1;
 p[y,x]:=[x]+[y];
 end;
for k:=1 to n do
for i:=1 to n do if (i<>k)and(ln[i,k]<>0) then
for j:=1 to n do if (j<>i)and(j<>k)and(ln[k,j]<>0) then
if (ln[i,j]=0)or(ln[i,j]>ln[i,k]+ln[k,j]) then
 ln[i,j]:=ln[i,k]+ln[k,j];

for i:=1 to n do
for j:=1 to n do if i<>j then
for k:=1 to n do if (k<>i)and(k<>J)then
if ln[i,j]=ln[i,k]+ln[k,j]then
 p[i,j]:=p[i,j]+[i]+[k]+[j];

readln(k);
for i:=1 to k do
 begin
 readln(x,y);
 t:=0;
 for j:=1 to n do
 if j in p[x,y] then inc(t);

 for j:=1 to n do
 if j in p[x,y] then
  begin
  t:=t-1;
  if t<>0 then write(j,' ')
  else writeln(j);
  end;
 end;
 close(output);
end.