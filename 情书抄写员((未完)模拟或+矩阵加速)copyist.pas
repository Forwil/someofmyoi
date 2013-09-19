program copylis;
var  dt:Array[0..2]of qword;
     y,i,j,k,n,m,a,b:longint;
     ans1,ans2,ans3:qword;
function yue(a,b:qword):qword;
var t,r:qword;
begin
repeat
r:=a mod b;
a:=b;
b:=r;
until b=0;
exit(a);
end;
function max(a,b:longint):longint;
begin if a>b then max:=a else max:=b;end;
begin
assign(input,'copyist.in');
reset(input);
assign(output,'copyist.out');
rewrite(output);
readln(k,m,a,b);
dt[1]:=1;
if 1=a then ans1:=1;
y:=yue(a,b);
if y=1 then ans3:=1;
for i:=2 to max(y,max(a,b)) do
 begin
 dt[i mod 3]:=(dt[(i-2+3) mod 3]*k+dt[(i-1+3)mod 3]) mod m;
 if i=a then ans1:=dt[i mod 3];
 if i=b then ans2:=dt[i mod 3];
 if i=y then ans3:=dt[i mod 3]
 end;
writeln(ans1);
writeln(ans2);
writeln(ans3);
close(output);
end.
