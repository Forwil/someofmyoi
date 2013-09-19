program d9_5;
var n,k,a,b,c,i:longint;
begin
readln(n);
a:=1;
b:=2;
c:=0;
k:=2;
for i:= 2 to n do
 begin
  c:=c+1;
  a:=(a+b) mod 10000;
  if c=k then
   begin
    k:=k+1;
    c:=0;
    b:=(b*2)mod 10000;
   end;
 end;
 writeln(a);
end.
