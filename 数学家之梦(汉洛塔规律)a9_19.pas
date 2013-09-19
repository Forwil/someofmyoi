program d9_5;
var n,k,c,i,m:longint;
a,b:real;
begin
readln(m,n);
a:=1;
b:=2;
c:=0;
k:=m-2;
if m>2 then
for i:= 2 to n do
 begin
  c:=c+1;
  a:=a+b;
  if a>181818181818 then
    a:=a-181818181818;
  if c=k then
   begin
    k:=k+m-3;
    c:=0;
    b:=b*2;
    if b>181818181818 then
    b:=b-181818181818;
   end;
 end;
 if ((m=2)and(n=1)) then writeln(1);
 if ((m=2)and(n<>1)) then writeln(-18);
 if m=1 then writeln(0);
 if (m>=2) then writeln(a:0:0);
end.
