program cost_;
type link=^ddf;
 ddf=record
 id,vi:longint;
 next:link;
 end;
var ln:array[0..10001]of link;
    f,id,o,wh:array[0..10001]of longint;
    p:array[0..10001]of longint;
 ans,z,x,y,t,w,mi,s,i,j,k,n,m,a,b:longint;
 q:link;

procedure dsort(i:longint);
var j:longint;
begin
j:=i*2;
while j<=n do
 begin
 if (p[j+1]<p[j])and(j<n) then j:=j+1;
 if p[j]<p[i] then
   begin
   o[0]:=o[i];o[i]:=o[j];o[j]:=o[0];
   p[0]:=p[i];p[i]:=p[j];p[j]:=p[0];
   wh[o[i]]:=i;
   wh[o[j]]:=j;
   i:=j;j:=2*i;
   end
  else exit;
 end;
end;

procedure usort(i:longint);
var j:longint;
begin
j:=i div 2;
while j<>0 do
 begin
 if p[i]<p[j] then
   begin
   o[0]:=o[i];o[i]:=o[j];o[j]:=o[0];
   p[0]:=p[i];p[i]:=p[j];p[j]:=p[0];
   wh[o[i]]:=i;
   wh[o[j]]:=j;
   i:=j;j:=i div 2;
   end
 else exit;
 end;
end;

procedure go(c:longint);
var q:link;
    i,k,j,nn,min:longint;
    pass:array[0..10001]of boolean;
begin
fillchar(pass,sizeof(pass),false);

p[a]:=0;
pass[a]:=true;
usort(a);
for i:=1 to n-1 do
 begin
 k:=o[1];
 min:=p[1];
 pass[k]:=true;
 if k=b then exit;
 p[1]:=maxlongint;
 dsort(1);
 q:=ln[k];
 while q<>nil do
  begin
  if (min+q^.vi<p[wh[q^.id]])and(f[q^.id]<=c)and(pass[q^.id]=false) then
    begin
    p[wh[q^.id]]:=min+q^.vi;
    usort(wh[q^.id]);
    end;
  q:=q^.next;
  end;
 end;
end;

procedure sort(i,j:longint);
var x,y,z:longint;
begin
x:=i;y:=j;z:=f[id[(x+y)shr 1]];
repeat
while z<f[id[y]] do dec(y);
while z>f[id[x]] do inc(x);
if x<=y then
begin
id[0]:=id[x];
id[x]:=id[y];
id[y]:=id[0];
inc(x);dec(y);
end;
until x>y;
if x<j then sort(x,j);
if i<y then sort(i,y);
end;

begin
assign(input,'cost.in');reset(input);
assign(output,'cost.out');rewrite(output);
readln(n,m,a,b,s);

for i:=1 to n do
begin
readln(f[i]);
id[i]:=i;
end;

sort(1,n);
for i:=1 to m do
 begin
 readln(x,y,z);
 new(q);
 q^.id:=y;q^.vi:=z;q^.next:=ln[x];ln[x]:=q;
 new(q);
 q^.id:=x;q^.vi:=z;q^.next:=ln[y];ln[y]:=q;
 end;

t:=1;
w:=n;
mi:=(t+w)shr 1;
ans:=-1;
repeat
for i:=1 to n do
 begin
 o[i]:=i;
 p[i]:=s+1;
 wh[i]:=i;
 end;
go(f[id[mi]]);
if (f[id[mi]]>=f[a])
and(f[id[mi]]>=f[b])and(p[wh[b]]<=s) then
begin
ans:=f[id[mi]];
w:=mi-1;
end
else t:=mi+1;
mi:=(t+w)shr 1;
until t>w;

writeln(ans);
close(output);
end.
