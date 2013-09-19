program circle;
const p=3.141592653589793;
var x1,x2,r1,r2,y1,y2,dis,x0,y0,r0,ans:real;
function san(x1,x2,x3:real):real;
var q:real;
begin
q:=(x1+x2+x3)/2;
exit(sqrt(q*(q-x1)*(q-x2)*(q-x3)));
end;
function g1:real;
var x,y,z,o:real;
begin
x:=0;
y:=0;
z:=0;
o:=0;
x:=san(dis,r1,r2);
x:=(x*2)/dis;
y:=sqrt(r1*r1-x*x);
y:=y+dis;
z:=2*arctan(x/y);
o:=(r2*z*r2)/2;
o:=o-2*san(dis,r1,r2);
y:=y-dis;
z:=2*arctan(x/y);
z:=(z*r1*r1)/2;
o:=z-o;
exit(r1*r1*p-o);
end;
function g2:real;
var x,y,z,o:real;
begin
x:=0;y:=0;z:=0;o:=0;
x:=san(dis,r1,r2);
x:=(x*2)/dis;
z:=sqrt(r2*r2-x*x);
y:=2*arctan(x/z);
o:=(y*r2*r2)/2;
z:=dis-z;
y:=2*arctan(x/z);
y:=(y*r1*r1)/2;
exit(o+y-san(dis,r1,r2)*2);
end;
begin
assign(input,'circle.i04');reset(input);
//assign(output,'circle.out');rewrite(output);
readln(x1,y1,r1,x2,y2,r2);
if r1>r2 then
 begin
 x0:=x1;x1:=x2;x2:=x0;
 y0:=y1;y1:=y2;y2:=y0;
 r0:=r1;r1:=r2;r2:=r0;
 end;
dis:=sqrt(sqr(x1-x2)+sqr(y1-y2));
if dis+r1<=r2 then writeln(r1*r1*p:0:3)
else
if dis>=r1+r2 then writeln('0.000')
else if r2>=dis then writeln(g1:0:3)
else if r2<dis  then writeln(g2:0:3);
close(output);
end.
