program n1045;
var ind:array[0..100001,1..2]of longint;
     d:array[0..100001]of real;
     p:Array[0..100001]of longint;
   x,y,i,j,k,n,m:longint;
   s,ans:real;
procedure sort(i,j:longint);
var x,y:longint;
z:real;
begin
x:=i;y:=j;z:=d[(x+y)shr 1];
repeat
while z<d[y] do dec(y);
while z>d[x] do inc(x);
if x<=y then
begin
d[0]:=d[x];d[x]:=d[y];d[y]:=d[0];
ind[0]:=ind[x];ind[x]:=ind[y];ind[y]:=ind[0] ;
inc(x);dec(y);
end;
until x>y;
if i<y then sort(i,y);
if x<j then sort(x,j);
end;
function get(x:longint):longint;
begin
if p[x]=x then exit(x)
else
begin
p[x]:=get(p[x]);
get:=p[x];
end;
end;
begin
 readln(s);
 readln(n);
 i:=0;
 while not(eof) do
  begin
   i:=i+1;
   readln(ind[i,1],ind[i,2],d[i]);
  end;
 m:=i;
 sort(1,m);
 for i:=1 to n do
 p[i]:=i;

 for i:=1 to m do
  begin
  x:=get(ind[i,1]);
  y:=get(ind[i,2]);
  if x<>y then
   begin
   k:=k+1;
   ans:=ans+d[i];
   p[x]:=y;
   end;
  end;
if (ans<=s)and(k=n-1) then writeln('Need ',ans:0:2,' miles of cable ')
else writeln('Impossible');
end.