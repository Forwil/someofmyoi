program robot4;
var ind:array[0..50000,0..4]of longint;
    i,j,k,n,m,max:longint;  ca:boolean;
procedure sort(i,j:longint);
var x,y,z:longint;
begin
x:=i;
y:=j;
z:=ind[(i+j)shr 1,0];
repeat
while z>ind[y,0] do deC(y);
while z<ind[x,0] do inc(x);
if x<=y then
 begin
 ind[0]:=ind[x];
 ind[x]:=ind[y];
 ind[y]:=ind[0];
 inc(x);dec(y);
 end;
until x>y;
if x<j then sort(x,j);
if i<y then sort(i,y);
end;
begin
assign(input,'robot4.in');
reset(input);
assign(output,'robot4.out');rewrite(output);
readln(n);

for i:=1 to n do
readln(ind[i,1],ind[i,2],ind[i,3],ind[i,0]);
sort(1,n);
for i:=1 to n do
begin
ca:=false;
for j:=1 to n do
if (ind[i,1]<=ind[j,3])and(ind[i,2]>=ind[j,3])
and(ind[j,1]<=ind[i,3])and(ind[j,2]>=ind[i,3])then
 begin
 ca:=true;
 break;
 end;
if ca then max:=(max+ind[j,0]) mod 777777777
else max:=max-1;
end;
 writeln(max);
 close(output);
end.
