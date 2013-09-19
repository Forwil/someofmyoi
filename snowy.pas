program snowy;
var ind:array[0..101]of string;
     b:array[0..101]of boolean;
    tot,x,y,t,i,j,k,n,m,l:longint;
    s:string;
procedure sort(i,j:longint);
var x,y:longint;
    z:string;
begin
x:=i;
y:=j;
z:=ind[(x+y)shr 1];
repeat
while z<ind[y] do dec(y);
while z>ind[x] do inc(x);
if x<=y then
 begin
  ind[0]:=ind[x];
  ind[x]:=ind[y];
  ind[y]:=ind[0];
  inc(x);dec(y);
 end;
until x>y;
if i<y then sort(i,y);
if x<j then sort(x,j);
end;
function get(x:string):longint;
var t,w,mi:longint;
begin
t:=1;
w:=n;
mi:=(t+w)shr 1;
repeat
 if x<ind[mi] then w:=mi-1
 else
 if x>ind[mi] then t:=mi+1
 else
 if x=ind[mi] then exit(mi);
 mi:=(t+w)shr 1;
until t>w;
exit(0);
end;
begin
readln(t);
for k:=1 to t do
  begin
  readln(n,m);
   for i:=1 to n do
    readln(ind[i]);
    sort(1,n);
    tot:=0;
    l:=0;
    for i:=1 to m do
     begin
     readln(s);
     x:=get(s);
     if b[x]=false then
        begin
        b[x]:=true;
        tot:=tot+1;
        end;
      if tot=n then
        begin
        fillchar(b,sizeof(b),false);
        tot:=1;
        b[x]:=true;
        l:=l+1;
        end;
     end;
   writeln('For ',k,'# problem we need ',l);
   fillchar(b,sizeof(b),false);
   l:=0;
   tot:=0;
  end;
end.
