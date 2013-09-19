program num;
var  c:array[0..9]of longint;
     s:array[0..9]of longint;
r,j,k,n,m,x,y:int64;
i:longint;
begin
assign(input,'num.in');reset(input);
assign(output,'num.out');rewrite(output);
s[0]:=1;
for i:=1 to 8 do
s[i]:=s[i-1]*10;

readln(c[1],c[2]);
y:=99999900;
x:=0;
for i:=3 to 8 do
 begin
 c[i]:=(c[i-1]+c[i-2]) mod 4;
 x:=x+c[i]*s[8-i];
 end;
x:=x*100+(c[1]*10+c[2])*y;
y:=y*100;
m:=x;
j:=y;
repeat
r:=m mod j;
m:=j;
j:=r;
until r=0;
writeln(x div m,'/',y div m);
close(output);
end.
