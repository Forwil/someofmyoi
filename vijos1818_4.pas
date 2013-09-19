program vijos1818_4;
var dt:array[0..1,-10000..10000]of int64;
   i,j,n,m:longint;     k:int64;
function get(x:int64):int64;
var l,r:int64;
begin
if x=1 then exit(2);
if x=0 then exit(1);
 l:=0;
 r:=0;
l:=get(x shr 1);
r:=get(x and 1);
     exit((l*l*r)mod 1000000007);
end;
begin
readln(n,m);
fillchar(dt,sizeof(dt),0);
dt[1,0]:=1;
dt[0,0]:=1;
for i:=2 to n do
for j:=1 to m do
 dt[i and 1,j]:=(dt[(i-1)and 1,j]+dt[i and 1,j-1]-dt[(i-1)and 1,j-i])
 mod 1000000007;
 k:=get(dt[n and 1,m]);
writeln(k);
end.
