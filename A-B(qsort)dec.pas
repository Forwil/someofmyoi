program dec_;
var dat,C:Array[0..200001]of longint;
    ans,t,w,cc,i,j,n,m:longint;
    k:int64;
procedure sort(i,j:longint);
var x,y,z:longint;
begin
x:=i;y:=j;z:=dat[(x+Y)shr 1];
repeat
while z<dat[y] do dec(y);
while z>dat[x] do inc(x);
if x<=y then
begin
dat[0]:=dat[x];
dat[x]:=dat[y];
dat[y]:=dat[0];
inc(x);dec(y);
end;
until x>y;
if x<j then sort(x,j);
if i<y then sort(i,y);
end;

function find(x:longint):longint;
var t,w,mi:longint;
begin
t:=1;
w:=n;
mi:=(t+w)shr 1;
repeat
if dat[mi]>x then w:=mi-1;
if dat[mi]<x then t:=mi+1;
if dat[mi]=x then exit(mi);
mi:=(t+w)shr 1;
until t>w;
exit(0);
end;


begin
assign(input,'dec.in');reset(input);
assign(output,'dec.out');rewrite(output);
readln(n,cc);
for i:=1 to n do
read(dat[i]);
sort(1,n);
t:=1;
for i:=1 to n do
if dat[i]=dat[t] then inc(c[t])
else
 begin
 t:=t+1;
 dat[t]:=dat[i];
 inc(c[t]);
 end;
 n:=t;
for i:=1 to n do
 begin
   k:=find(dat[i]+cc);
   ans:=ans+c[i]*c[k];
 end;
writeln(ans);
close(output);
end.
