program mphoto;
var ind:array[0..50000]of longint;
    id:array[0..50000]of longint;
     e:array[0..11]of longint;
 i,j,k,n,m,z:longint;
procedure sort2(i,j:longint);
var d,x,y,z:longint;
begin
x:=i;y:=j;z:=ind[(x+y)shr 1];
d:=id[(x+y)shr 1];
repeat
while (z>ind[y])or((z=ind[y])and(d<id[y])) do dec(y);
while (z<ind[x])or((z=ind[x])and(d>id[x])) do inc(x);
if x<=y then
 begin
 ind[0]:=ind[x];id[0]:=id[x];
 ind[x]:=ind[y];id[x]:=id[y];
 ind[y]:=ind[0];id[y]:=id[0];
 inc(x);dec(y);
 end;
until x>y;
if x<j then sort2(x,j);
if i<y then sort2(i,y);
end;
begin
assign(input,'mphoto.in');
reset(input);
assign(output,'mphoto.out');rewrite(output);
readln(n,k);
if k=0 then halt;
for i:=1 to 10 do
 read(e[i]);
 readln;
 z:=0;
for i:=1 to n do
 begin
 read(ind[i]);
 id[i]:=i;
 end;
 sort2(1,n);
 z:=0;
for i:=1 to n do
 begin
 ind[i]:=ind[i]+e[(i-1)mod 10 +1];
 end;
 close(input);
 sort2(1,n);
for i:=1 to k-1 do
write(id[i],' ');
writeln(id[k]);
close(output);
end.
