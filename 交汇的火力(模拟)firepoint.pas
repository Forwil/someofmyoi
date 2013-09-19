program firepoint;
var ind:Array[0..101,1..2]of longint;
    a:array[0..50000,1..2]of real;
    ans,i,j,k,n,m,x,y,t:longint;
procedure sort(i,j:longint);
var x,y:longint;
    z:real;
begin
x:=i;
y:=j;
z:=a[(x+y)shr 1,1];
repeat
while z<a[y,1] do dec(y);
while z>a[x,1] do inc(x);
if x<=y then
begin
a[0]:=a[x];
a[x]:=a[y];
a[y]:=a[0];
inc(x);dec(y);
end;
until x>y;
if x<j then sort(x,j);
if i<y then sort(i,y);
end;
begin
assign(input,'firepoint.in');
reset(input);
assign(output,'firepoint.out');rewrite(output);
readln(n);
for i:=1 to n do
 readln(ind[i,1],ind[i,2]);
 t:=0;
 for i:=1 to n do
   for j:=i+1 to n do
    if ind[i,1]<>ind[j,1] then
     begin
      inc(t);
      a[t,1]:=(ind[i,2]-ind[j,2])/(ind[j,1]-ind[i,1]);
      a[t,2]:=a[t,1]*ind[i,1]+ind[i,2];
     end;
 sort(1,t);
 ans:=t;
 for i:=1 to t do
  begin
  for j:=i-1 downto 1 do
    begin
    if (a[i,1]=a[j,1])and(a[j,2]=a[i,2])  then
      begin dec(ans); break; end;
    if a[i,1]<>a[j,1] then break;
    end
  end;
 if ans=0 then writeln('No Fire Point.')
 else writeln(ans);
 close(output);
end.
