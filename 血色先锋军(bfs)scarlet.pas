program scarlet;
const ax:Array[1..4]of integer=(1,0,-1,0);
      ay:Array[1..4]of integer=(0,1,0,-1);
var z:array[0..250001,1..2]of integer;
    b:array[0..501,0..501]of boolean;
    tab:array[0..501,0..501]of integer;
    ind:Array[0..250001,1..2]of integer;
   t,w,i,j,k,n,m,x,y,l:longint;
begin
assign(input,'scarlet.in');reset(input);
assign(output,'scarlet.out');rewrite(output);
readln(n,m,l,k);
for i:=1 to n do
for j:=1 to m do
 b[i,j]:=true;
for i:=1 to l do
 begin
 readln(x,y);
 if (x>=1)and(x<=n)and(y>=1)and(y<=m)then
  begin
  inc(w);
  z[w,1]:=x;
  z[w,2]:=y;
  b[x,y]:=false;
  end;
 end;
for i:=1 to k do
 readln(ind[i,1],ind[i,2]);
t:=0;
repeat
 t:=t+1;
  for i:=1 to 4 do
   begin
   x:=z[t,1]+ax[i];
   y:=z[t,2]+ay[i];
   if b[x,y] then
     begin
     w:=w+1;
     z[w,1]:=x;
     z[w,2]:=y;
     b[x,y]:=false;
     tab[x,y]:=tab[z[t,1],z[t,2]]+1;
     end;
   end;
until t>=w;
for i:=1 to k do
writeln(tab[ind[i,1],ind[i,2]]);
close(output);
end.

