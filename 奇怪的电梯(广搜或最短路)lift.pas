program lift;
var z,step:Array[0..500]of longint;
    dat:Array[0..500]of longint;
    t,w,a,b,i,j,k,n,m,x:longint;
begin
assign(input,'lift.in');reset(input);
assign(output,'lift.out');rewrite(output);
readln(n,a,b);
for i:=1 to n do
read(dat[i]);
fillchar(step,sizeof(step),$ff);
t:=0;
w:=1;
z[1]:=a;
step[a]:=0;
repeat
t:=t+1;
x:=z[t]+Dat[z[t]];
if x<=n then
if step[x]=-1 then
 begin
 w:=w+1;
 step[x]:=step[z[t]]+1;
 z[w]:=x;
 end;
x:=z[t]-dat[z[t]];
if x>=1 then
if step[x]=-1 then
 begin
 w:=w+1;
 step[x]:=step[z[t]]+1;
 z[w]:=x;
 end;
until t>=w;
writeln(step[b]);
close(output);
end.
