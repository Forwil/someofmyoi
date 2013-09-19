program royal;
type link=^dfdf;
dfdf=record
id:longint;
next:link;
end;
var  ln:array[0..1001]of link;
     t,f,s:array[0..1001]of longint;
  pass:array[0..1001]of boolean;
  i,j,k,n,m,b,x,y,tot:longint;
  q:link;
procedure out(x:longint);
var i:longint;
begin
k:=k+1;
for i:=1 to n do
if s[i]=0 then s[i]:=k;
f[k]:=x;
writeln(k);
for i:=1 to n do
begin
if i<n then write(s[i],' ')
else writeln(s[n]);
end;
for i:=1 to k do
begin
if i<k then write(f[i],' ')
else writeln(f[k]);
end;
close(output);
halt;
end;

procedure doit(x,d,f:longint);
var q:link;
begin
if s[x]<>0 then exit;
s[x]:=d;
tot:=tot+1;
q:=ln[x];
while q<>nil do
 begin
 if q^.id<>f then doit(q^.id,d,f);
 q:=q^.next;
 end;
end;

procedure go(x:longint);
var q,qq,qqq:link;
 z:longint;
begin
q:=ln[x];
pass[x]:=true;
t[x]:=1;
while q<>nil do
begin
 if pass[q^.id]=false then
 begin
 go(q^.id);
 if t[q^.id]>=b then
  begin
  k:=k+1;
  f[k]:=q^.id;
  doit(Q^.id,k,x);
  t[q^.id]:=0;
  end;
  t[x]:=t[x]+t[q^.id];
  if n-tot<=3*b then out(x);
 end;
q:=q^.next;
end;
q:=ln[x];
z:=0;
if t[x]>3*b then
begin
 while z<b do
  begin
  z:=z+t[q^.id];
  q:=q^.next;
  end;
 qq:=ln[x];
 k:=k+1;
 f[k]:=x;
while qq<>q do
  begin
  doit(qq^.id,k,x);
  qq:=qq^.next;
  end;
  t[x]:=t[x]-z;
end;
if n-tot<=3*b then out(x);
end;
begin
assign(input,'royal.in');reset(input);
assign(output,'royal.out');rewrite(output);
readln(n,b);
for i:=1 to n-1 do
 begin
 readln(x,y);
 new(q);
 q^.id:=y;q^.next:=ln[x];ln[x]:=q;
 new(q);
 q^.id:=x;q^.next:=ln[y];ln[y]:=q;
 end;
go(1);
end.
