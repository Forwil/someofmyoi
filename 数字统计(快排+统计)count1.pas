program count;
var ind:array[0..200001]of longint;
  i,j,k,n,m,t:longint;
procedure sort(i,j:longint);
var x,y,z:longint;
begin
x:=i;y:=j;z:=ind[(x+y)shr 1];
repeat
while z<ind[y]do dec(y);
while z>ind[x]do inc(x);
if x<=y then
 begin
 ind[0]:=ind[x];
 ind[x]:=ind[y];
 ind[y]:=ind[0];
 inc(x);dec(y);
 end;
until x>y;
if i<y then sort(i,y);
if x<j then sort(x,j);
end;
begin
assign(input,'count.in');reset(input);
assign(output,'count.out');rewrite(output);
readln(n);
for i:=1 to n do
 readln(ind[i]);
sort(1,n);
t:=1;
for i:=2 to n do
 if ind[i]<>ind[i-1]then
     begin
     writeln(ind[i-1],' ',t);
     t:=1;
     end
   else t:=t+1;
writeln(ind[n],' ',t);
close(output);
end.