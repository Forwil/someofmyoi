program park;
type link=^dfdf;
  dfdf=record
  l,r,min:longint;
  lson,rson:link;
  end;
var ans,a:array[0..100001]of longint;
    x,mv,t,w,i,j,k,n,m:longint;
    h,q:link;
function min(a,b:longint):longint;
begin if a<B then min:=a else min:=b;end;

procedure build(l,r:longint;q:link);
var p:link;
   mi:longint;
begin
q^.l:=l;
q^.r:=r;
q^.min:=maxlongint shr 1;
if l=r then exit;
mi:=(l+r)shr 1;
new(p);
q^.lson:=p;
build(l,mi,p);
new(p);
q^.rson:=p;
build(mi+1,r,p);
end;

function find(l,r:longint;q:link):longint;
var mi:longint;
begin
if (l=q^.l)and(r=q^.r) then exit(q^.min);
mi:=(q^.l+q^.r)shr 1;
if r<=mi then exit(find(l,r,q^.lson));
if l>=mi+1 then exit(find(l,r,q^.rson));
exit(min(find(l,mi,q^.lson),find(mi+1,r,q^.rson)));
end;


procedure init(x,vi:longint;q:link);
begin
if (q^.l=q^.r)and(q^.l=x) then
 begin
 q^.min:=vi;
 exit;
 end
else

if x<=(q^.l+q^.r)shr 1 then
 begin
 init(x,vi,q^.lson);
 if vi<q^.min then q^.min:=vi;
 end
else
begin
 init(x,vi,q^.rson);
 if vi<q^.min then q^.min:=vi;
 end;
end;

begin
assign(input,'park.in');reset(input);
assign(output,'park.out');rewrite(output);
readln(n,m);
new(q);
h:=q;
build(1,n,q);

for i:=1 to n do read(a[i]);

for i:=n downto 1 do
 begin
 if a[i]+i>n then ans[i]:=1
 else
  ans[i]:=find(i+1,a[i]+i,h)+1;
 init(i,ans[i],h);
 end;

 mv:=ans[1];
for i:=2 to n do
begin
ans[i]:=min(ans[i],mv+1);
mv:=min(ans[i],mv);
end;

for i:=1 to m do
begin
read(x);
if i<>m then write(ans[x],' ')
else writeln(ans[x]);
end;
close(output);
end.
