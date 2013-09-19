program long;
var sum:Array[0..201,0..201]of int64;
     ss,sss:array[0..201]of int64;
     id:Array[0..201]of integer;
   zz,mm,z,t,i,j,k,n,m,x:longint;
   s:int64;
   ans:int64;

procedure sort(i,j:longint);
var x,y:longint;
  z:int64;
begin
x:=i;y:=j;z:=ss[(x+y)shr 1];
repeat
while z>ss[y] do dec(y);
while z<ss[x] do inc(x);
if x<=y then
begin
id[0]:=id[x];id[x]:=id[y];id[y]:=id[0];
ss[0]:=ss[x];ss[x]:=ss[y];ss[y]:=ss[0];
inc(x);dec(y);
end;
until x>y;
if x<j then sort(x,j);
if i<y then sort(i,y);
end;

function max(a,b:int64):int64;
begin if a>b then max:=a else max:=b;end;
begin
assign(input,'long.in');reset(input);
assign(output,'long.out');rewrite(output);
readln(n,m);
for i:=1 to n do
for j:=1 to m do
 begin
 read(x);
 sum[i,j]:=sum[i-1,j]+x;
 if j=m then readln;
 end;

for i:=1 to n do
for j:=i to n do
 begin
 ss[0]:=0;
 for z:=1 to m do
 begin
 ss[z]:=ss[z-1]+sum[j,z]-sum[i-1,z];
 id[z]:=z;
 end;
 sss:=ss;
 sort(1,m);
 t:=1;
 for z:=0 to m-1 do
  while (ss[t]>=sss[z])and(t<=m) do
  begin
  if id[t]>z then
  ans:=max(ans,(j-i+1)*(id[t]-z));
  t:=t+1;
  end;
 end;
 writeln(ans);
 close(output);
end.
