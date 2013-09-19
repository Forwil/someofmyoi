program sequence;
var dat:Array[0..100001]of longint;
  i,j,k,n,m,u,d,x:longint;
begin
assign(input,'sequence.in');reset(input);
assign(output,'sequence.out');rewrite(output);
readln(n);
for i:=1 to n do
begin
readln(dat[i]);
if (i<>1)and(dat[i]<dat[i-1])then
 begin
 writeln(0);
 close(output);
 halt;
 end;
end;
x:=dat[2]-dat[1];
u:=dat[1];
d:=dat[1]-x;
for i:=1 to n-1 do
begin
if dat[i]-d+dat[i]>dat[i+1] then d:=dat[i]*2-dat[i+1];
x:=u;
u:=dat[i]-d+dat[i];
d:=dat[i]-x+dat[i];
end;
if u-d+1<0 then writeln(0)
else writeln(u-d+1);
close(output);
end.
