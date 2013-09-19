program wedding;
var dat:Array[0..1001]of integer;
    t,id,idd:array[0..10001]of integer;
    wh,cost:array[1..2]of longint;
    pass:array[0..10001]of boolean;
    x,y,i,j,k,n,m,cc,z:longint;
function min(a,b:integer):integer;
begin if a>B then exit(b)else exit(a);end;
function max(a,b:integer):integer;
begin if a>B then exit(a)else exit(b);end;
procedure sort(i,j:longint);
var x,y,z:longint;
begin
x:=i;y:=j;z:=t[(x+y)shr 1];
repeat
while z<t[y] do dec(y);
while z>t[x] do inc(x);
if x<=y then
begin
t[0]:=t[x];t[x]:=t[y];t[y]:=t[0];
id[0]:=id[x];id[x]:=id[y];id[y]:=id[0];
inc(x);dec(y);
end;
until x>y;
if i<y then sort(i,y);
if x<j then sort(x,j);
end;

begin
assign(input,'wedding.in');reset(input);
assign(output,'wedding.out');rewrite(output);
readln(n,m);
for i:=1 to m do
 begin
 readln(dat[i]);
 idd[i]:=i;
 if i<>1 then cc:=cc+abs(dat[i]-dat[i-1]);
 end;

for i:=1 to n-m do
begin
readln(t[i]);
id[i]:=i+m;
end;
sort(1,n-m);

if abs(dat[1]-t[1])<abs(dat[m]-t[1])then
begin
cost[2]:=abs(dat[1]-t[1]);
wh[2]:=0;
end
else
begin
cost[2]:=abs(dat[m]-t[1]);
wh[2]:=m;
end;
for i:=1 to m-1 do
begin
x:=dat[i];y:=dat[i+1];
if x>y then begin  z:=x;x:=y;y:=z;end;
if (t[1]>=x)and(t[1]<=y)then
 begin cost[2]:=0;wh[2]:=i;end;

if (t[1]>=x)and(t[1]>=y)and(cost[2]>(t[1]-y)*2)then
 begin cost[2]:=(t[1]-y)*2;wh[2]:=i;end;

if (t[1]<=x)and(t[1]<=y)and(cost[2]>(x-t[1])*2)then
 begin cost[2]:=(x-t[1])*2;wh[2]:=i;end;
end;

for i:=m+1 downto 1 do
begin
dat[i]:=dat[i-1];
idd[i]:=idd[i-1];
if i-1=wh[2] then break;
end;
dat[i]:=t[1];
idd[i]:=id[1];
m:=m+1;
if abs(dat[1]-t[n-m+1])<abs(dat[m]-t[n-m+1])then
begin
cost[1]:=abs(dat[1]-t[n-m+1]);
wh[1]:=0;
end
else
begin
cost[1]:=abs(dat[m]-t[n-m+1]);
wh[1]:=m;
end;
for i:=1 to m-1 do
begin
x:=dat[i];y:=dat[i+1];
if x>y then begin  z:=x;x:=y;y:=z;end;

if (t[n-m+1]>=x)and(t[n-m+1]<=y)and(cost[1]>0)then
 begin cost[1]:=0;wh[1]:=i;end;

if (t[n-m+1]>=x)and(t[n-m+1]>=y)and(cost[1]>(t[n-m+1]-y)*2)then
 begin cost[1]:=(t[n-m+1]-y)*2;wh[1]:=i;end;

if (t[n-m+1]<=x)and(t[n-m+1]<=y)and(cost[1]>(x-t[n-m+1])*2)then
 begin cost[1]:=(x-t[n-m+1])*2;wh[1]:=i;end;

end;
pass[1]:=true;
pass[n-m+1]:=true;
for i:=m+1 downto 1 do
begin
dat[i]:=dat[i-1];
idd[i]:=idd[i-1];
if i-1=wh[1] then break;
end;
dat[i]:=t[n-m+1];
idd[i]:=id[n-m+1];
m:=m+1;
writeln(cc+cost[1]+cost[2]);
for i:=1 to m-1 do
begin
writeln(idd[i]);
if dat[i]<=dat[i+1]then
for j:=2 to n-m+2 do
begin
if pass[j]then continue;
if(t[j]<=max(dat[i],dat[i+1]))and(t[j]>=min(dat[i],dat[i+1])) then
 begin
 writeln(id[j]);
 pass[j]:=true;
 end;
if t[j]>max(dat[i],dat[i+1])then break;
end;
if dat[i]>dat[i+1]then
for j:=n-m+2  downto 2 do
begin
if pass[j]then continue;
if(t[j]<=max(dat[i],dat[i+1]))and(t[j]>=min(dat[i],dat[i+1])) then
 begin
 writeln(id[j]);
 pass[j]:=true;
 end;
if t[j]<min(dat[i],dat[i+1])then break;
end;
end;
writeln(idd[m]);
close(output);
end.
