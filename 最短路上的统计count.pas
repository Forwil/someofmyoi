program count;
var tab:array[0..101,0..101]of integer;
    ans:array[0..101,0..101]of integer;
    r,x,y,p,i,j,k,n,m:longint;
begin
assign(input,'count.in');reset(input);
assign(output,'count.out');rewrite(output);
readln(n,m);
fillchar(tab,sizeof(tab),$7f);
r:=tab[0,0];
for i:=1 to m do
 begin
 readln(x,y);
 tab[x,y]:=1;
 tab[y,x]:=1;
 end;
for k:=1 to n do
for i:=1 to n do
for j:=1 to n do
 if (i<>j)and(i<>k)and(j<>k) then
 if tab[i,k]+tab[k,j]<tab[i,j] then
  begin
  tab[i,j]:=tab[i,k]+tab[k,j];
  tab[j,i]:=tab[i,j];
  end;
for i:=1 to n do
for j:=i+1 to n do
for k:=1 to n do
if (i<>j)and(i<>k)and(k<>j) then
if tab[i,k]+tab[k,j]=tab[i,j] then
 begin
 inc(ans[i,j]);
 inc(ans[j,i]);
 end;
readln(p);
for i:=1 to p do
begin
readln(x,y);
if tab[x,y]<>r then
writeln(ans[x,y]+2)
else
writeln(0);
end;
close(output);
end.
