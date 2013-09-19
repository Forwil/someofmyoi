program moonarch;
uses math;
const p=3.141592653589793;
var
    af,dis,ans,v,jd,i,j,x,y:real;
function getv(o:real):real;
var k:real;
begin
 k:=p-arcsin(sin(af)*dis/o)-af;
 getv:=o/((o*sin(k)/sin(af))/v);
end;
function min(a,b:real):real;
begin if a>b then min:=b else min:=a;end;
begin
assign(input,'moonarch.in');reset(input);
assign(output,'moonarch.out');rewrite(output);
readln(x,y,v,jd);
 dis:=sqrt(x*x+y*y);
 af:=p-jd*(p/180);
if x<>0 then af:=arctan(y/x)+af;
 i:=dis+1;
 ans:=1e38;
 repeat
 ans:=min(ans,getv(i));
 i:=i+1/4;
 until i>2000;
writeln(ans:0:0);
close(output);
end.