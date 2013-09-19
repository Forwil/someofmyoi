program biu;
const m2=100000;m1=2000000;
var   d:array[0..m1,1..2]of longint;
     wh:Array[0..m1]of longint;
     p,c:array[0..m2]of longint;
     id:Array[0..2001]of longint;
     tab:array[0..2001,0..2001]of boolean;
 t,x,y,i,j,k,n,m,min,tot:longint;
function get(x:longint):longint;
begin
 if p[x]=x then exit(x)
 else
  begin
  p[x]:=get(p[x]);
  exit(p[x]);
  end;
end;

procedure sort(i,j:longint);
var x,y,z:longint;
begin
x:=i;y:=j;z:=c[(x+y)shr 1];
repeat
while z>c[y] do dec(y);
while z<c[x] do inc(x);
if x<=y then
begin
c[0]:=c[x];
c[x]:=c[y];
c[y]:=c[0];
inc(x);dec(y);
end;
until x>y;
if x<j then sort(x,j);
if i<y then sort(i,y);
end;

begin
assign(input,'biu.in');reset(input);
assign(output,'biu.out');rewrite(output);
readln(n,m);
for i:=1 to m do
 begin
 readln(d[i,1],d[i,2]);
 inc(c[d[i,1]]);
 inc(c[d[i,2]]);
 end;
 min:=maxlongint;
for i:=1 to n do
 if c[i]<min then
   begin
   min:=c[i];
   k:=i;
   end;

for i:=1 to n do p[i]:=k;
t:=0;
tot:=n;
for i:=1 to m do
 if d[i,1]=k then
   begin
   t:=t+1;
   id[t]:=d[i,2];
   wh[d[i,2]]:=t;
   p[d[i,2]]:=d[i,2];
   tot:=tot-1;
   end else
 if d[i,2]=k then
   begin
   t:=t+1;
   id[t]:=d[i,1];
   wh[d[i,1]]:=t;
   p[d[i,1]]:=d[i,1];
   tot:=tot-1;
   end;
fillchar(c,sizeof(c),0);
for i:=1 to m do
begin
 if (p[d[i,1]]<>k)and(p[d[i,2]]<>k) then
  tab[wh[d[i,1]],wh[d[i,2]]]:=true;
 if (p[d[i,1]]=k)and(p[d[i,2]]<>k) then
 inc(c[d[i,2]]);
 if (p[d[i,1]]<>k)and(p[d[i,2]]=k) then
 inc(c[d[i,1]]);
end;
for i:=1 to t do
if c[id[i]]<>tot then p[id[i]]:=k;

for i:=1 to t do
for j:=i+1 to t do
if (tab[j,i]=false)and(tab[i,j]=false) then
begin
x:=get(id[i]);
y:=get(id[j]);
p[x]:=p[y];
end;

fillchar(c,sizeof(c),0);
for i:=1 to n do
begin
p[i]:=get(i);
inc(c[p[i]]);
end;

sort(1,n);

for i:=1 to n do
if c[i]=0 then break;
t:=i-1;
writeln(t);
for i:=t downto 1 do
write(c[i],' ');
close(output);
end.

