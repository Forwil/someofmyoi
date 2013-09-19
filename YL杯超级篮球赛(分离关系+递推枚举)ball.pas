program ball;
var ix,iy,xx,yy,zz:Array[0..50001]of longint;
   sl,sr:array[0..50001]of int64;
   i,j,k,n,m:longint;
   t,out1,out2:int64;

procedure sortx(i,j:longint);
var x,y,z:longint;
begin
x:=i;y:=j;z:=xx[(x+y)shr 1];
repeat
while z<xx[y] do dec(y);
while z>xx[x] do inc(x);
if x<=y then
 begin
 xx[0]:=xx[x];
 xx[x]:=xx[y];
 xx[y]:=xx[0];
 ix[0]:=ix[x];
 ix[x]:=ix[y];
 ix[y]:=ix[0];
 inc(x);dec(y);
 end;
until x>y;
if x<j then sortx(x,j);
if i<y then sortx(i,y);
end;

procedure sorty(i,j:longint);
var x,y,z:longint;
begin
x:=i;y:=j;z:=yy[(x+y)shr 1];
repeat
while z<yy[y] do dec(y);
while z>yy[x] do inc(x);
if x<=y then
 begin
 yy[0]:=yy[x];
 yy[x]:=yy[y];
 yy[y]:=yy[0];
 iy[0]:=iy[x];
 iy[x]:=iy[y];
 iy[y]:=iy[0];
 inc(x);dec(y);
 end;
until x>y;
if x<j then sorty(x,j);
if i<y then sorty(i,y);
end;

begin
assign(input,'ball.in');reset(input);
assign(output,'ball.out');rewrite(output);
readln(n);
for i:=1 to n do
begin
read(zz[i]);
ix[i]:=i;
iy[i]:=i;
end;
for i:=1 to n do
readln(xx[i],yy[i]);

sortx(1,n);
for i:=1 to n do
sl[i]:=sl[i-1]+zz[ix[i]];
for i:=n downto 1 do
sr[i]:=sr[i+1]+zz[ix[i]];
t:=0;
for i:=2 to n do
t:=t+abs(xx[i]-xx[1])*zz[ix[i]];
for i:=2 to n do
begin
t:=t+(sl[i-1]-sr[i])*(xx[i]-xx[i-1]);
if out1=0 then out1:=t
else if t<out1 then out1:=t;
end;
sorty(1,n);
for i:=1 to n do
sl[i]:=sl[i-1]+zz[iy[i]];
for i:=n downto 1 do
sr[i]:=sr[i+1]+zz[iy[i]];
t:=0;
for i:=2 to n do
t:=t+abs(yy[i]-yy[1])*zz[iy[i]];

for i:=2 to n do
begin
t:=t+(sl[i-1]-sr[i])*(yy[i]-yy[i-1]);
if out2=0 then out2:=t
else if t<out2 then out2:=t;
end;
writeln(out1+out2,'.00');
close(output);
end.
