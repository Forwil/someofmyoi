program D9_8;
var  br,bb:array[0..2001]of boolean;
     a,b,c,ia,ib,ic,p:array[0..2001]of longint;
     top,s,ss,k,ans,z,c1,c2,c3,i,j,n,t:longint;
procedure sorta(i,j:longint);
var x,y,z:longint;
begin
x:=i;
y:=j;
z:=a[(x+y) shr 1];
repeat
while z<a[y] do dec(y);
while z>a[x] do inc(x);
if x<=y then
begin
a[0]:=a[x];
a[x]:=a[y];
a[y]:=a[0];
ia[0]:=ia[x];
ia[x]:=ia[y];
ia[y]:=ia[0];
inc(x);dec(y);
end;
until x>y;
if x<j then sorta(x,j);
if i<y then sorta(i,y);
end;
procedure sortc(i,j:longint);
var x,y,z:longint;
begin
x:=i;
y:=j;
z:=c[(x+y) shr 1];
repeat
while z<c[y] do dec(y);
while z>c[x] do inc(x);
if x<=y then
begin
c[0]:=c[x];
c[x]:=c[y];
c[y]:=c[0];
ic[0]:=ic[x];
ic[x]:=ic[y];
ic[y]:=ic[0];
inc(x);dec(y);
end;
until x>y;
if x<j then sortc(x,j);
if i<y then sortc(i,y);
end;
procedure sortb(i,j:longint);
var x,y,z:longint;
begin
x:=i;
y:=j;
z:=b[(x+y) shr 1];
repeat
while z<b[y] do dec(y);
while z>b[x] do inc(x);
if x<=y then
begin
b[0]:=b[x];
b[x]:=b[y];
b[y]:=b[0];
ib[0]:=ib[x];
ib[x]:=ib[y];
ib[y]:=ib[0];
inc(x);dec(y);
end;
until x>y;
if x<j then sortb(x,j);
if i<y then sortb(i,y);
end;
begin
assign(input,'d.in');reset(input);
readln(n);
readln(c1,c2,c3);
for i:=1 to n do
begin
readln(a[i],b[i]);
a[i]:=a[i]*c1;
b[i]:=b[i]*c2;
c[i]:=a[i]+b[i];
ia[i]:=i;
ib[i]:=i;
ic[i]:=i;
end;
sorta(1,n);
sortb(1,n);
sortc(1,n);
for i:=1 to n do
 p[ic[i]]:=i;
s:=0;
fillchar(br,sizeof(br),false);
for i:=1 to n do
 begin
 if a[i]<>a[i-1] then
   begin
   for j:=s to i-1 do
     br[ia[j]]:=true;
   s:=i;
   end;
   top:=1;t:=1;ss:=1;bb:=br;
  for j:=1 to n do
  begin
   if b[j]<>b[j-1] then
     begin
     for z:=ss to j-1 do
      begin
       if  (p[ib[z]]<top)and(bb[ib[z]]=false) then inc(t);
       bb[ib[z]]:=true;
      end;
      ss:=j;
     end;
    while (c[top]<=a[i]+b[j]+c3)and(top<=n) do
     begin
     if bb[ic[top]] then inc(t);
     top:=top+1;
     end;
   if top-t>ans then ans:=top-t;
  end;
 end;
 writeln(ans);
end.
