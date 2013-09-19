program mmatrix;
const ax:array[1..4]of -1..1=(1,0,-1,0);
      ay:array[1..4]of -1..1=(0,1,0,-1);
var b:array[0..51,0..51]of boolean;
   p:array[0..51,1..2]of longint;
    k1,k2,i,j,k,m,n,ans,tot,m2:longint;
function max(a,b:longint):longint;
begin if a>b then max:=a else max:=b;end;
procedure go(x,y,z,v:longint);
var xx,yy,i,j:longint;
begin
j:=0;
if (z=n*m)and(v<ans) then ans:=v;
if v>=ans then exit;
if(b[x+1,y])and(b[x-1,y])and not(b[x,y-1])and not(b[x,y+1])then
  exit;
if not(b[x+1,y])and not(b[x-1,y])and (b[x,y-1])and (b[x,y+1])then
  exit;
if z<n*m then
for i:=1 to 4 do
 begin
  xx:=x+ax[i];
  yy:=y+ay[i];
  if b[xx,yy] then
    begin
    b[xx,yy]:=false;
   if z+1>(n*m)div 2 then
     j:=k1*abs(xx-p[(z+1)mod m2,1])+k2*abs(yy-p[(z+1)mod m2,2])
   else
     begin
      j:=-1;
      p[(z+1)mod m2,1]:=xx;
      p[(z+1)mod m2,2]:=yy;
     end;
   if j>v then
    go(xx,yy,z+1,j)
   else go(xx,yy,z+1,v);
    b[xx,yy]:=true;
    end;
 end;
end;
begin
assign(input,'mmatrix.in');reset(input);
assign(output,'mmatrix.out');rewrite(output);
readln(n,m,k1,k2);
for i:=1 to n do
for j:=1 to m do
b[i,j]:=true;
m2:=n*m shr 1;
b[1,1]:=false;
p[1 mod m2,1]:=1;
p[1 mod m2,2]:=1;
ans:=maxlongint;
go(1,1,1,0);
writeln(ans);
close(output);
end.
