program game7;
var cj:array[0..500,1..3,1..2]of longint;
    f,z:array[0..500]of longint;
    ss:array[0..500]of real;
    i,j,k,n,m,t:longint;
    s,p:real;

procedure getzx(x1,y1,x2,y2:real;var a,b,c:real);
begin
a:=y2-y1;
b:=x1-x2;
c:=-x1*y2+x2*y1;
end;

function bh(i,j:longint):boolean;
var a,b,c:array[1..3]of real;
    ii:longint;
    x,xx,xxx,xxxx:real;
begin
getzx(cj[j,1,1],cj[j,1,2],cj[j,2,1],cj[j,2,2],a[1],b[1],c[1]);
getzx(cj[j,2,1],cj[j,2,2],cj[j,3,1],cj[j,3,2],a[2],b[2],c[2]);
getzx(cj[j,3,1],cj[j,3,2],cj[j,1,1],cj[j,1,2],a[3],b[3],c[3]);

for ii:=1 to 3 do
 begin
   x:=a[ii]*cj[i,1,1]+b[ii]*cj[i,1,2]+c[ii];
  xx:=a[ii]*cj[i,2,1]+b[ii]*cj[i,2,2]+c[ii];
 xxx:=a[ii]*cj[i,3,1]+b[ii]*cj[i,3,2]+c[ii];
xxxx:=a[ii]*cj[j,(ii+1)mod 3+1,1]+b[ii]*cj[j,(ii+1)mod 3+1,2]+c[ii];
 if (x>=0)and(xx>=0)and(xxx>=0)and(xxxx>=0) then continue;
 if (x<=0)and(xx<=0)and(xxx<=0)and(xxxx<=0) then continue;
 exit(false);
 end;

exit(true);
end;

function mj(i:longint):Real;
var a,b,c,p:real;
begin
a:=sqrt(sqr(cj[i,1,1]-cj[i,2,1])+sqr(cj[i,1,2]-cj[i,2,2]));
b:=sqrt(sqr(cj[i,2,1]-cj[i,3,1])+sqr(cj[i,2,2]-cj[i,3,2]));
c:=sqrt(sqr(cj[i,3,1]-cj[i,1,1])+sqr(cj[i,3,2]-cj[i,1,2]));
p:=(a+B+c)/2;
p:=sqrt(p*(p-a)*(p-b)*(p-c));
exit(p);
end;

procedure sort(i,j:longint);
var x,y:longint;
   z:real;
begin
x:=i; y:=j; z:=ss[(x+y)shr 1];
repeat
while z>ss[y] do dec(y);
while z<ss[x] do inc(x);
if x<=y then
 begin
 cj[0]:=cj[x]; ss[0]:=ss[x];
 cj[x]:=cj[y]; ss[x]:=ss[y];
 cj[y]:=cj[0]; ss[y]:=ss[0];
 inc(x);dec(y);
 end;
until x>y;
if x<j then sort(x,j);
if i<y then sort(i,y);
end;

function get(i:longint):longint;
begin
if f[i]=0 then exit(0)
else exit(get(f[i])+1);
end;

begin
assign(input,'game.in');reset(input);
assign(output,'game.out');rewrite(output);
readln(n,m);
for i:=1 to n do
begin
readln(cj[i,1,1],cj[i,1,2],cj[i,2,1],cj[i,2,2],cj[i,3,1],cj[i,3,2]);
ss[i]:=mj(i);
end;
sort(1,n);

for i:=2 to n do
for j:=i-1 downto 1 do
if bh(i,j) then
begin
f[i]:=j;
break;
end;

 ss[0]:=10000;
for i:=1 to n do
 z[i]:=get(i)+1;

for i:=0 to n do
if z[i]=m then
begin
s:=s+ss[i];
for j:=1 to n do
if f[j]=i then s:=s-ss[j];
end;

writeln(s/(100*100):0:5);
close(output);
end.
