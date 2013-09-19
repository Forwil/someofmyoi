program stops;
var d1,d2,d3,d4,d5,d6,ans,ans1,ans2:array[1..2]of real;
    a,b,c,a1,b1,c1,t,p,out1,out2:real;
    year,n,m,day,i,j:longint;
procedure getcd(var x,y:real;a,b,c,x0,y0:real);
begin
x:=(b*b*X0-a*b*Y0-a*c)/(a*a+b*b);
y:=(a*a*y0-a*b*x0-b*c)/(a*a+b*b);
end;

procedure getdcd(var x,y:real;a,b,c,x0,y0:Real);
var x1,y1:real;
begin
getcd(x1,y1,a,b,c,x0,y0);
x:=x1*2-x0;
y:=y1*2-y0;
end;

procedure getjd(var x,y:real;a,b,c,a1,b1,c1:real);
begin
if a=0 then
  begin
  y:=-c/b;
  x:=(-c1-b1*y)/a1;
  exit;
  end;
if a1=0 then
  begin
  y:=-c1/b1;
  x:=(-c-b*y)/a;
  exit;
  end;
y:=(c1-(c*a1)/a)/((b*a1)/a-b1);
x:=(c1-(c*b1)/b)/((a*b1)/b-a1);
end;

procedure getzx(var a,b,c:real;x1,y1,x2,y2:Real);
begin
a:=y1-y2;
b:=x2-x1;
c:=-(y1*x2-x1*y1-y2*x1+x1*y1);
end;
begin
assign(input,'stops.in');reset(input);
assign(output,'stops.out');rewrite(output);
readln(d1[1],d1[2],d2[1],d2[2]);
readln(d3[1],d3[2],d4[1],d4[2]);
readln(m,n,t,p);
readln(year);
p:=p*n;
for i:=year to year+n-1 do
 begin
 if (i mod 400=0)or((i mod 4=0)and(i mod 100<>0))then
 day:=day+366
 else day:=day+365;
 end;

getzx(a,b,c,d1[1],d1[2],d2[1],d2[2]);
if d1[1]=d2[1] then
 begin
 if (d3[1]-d1[1])*(d4[1]-d1[1])>0 then
 begin
 getdcd(d5[1],d5[2],a,b,c,d3[1],d3[2]);
 d3:=d5;
 end;
 end
else
if (d3[2]-(d3[1]*(-a/b)+(-c/b)))*(d4[2]-(d4[1]*(-a/b)+(-c/b)))>0 then
 begin
   getdcd(d5[1],d5[2],a,b,c,d3[1],d3[2]);
 d3:=d5;
 end;
getzx(a1,b1,c1,d3[1],d3[2],d4[1],d4[2]);
getjd(ans[1],ans[2],a,b,c,a1,b1,c1);
getcd(ans1[1],ans1[2],a,b,c,d3[1],d3[2]);
getcd(ans2[1],ans2[2],a,b,c,d4[1],d4[2]);

out1:=sqrt(sqr(d3[1]-d4[1])+sqr(d3[2]-d4[2]));
out2:=sqrt(sqr(ans1[1]-d3[1])+sqr(ans1[2]-d3[2]))+
      sqrt(sqr(ans2[1]-d4[1])+sqr(ans2[2]-d4[2]));
if out1*m*day*t+p<out2*m*day*t+p+p then
 begin
 writeln(out1*m*day*t+p:0:4);
 writeln(1);
 write(ans[1]:0:4,' ');
 writeln(ans[2]:0:4);
 end
else
 begin
 writeln(out2*m*day*t+p+p:0:4);
 writeln(2);
 write(ans1[1]:0:4,' ');
 writeln(ans1[2]:0:4);
 write(ans2[1]:0:4,' ');
 writeln(ans2[2]:0:4);
 end;
 close(output);
end.