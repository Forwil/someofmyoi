program d10_8;
var tab:Array[0..15,0..15]of longint;
     d:array[0..15*15,1..2]of integer;
     ha,li:array[0..15,1..5]of integer;
     hh,ll:array[0..15,1..5]of longint;
     o,xx,yy,z,x,y,x1,y1,i,j,k,n,m,ans:longint;
function max(a,b:longint):longint;
begin if a>b then max:=a else max:=b;end;
procedure sort(i,j:longint);
var x,y,z:longint;
begin
x:=i;y:=j;z:=tab[d[(x+y)shr 1,1],d[(x+y)shr 1 ,2]];
repeat
while z<tab[d[y,1],d[y,2]] do dec(y);
while z>tab[d[x,1],d[x,2]] do inc(x);
if x<=y then
begin
d[0]:=d[x];d[x]:=d[y];d[y]:=d[0];
inc(x);dec(y);
end;
until x>y;
if i<y then sort(i,y);
if x<j then sort(x,j);
end;
procedure geng(x,y,o:longint);
var i,j:longint;
begin
ha[x,5]:=y;
hh[x,5]:=o;
for i:=5 downto 2 do
 if  hh[x,i]>hh[x,i-1] then
    begin
    j:=ha[x,i];
    ha[x,i]:=ha[x,i-1];
    ha[x,i-1]:=j;
    j:=hh[x,i];
    hh[x,i]:=hh[x,i-1];
    hh[x,i-1]:=j;
    end;
li[y,5]:=x;
ll[y,5]:=o;
for i:=5 downto 2 do
 if ll[y,i]>ll[y,i-1] then
    begin
    j:=li[y,i];
    li[y,i]:=li[y,i-1];
    li[y,i-1]:=j;
    j:=ll[y,i];
    ll[y,i]:=ll[y,i-1];
    ll[y,i-1]:=j;
    end;
end;
begin
readln(n);
readln(x1,y1);
for i:=1 to n do
for j:=1 to n do
 begin
 read(tab[i,j]);
 d[(i-1)*n+j,1]:=i;
 d[(i-1)*n+j,2]:=j;
 end;
sort(1,n*n);
geng(x1,y1,1);

for i:=1 to n*n do
if tab[x1,y1]<tab[d[i,1],d[i,2]]then
 begin
 x:=d[i,1];y:=d[i,2];
 o:=0;
 for xx:=1 to 4 do
  begin
   if x>1 then
   if (abs(ha[x-1,xx]-y)>1)and(tab[x-1,ha[x-1,xx]]<tab[x,y])then
   if hh[x-1,xx]<>0 then
   o:=max(o,hh[x-1,xx]+1);
   if x<n then
   if (abs(ha[x+1,xx]-y)>1)and(tab[x+1,ha[x+1,xx]]<tab[x,y])then
   if hh[x+1,xx]<>0 then
   o:=max(o,hh[x+1,xx]+1);
   if y>1 then
   if (abs(li[y-1,xx]-x)>1)and(tab[li[y-1,xx],y-1]<tab[x,y])then
   if ll[y-1,xx]<>0 then
   o:=max(o,ll[y-1,xx]+1);
   if y<n then
   if (abs(li[y+1,xx]-x)>1)and(tab[li[y+1,xx],y+1]<tab[x,y])then
   if ll[y+1,xx]<>0 then
   o:=max(o,ll[y+1,xx]+1);
  end;
 if o>ans then ans:=o;
 if o>0 then geng(x,y,o);
 end;
 writeln(ans);
end.
