program maze;
const p=30000;
var pass,mm:array[0..1402,0..1402]of longint;
    tab:Array[0..1402,0..1402]of char;
    z:array[0..p,1..2]of integer;
x,y,i,j,k,n,m,t,w,r,ans:longint;
procedure init(x,y,k,l:longint);
begin
if (x>n)or(x<1)or(y>n)or(y<1) then exit;
if tab[x,y]='*' then exit;
if mm[x,y]<l then exit;
if (mm[x,y]=l)and(pass[x,y]<=k) then exit;
w:=w+1;
if w>p then w:=1;
z[w,1]:=x;z[w,2]:=y;
pass[x,y]:=k;
mm[x,y]:=l;
end;
begin
assign(input,'maze.in');reset(input);
assign(output,'maze.out');rewrite(output);
readln(n);
for i:=1 to n do
for j:=1 to n do
 begin
 read(tab[i,j]);
 if j=n then readln;
 if tab[i,j]<>'*' then
 begin
 pass[i,j]:=maxlongint shr 1;
 mm[i,j]:=maxlongint shr 1;
 end;
 end;
if tab[1,1]<>'*' then init(1,1,1,1);
if tab[1,n]<>'*' then init(1,n,1,1);
if tab[n,1]<>'*' then init(n,1,1,1);
T:=0;
repeat
t:=t+1;
if t>p then t:=1;
x:=z[t,1];y:=z[t,2];
if tab[x,y]='A' then
 begin
 init(x+1,y,pass[x,y]+1,mm[x,y]+1);
 init(x-1,y,pass[x,y]+1,mm[x,y]+1);
 init(x,y+1,pass[x,y]+1,mm[x,y]+1);
 init(x,y-1,pass[x,y]+1,mm[x,y]+1);
 end
else
if tab[x,y]='B' then
 begin
 init(x+2,y,pass[x,y]+1,mm[x,y]+1);
 init(x-2,y,pass[x,y]+1,mm[x,y]+1);
 init(x,y+2,pass[x,y]+1,mm[x,y]+1);
 init(x,y-2,pass[x,y]+1,mm[x,y]+1);
 end
else
if tab[x,y]='C' then
 begin
 init(x+1,y+1,pass[x,y]+2,mm[x,y]+1);
 init(x-1,y+1,pass[x,y]+2,mm[x,y]+1);
 init(x+1,y-1,pass[x,y]+2,mm[x,y]+1);
 init(x-1,y-1,pass[x,y]+2,mm[x,y]+1);
 end;
 if (pass[n,n]<>maxlongint shr 1) then break;
until t=w;
if (pass[n,n]<>maxlongint shr 1)and(pass[n,n]<>0) then
writeln(pass[n,n])
else writeln('No answer');
close(output);
end.
