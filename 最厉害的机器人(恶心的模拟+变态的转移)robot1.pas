program robot1;
var sl1,sl2,mj1,mj2,lq1,lq2,dl1,dl2,yq1,yq2:longint;
    hp1,hp2,ark1,ark2,fy1,fy2,sb1,sb2,bj1,bj2,mz1,mz2:longint;
    hp3,hp4,i,j,k,n,m,i1,i2,i3,i4:longint;  x,y,ans:real;
function max(a,b:longint):longint;
begin if a>b then max:=a else max:=b;end;
begin
assign(input,'robot1.in');
reset(input);
assign(output,'robot1.out');
rewrite(output);
readln(sl1,mj1,lq1,dl1,yq1);
readln(sl2,mj2,lq2,dl2,yq2);
hp1:=dl1+50;
ark1:=trunc(yq1/10)+sl1+trunc(lq1/5);
fy1:=dl1+trunc(yq1/10);
sb1:=mj1*2;
mz1:=70+lq1-sb2;
if mz1<5 then mz1:=5;
if mz1>95then mz1:=95;
bj1:=yq1-yq2;
if bj1>100 then bj1:=100;
if bj1<1 then bj1:=1;
for i1:=0 to 5 do
for i2:=0 to 5-i1 do
for i3:=0 to 5-i1-i2 do
for i4:=0 to 5-i1-i2-i3 do
begin
i:=5-i1-i2-i3-i4;
hp2:=dl2+i4+50;
ark2:=trunc((yq2+i)/10)+sl2+i1+trunc((lq2+i2)/5);
fy2:=dl2+i4+trunc((yq2+i)/10);
sb2:=(mj2+i2)*2;
mz2:=70+(lq2+i2)-sb1;
if mz2<5 then mz2:=5;
if mz2>95 then mz2:=95;
bj2:=(yq2+i)-yq1;
if bj2>100 then bj2:=100;
if bj2<1 then bj2:=1;
x:=hp2+mz2+ark2+fy2+sb2+mz2+bj2;
y:=hp1+mz1+ark1+fy1+sb1+mz1+bj1;
if (x/y)>ans then ans:=(x/y) ;
end;
writeln(ans:0:4);
close(output);
end.
