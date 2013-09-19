program arrange1;
type link=^dfdf;
dfdf=record
id:integer;
next:link;
end;
var z,tot,i,j,k,n,m,now:longint;
    zt:array[0..1024]of longint;
    tt:array[0..1024]of integer;
    ln:array[0..1024]of link;
    dp:array[0..1,0..1024,0..21]of qword;
    l,x,y:qword;
    q:link;

function gys(a,b:qword):qword;
begin
if a mod b=0 then exit(b)
else exit(gys(b,a mod b));
end;

procedure go(x,z,now:longint);
begin
if x>m then
 begin
 tot:=tot+1;
 zt[tot]:=now;
 tt[tot]:=z;
 exit;
 end;

if z<=k then
 begin
 go(x+1,z,now);
 go(x+2,z+1,now or (1 shl(m-x)));
 end;
end;

function com(a,b:longint):qword;
var z:qword;
  i,j:longint;
  bb:array[0..20]of boolean;
begin
fillchar(bb,sizeof(bb),true);
z:=1;
for i:=a downto a-b+1 do
 begin
  z:=z*i;
  for j:=1 to b do
   if (z mod j=0)and(bb[j]) then
    begin
    z:=z div j;
    bb[j]:=false;
    end;
 end;
exit(z);
end;

begin
//assign(input,'arrange.in');reset(input);
//assign(output,'arrange.out');rewrite(output);
readln(n,m,k);
if m>n then
begin
n:=n+m;
m:=n-m;
n:=n-m;
end;
go(1,0,0);
for i:=1 to tot do
for j:=1 to tot do
if zt[i] and zt[j]=0 then
begin
new(q);q^.id:=i;q^.next:=ln[j];ln[j]:=q;
end;

for i:=1 to tot do
 dp[1,i,tt[i]]:=1;

for i:=2 to n do
begin
now:=i and 1;
fillchar(dp[now],sizeof(dp[now]),0);
for j:=1 to tot do
  begin
  q:=ln[j];
  while q<>nil do
    begin
    for z:=0 to k-tt[j] do
   inc(dp[now,j,z+tt[j]],dp[1-now,q^.id,z]);
    q:=q^.next;
    end;
  end;
end;

 l:=0;
 for i:=1 to tot do
 l:=l+dp[n and 1,i,k];
 if l<>0 then
 begin
 x:=com(n*m,k);
 y:=gys(x,l);
 writeln(x div y,'/',l div y);
 end
else writeln('Impossible!');
 close(output);
end.
