program tree;
var sum:array[0..50001,1..2]of longint;
   t,z,x,y,i,j,k,n,m:longint;
function lowbit(x:longint):longint;
begin
lowbit:=x and (x xor (x-1));
end;
procedure change(x,z:longint);
begin
repeat
inc(sum[x,z]);
inc(x,lowbit(x));
until x>n;
end;
function summ(x,z:longint):longint;
var s:longint;
begin
s:=0;
repeat
s:=s+sum[x,z];
x:=x-lowbit(x);
until x=0;
summ:=s;
end;
begin
assign(input,'tree.in');
reset(input);
assign(output,'tree.out');rewrite(output);
readln(n,m);
for i:=1 to m  do
 begin
  read(z,x,y);
  if z=1 then
     begin
     change(x,1);
     change(y,2);
     end;
  if z=2 then
     begin
     writeln(summ(y,1)-summ(x-1,2));
     end;
 end;
 close(output);
end.
