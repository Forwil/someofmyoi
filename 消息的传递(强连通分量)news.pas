program news;
type link=^dfdf;
dfdf=record
id:integer;
next:link;
end;
var ln:array[0..1001]of link;
     b:array[0..1001]of boolean;
     t,x,y,min,ans,i,j,k,n,m:longint;
     p:array[0..1001]of integer;
     f:array[0..1001]of integer;
     q:link;
function get(x:longint):longint;
begin
if p[x]=x then exit(x)
else
begin
p[x]:=get(p[x]);
exit(p[x]);
end;
end;

procedure go(x,i:longint);
var q:link;
o,m:longint;
begin
q:=ln[x];
b[x]:=false;
if p[x]<>x then exit;
o:=get(x);
m:=get(i);
p[o]:=m;
while q<>nil do
 begin
 if b[q^.id] then
    go(q^.id,i);
 q:=q^.next;
 end;
end;

begin
assign(input,'news.in');reset(input);
assign(output,'news.out');rewrite(output);
readln(n);
for i:=1 to n do
for j:=1 to n do
 begin
  read(k);
  if k=1 then
   begin
   new(q);
   q^.id:=j;
   q^.next:=ln[i];
   ln[i]:=q;
   inc(f[j]);
   end;
  if j=n then readln;
 end;
for i:=1 to n do p[i]:=i;
for i:=1 to n do
if f[i]=0 then
begin
fillchar(b,sizeof(b),true);
go(i,i);
end;
for i:=1 to n do
if f[i]<>0 then
begin
fillchar(b,sizeof(b),true);
go(i,i);
end;

fillchar(b,sizeof(b),false);

for i:=1 to n do
begin
x:=get(i);
b[x]:=true;
end;
for i:=1 to n do
if b[i]=true then inc(ans);
writeln(ans);
close(output);
end.
