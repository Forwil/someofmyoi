program sb;
type link=^dfsd;
 dfsd=record
 id:longint;
 next:link;
 end;
var ln:array[0..10001]of link;
    ans:Array[0..10001]of integer;
    b:array[0..10001]of boolean;
    p:array[0..10001,1..3]of integer;
    i,j,k,n,m,x,y,t:longint;
    q:link;
function max(a,b:longint):longint;
begin if a>b then max:=a else max:=b;end;
procedure go(x:longint);
var q:link;
m,mm,k:longint;
begin
q:=ln[x];
b[x]:=false;
mm:=0;
k:=0;
m:=0;
while q<>nil do
 begin
 if b[q^.id] then
 begin
 go(q^.id);
  if ans[q^.id]+1>mm then
     begin
      m:=mm;
      mm:=ans[q^.id]+1;
      k:=q^.id;
     end
   else
   if ans[q^.id]+1>m then  m:=ans[q^.id]+1;
 if ans[q^.id]+1>ans[x] then ans[x]:=ans[q^.id]+1;
 end;
 q:=q^.next;
 end;
p[x,1]:=mm;
p[x,2]:=k;
p[x,3]:=m;
end;
procedure dp(x,z:longint);
var q:link;
 m,mm,k,kk:longint;
begin
q:=ln[x];
b[x]:=false;
if z>ans[x] then ans[x]:=z;
q:=ln[x];
while q<>nil do
 begin
 if b[q^.id] then
  if q^.id=p[x,2] then
     dp(q^.id,max(z,p[x,3])+1)
     else
     dp(q^.id,max(z,p[x,1])+1);
 q:=q^.next;
 end;
end;
begin
assign(input,'sb.in');reset(input);
assign(output,'sb.out');rewrite(output);
readln(n);
for i:=1 to n-1 do
 begin
 readln(x,y);
 new(q);
 q^.id:=x;
 q^.next:=ln[y];
 ln[y]:=q;
 new(q);
 q^.id:=y;
 q^.next:=ln[x];
 ln[x]:=q;
 end;
 fillchar(b,sizeof(b),true);
 go(1);
 fillchar(b,sizeof(b),true);
 dp(1,0);
 for i:=1 to n do
 writeln(ans[i]);
 close(output);
end.
