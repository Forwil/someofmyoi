program road;
type link=^bad;
  bad=record
  id,vi:longint;
  next:link;
  end;
var
     ind:Array[0..10000,0..2]of longint;
     ans,w,mi,l,min,x,y,z,i,j,k,n,m,t:longint;
     q:link;
procedure sort(i,j:longint);
var x,y,z:longint;
begin
x:=i;
y:=j;
z:=ind[(x+y)shr 1,0];
repeat
while z<ind[y,0] do dec(y);
while z>ind[x,0] do inc(x);
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
function can(x:longint):boolean;
var ln:array[0..1001]of link;
    p:array[0..1001]of longint;
 b:array[0..1001]of boolean;
 q:link;
 i,j,k,y,z,min:longint;
begin
fillchar(ln,sizeof(ln),0);
 for i:=1 to m do
 begin
  if ind[i,0]<=x then
    begin
    new(q);
    q^.id:=ind[i,1];
    q^.vi:=0;
    q^.next:=ln[ind[i,2]];
    ln[ind[i,2]]:=q;
    new(q);
    q^.id:=ind[i,2];
    q^.vi:=0;
    q^.next:=ln[ind[i,1]];
    ln[ind[i,1]]:=q;
    end
  else
    begin
    new(q);
    q^.id:=ind[i,1];
    q^.vi:=1;
    q^.next:=ln[ind[i,2]];
    ln[ind[i,2]]:=q;
    new(q);
    q^.id:=ind[i,2];
    q^.vi:=1;
    q^.next:=ln[ind[i,1]];
    ln[ind[i,1]]:=q;
    end;
  end;
q:=ln[1];
fillchar(p,sizeof(p),$7f);
fillchar(b,sizeof(b),true);
while q<>nil do
 begin
 p[q^.id]:=q^.vi;
 q:=q^.next;
 end;
 b[1]:=false;
for i:=1 to n-1 do
 begin
 min:=maxlongint;
 for j:=1 to n do
  if (b[j])and(p[j]<min) then
   begin
    min:=p[j];k:=j;
   end;
 b[k]:=false;
 if k=n then break;
 q:=ln[k];
 while q<>nil do
  begin
  if (b[q^.id])and(p[q^.id]>p[k]+q^.vi) then
   p[q^.id]:=p[k]+q^.vi;
  q:=q^.next;
  end;
 end;
if p[n]<=l then exit(true)
else exit(false);
end;
begin
assign(input,'road.in');reset(input);
assign(output,'road.out');rewrite(output);
readln(n,m,l);
for i:=1 to m do
 begin
  readln(x,y,z);
  ind[i,0]:=z;
  ind[i,1]:=x;
  ind[i,2]:=y;
  end;
sort(1,m);
t:=1;
w:=m;
mi:=(t+w) shr 1;
repeat
 if can(ind[mi,0]) then
 begin
 w:=mi-1;
 ans:=ind[mi,0];
 end
 else t:=mi+1;
 mi:=(t+w)shr 1;
until t>w;
if can(0) then writeln(0)
else
if t>=m then writeln(-1)
else
writeln(ans);
close(output);
end.