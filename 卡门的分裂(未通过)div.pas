program divv;
const p=1000;
type  node=array[0..100]of longint;
var dt:array[0..1]of node;
   cat:Array[0..5000]of node;
    i,j,k,n,m:longint;
function add(s1,s2:node):node;
var i,jin:longint;
begin
fillchar(add,sizeof(add),0);
jin:=0;
if s1[0]>s2[0] then add[0]:=s1[0]
else add[0]:=s2[0];
for i:=1 to add[0] do
 begin
 add[i]:=(s1[i]+s2[i]+jin) mod p;
 jin:=(s1[i]+s2[i]+jin) div p;
 end;
if jin<>0 then
begin
inc(add[0]);
add[add[0]]:=jin;
end;
end;

procedure out(x:node);
var i:longint;
begin
write(x[x[0]]);
for i:=x[0]-1 downto 1 do
 begin
 if x[i]<10 then write('0');
 if x[i]<100 then write('0');
 write(x[i]);
 end;
end;

function get(x:qword):qword;
var y,yy:qword;
begin
if x=0 then exit(1);
if x=1 then exit(2);
y:=get(x div 2) mod 1111111;
y:=y*y mod 1111111;
yy:=get(x mod 2);
exit(y*yy);
end;

function ce(s1:node;x:longint):node;
var i:longint;
begin
fillchar(ce,sizeof(ce),0);
ce[0]:=s1[0];
for i:=1 to ce[0] do
 ce[i]:=s1[i]*x;
for i:=1 to ce[0] do
 begin
 ce[i+1]:=ce[i+1]+ce[i] div p;
 ce[i]:=ce[i] mod p;
 end;
while ce[ce[0]+1]<>0 do
 begin
 ce[0]:=ce[0]+1;
 ce[ce[0]+1]:=ce[ce[0]+1]+ce[ce[0]] div 1000;
 ce[ce[0]]:=ce[ce[0]] mod 1000;
 end;
end;
function re(s1,s2:node):node;
var i,j:longint;
begin
fillchar(re,sizeof(re),0);
if s1[0]>s2[0] then re[0]:=s1[0]
else re[0]:=s1[0];
for i:=1 to re[0] do
 re[i]:=s1[i]-s2[i];
for i:=re[0] downto 1 do
 if re[i]<0 then
  begin
   re[i-1]:=re[i-1]-1;
   re[i]:=re[i]+p;
  end;
end;
begin
//assign(input,'div.in');reset(input);
//assign(output,'div.out');rewrite(output);
readln(n);
dt[1][1]:=1;
dt[1][0]:=1;
cat[1][1]:=1;
cat[1][0]:=1;
for i:=2 to n div 2 do
cat[i]:=ce(cat[i-1],(4*i-6) div i);

for i:=2 to n do
begin
  k:=i and 1;
  dt[k]:=add(dt[1-k],dt[1-k]);
  if k=1 then
  dt[k]:=re(dt[k],cat[(i-1)div 2]);
end;
out(dt[n and 1]);
writeln(k);
close(output);
end.
