program lovelygf;
type link=^fdfd;
fdfd=record
id,vi:longint;
nexT:link;
end;
var
   ln:array[0..251]of link;
   dat:Array[0..251]of longint;
   i,j,k,m,n,x,y,z,ans:longint;
   q:link;
function min(a,b:longint):longint;
begin if a>b then min:=b else min:=a;end;
function try(ll:longint):longint;
var p:array[0..251]of longint;
   pass:array[0..251]of boolean;
   i,j,k,minn:longint;
   q:link;
begin
fillchar(pass,sizeof(pass),false);
for i:=1 to n do
p[i]:=dat[i];
pass[ll]:=true;
try:=0;
for i:=1 to n-1 do
 begin
   minn:=maxlongint;
    for j:=1 to n do
    if (pass[j]=false)and(p[j]<minn) then
     begin
     minn:=p[j];
     k:=j;
     end;
   pass[k]:=true;
  q:=ln[k];
 try:=try+minn;
 while q<>nil do
  begin
    if (q^.vi<p[q^.id])and(pass[q^.id]=false) then
     p[q^.id]:=q^.vi;
  q:=q^.next;
  end;
 end;
end;
begin
assign(input,'lovelygf.in');reset(input);
assign(output,'lovelygf.out');rewrite(output);
readln(n);
for i:=1 to n do
 read(dat[i]);
readln(m);
for i:=1 to m do
 begin
 readln(x,y,z);
 new(q);q^.id:=y;q^.vi:=z;q^.next:=ln[x];ln[x]:=q;
 new(q);q^.id:=x;q^.vi:=z;q^.nexT:=ln[y];ln[y]:=q;
 end;
 ans:=maxlongint;
for i:=1 to n do
ans:=min(ans,try(i));
writeln(ans);
close(output);
end.