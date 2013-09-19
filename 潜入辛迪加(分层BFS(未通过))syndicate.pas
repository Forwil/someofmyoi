program syndicate;
const ax:Array[1..4]of -1..1=(1,0,0,-1);
      ay:array[1..4]of -1..1=(0,1,-1,0);
var b:array[0..60,0..60]of boolean;
    z:array[0..1000,0..2]of integer;
    t,w,i,j,k,n,m,x,y:longint;
begin
assign(input,'syndicate.in');
reset(input);
assign(output,'syndicate.out');
rewrite(output);
readln(n,m);
fillchar(b,sizeof(b),true);
for i:=1 to n do
for j:=1 to n do
 begin
 read(x);
 if (x=-1)or(x>m) then b[i,j]:=false;
 if x=-2 then
  begin
  b[i-1,j]:=false;
  b[i+1,j]:=false;
  b[i,j+1]:=false;
  b[i,j-1]:=false;
  end;
 if j=n then readln;
 end;

for i:=0 to n+1 do
 begin
 b[0,i]:=false;
 b[i,0]:=false;
 b[n+1,0]:=false;
 b[0,n+1]:=false;
 end;
t:=0;
w:=1;
z[1,1]:=1;
z[1,2]:=1;
z[1,0]:=0;
repeat
t:=t+1;
 for i:=1 to 4 do
  begin
  x:=z[t,1]+ax[i];
  y:=z[t,2]+ay[i];
  if b[x,y] then
   begin
   b[x,y]:=false;
   w:=w+1;
   z[w,0]:=z[t,0]+1;
   z[w,1]:=x;z[w,2]:=y;
   if (x=n)and(y=n) then
     begin
     writeln(z[w,0]);
     close(output);
     halt;
     end;
   end;
  end;
until t>=w;
writeln(z[w shr 1,0]*2);
close(output);
end.