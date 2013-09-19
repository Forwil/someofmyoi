program rational;
var y,x,i,j,k,n,m,x1,y1,x2,y2:longint;
    l,lo,hi:real;
procedure yue(var x,y:longint);
var a,b,r:longint;
begin
a:=x;
b:=y;
repeat
r:=a mod b;
a:=b;
b:=r;
until r=0;
x:=x div a;
y:=y div a;
end;
begin
//assign(input,'rational.in');reset(input);
//assign(output,'rational.out');rewrite(output);
readln(m,n);
x:=n;
y:=n;
lo:=0;
hi:=50000;
repeat
l:=x/y;
if l*l>m then
   begin
   if (l*l-m)<(hi-m) then
         begin
         hi:=l*l;
         x1:=x;
         y1:=y;
         end;
         x:=x-1;
   end
  else  begin
        if (m-(l*l))<(m-lo) then
        begin
        lo:=l*l;
        x2:=x;
        y2:=y;
        end;
        y:=y-1;
        end;
until ((x=0)or(y=0));
yue(x2,y2);
yue(x1,y1);
writeln(x2,'/',y2,' ',x1,'/',y1);
close(output);
end.
