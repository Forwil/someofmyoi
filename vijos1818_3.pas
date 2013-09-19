program vijos1818_3;
var ind:Array[0..100000]of longint;
     id:array[0..100000]of longint;
      b:array[0..100000]of boolean;
     x,y,i,j,k,n,m,price:longint;
procedure sort(i,j:longint);
var x,y,z:longint;
begin
x:=i;
y:=j;
z:=ind[(x+y)shr 1];
repeat
while z>ind[y] do dec(y);
while z<ind[x] do inc(x);
if x<=y then
 begin
  ind[0]:=ind[x];
  ind[x]:=ind[y];
  ind[y]:=ind[0];
  id[0]:=id[x];
  id[x]:=id[y];
  id[y]:=id[0];
  inc(x);dec(y);
 end;
until x>y;
if x<j then sort(x,j);
if i<y then sort(i,y);
end;
begin
assign(input,'buc.in');reset(input);
readln(price);
n:=0;
readln(x,y);
while x<>0  do
 begin
  if x=1 then
      begin
      n:=n+1;
      ind[n]:=y;
      id[n]:=n;
      b[n]:=true;
      end;
  if x=2 then
   begin
   writeln('Mei you. Zhe ge ke yi you. Zhe ge zhen mei you!');
   b[y]:=false;
   end;
  if x=3 then
     begin
     sort(1,n);
     if (ind[y]>price) then
     writeln('Dui bu qi,Mei you.')
     else
     if (ind[y]<=price)and(b[id[y]]) then
     begin
     writeln('You. ',ind[y],' Yuan.');
     b[id[y]]:=false;
     end
     else
     if b[id[y]] then
      writeln('Mei you. Zhe ge ke yi you. Zhe ge zhen mei you!');
     end;

   read(x);
   if x<>0 then readln(y);
 end;
end.
