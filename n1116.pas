program n1116;
var j,k,n,m:longint;
   y,i,a,b,c,d:real;
   x:array[1..3]of real;
function f(x:real):real;
begin
exit(x*x*x*a+x*x*b+x*c+d);
end;
begin
i:=-100;
j:=1;
readln(a,b,c,d);
while i-100<=0 do
 begin
  y:=f(i);
  if ((y-0)<=0.0001)and((0-y)<=0.0001) then
   begin
    x[j]:=i;
    j:=j+1;
   end;
   i:=i+0.01;
 end;
 write(x[1]:0:2,' ',x[2]:0:2,' ',x[3]:0:2);
end.
