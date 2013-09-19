program path;
var dis:array[0..60,0..60,0..60]of longint;
   ans:array[0..60,0..60]of real;
    r,z,x,y,i,j,k,n,m:longint;
    find:boolean;
    rr:real;
function min(a,b:longint):longint;
begin if a>b then min:=b else min:=a;end;
begin
assign(input,'path.in');reset(input);
assign(output,'path.out');rewrite(output);
readln(n,m);
fillchar(dis,sizeof(dis),63);
fillchar(ans,sizeof(ans),$7f);
r:=dis[0,0,0];
for i:=1 to m do
 begin
 readln(x,y,z);
 dis[x,y,1]:=min(dis[x,y,1],z);
 end;
for i:=1 to n do
dis[i,i,0]:=0;

for z:=1 to n do
for k:=1 to n do
for i:=1 to n do
for j:=1 to n do
 dis[i,j,z]:=min(dis[i,j,z],dis[i,k,z-1]+dis[k,j,1]);

rr:=ans[0,0];

for i:=1 to n do
for j:=1 to n do
for z:=1 to n do
if dis[i,j,z]<>r then
if dis[i,j,z]/z<ans[i,j] then ans[i,j]:=dis[i,j,z]/z;

readln(m);
for i:=1 to m do
begin
readln(x,y);
if ans[x,y]>=rr then writeln('OMG!')
else writeln(ans[x,y]:0:3);
end;
close(output);
end.
