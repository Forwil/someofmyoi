program n1034;
var p:array[0..5001]of longint;
    i,j,k,n,m,x,y,l:longint;
function getf(x:longint):longint;
begin
if  p[x]=x then exit(x)
else
 begin
 p[x]:=getf(p[x]);
 getf:=p[x];
 end;
end;
begin
 readln(n,m,l);
 for i:=1 to n do
  p[i]:=i;
 for i:=1 to m do
  begin
  readln(x,y);
  x:=getf(x);
  y:=getf(y);
  p[x]:=y;
  end;
 for i:=1 to l do
  begin
  readln(x,y);
  x:=getf(x);
  y:=getf(y);
  if x=y then writeln('Yes')
  else writeln('No');
  end;
end.