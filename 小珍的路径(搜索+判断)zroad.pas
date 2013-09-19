program zroad;
type link=^dfd;
  dfd=record
  id,vi:longint;
  next:link;
  end;
var ln:Array[0..30]of link;
    dat:Array[0..30]of longint;
    pass:array[0..30]of boolean;
 min,max,x,y,z,i,j,k,n,m,t,nn,long,lt:longint;
 ans:string;
 a,b:array[0..50]of integer;
 q:link;
 can,yes:boolean;
procedure go(x,tot,step:longint;path:string);
var q:link;
    c:boolean;
begin
q:=ln[x];
pass[x]:=true;
c:=true;
while q<>nil do
 begin
 if (not pass[q^.id])and(tot+q^.vi<=t) then
 begin
 go(q^.id,tot+q^.vi,step+1,path+chr(65+dat[q^.id]));
 c:=false;
 end;
 q:=q^.next;
 end;
pass[x]:=false;

if c  then
 begin
 if step>long then long:=step;
 if (step mod 2=0)and(step>lt) then
 begin
 lt:=step;
 ans:=path;
 end;
 if (step mod 2=0)and(step=lt)and(path<ans)then ans:=path;
 end;

end;
begin
assign(input,'zroad.in');reset(input);
assign(output,'zroad.out');rewrite(output);
readln(n,m,t);
for i:=1 to n do
read(dat[i]);
for i:=1 to m do
 begin
 readln(x,y,z);
 new(q);
 q^.id:=y;q^.vi:=z;q^.next:=ln[x];ln[x]:=q;
 end;
go(1,0,1,chr(65+dat[1]));
writeln(long);
min:=maxlongint;
nn:=length(ans);
for i:=1 to nn do
begin
b[i]:=ord(ans[i])-65;
if b[i]>max then max:=b[i];
if b[i]<min then min:=b[i];
end;
for i:=1 to nn do
 write(b[i],' ');
writeln;

for i:=max to 200+min do
begin
a:=b;
can:=true;
for j:=1 to nn do
if a[j]<=i then
 begin
 a[j mod nn+1]:=a[j mod nn+1]+i-a[j];
 a[j]:=i;
 end
else begin can:=false;break;end;
if (can)and(a[1]=i) then
 begin
 yes:=true;
 break;
 end;
end;
if yes then writeln('YES')
ELSE WRITELN('NO');
close(output);
end.
