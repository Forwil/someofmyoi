program sms;
type link=^df;
 df=record
 id:integer;
 next:link;
 end;
 linkk=^dff;
 dff=record
 id:qword;
 next:linkk;
 end;
const maxn=500000;
var bfs:array[0..maxn]of longint;
    p:array[0..50000]of boolean;
    father:array[1..50000]of longint;
    ind:array[0..50000]of qword;
    lin:array[0..50000]of linkk;
    ln:array[1..50000]of link;
   nn,t,w,i,j,k,n,m:longint; q:link;  ans:real;
   s1,s2:qword;    qq,q1:linkk;
function cost(a,b:qword):real;
var s1,s2:qword;
begin
s1:=a div 100000000;
s2:=b div 100000000;
if (s1=134)or(s1=135)or(s1=136)or(s1=137)or(s1=138)or(s1=139) then
 if (s2=134)or(s2=135)or(s2=136)or(s2=137)or(s2=138)or(s2=139) then
   exit(0.1)
 else
   exit(0.15)
 else
 exit(0);
end;
procedure kuaipai(i,j:longint);
var x,y:longint;
  st:qword;
begin
x:=i;y:=j;
st:=ind[(x+y)shr 1];
repeat
 while st<ind[y] do dec(y);
 while st>ind[x] do inc(x);
 if x<=y then
 begin
 ind[0]:=ind[x];
 ind[x]:=ind[y];
 ind[y]:=ind[0];
 lin[0]:=lin[x];
 lin[x]:=lin[y];
 lin[y]:=lin[0];
 dec(y);inc(x);
 end;
until x>y;
if x<j then kuaipai(x,j);
if i<y then kuaipai(i,y);
end;
function po(s:qword):longint;
var t,w,mi:longint;
begin
t:=1;
w:=n;
mi:=(t+w)shr 1;
repeat
 if s<ind[mi]  then w:=mi-1
 else
 if s>ind[mi]  then t:=mi+1
 else
 if s=ind[mi] then exit(mi);
 mi:=(t+w) shr 1;
until t>w;
exit(0);
end;
begin
assign(input,'sms.in');
reset(input);
assign(output,'sms.out');
rewrite(output);
readln(n,m);
for i:=1 to n do
 begin
  read(s2);
  ind[i]:=s2;
  read(s2);
  while s2<>0 do
  begin
   new(qq);
   qq^.id:=s2;
   qq^.next:=lin[i];
   lin[i]:=qq;
   read(s2);
  end;
 end;
 kuaipai(1,n);
 nn:=n;
for i:=1 to n do
begin
 qq:=lin[i];
 while qq<>nil do
  begin
  if po(qq^.id)=0 then
  begin
   inc(nn);
   ind[nn]:=qq^.id;
  end;
  qq:=qq^.next;
  end;
end;
n:=nn;
kuaipai(1,n);
for i:=1 to n do
 begin
  qq:=lin[i];
  q1:=lin[i];
   while qq<>nil do
   begin
   new(q);
   q^.id:=po(qq^.id);
   q^.next:=ln[i];
   ln[i]:=q;
   qq:=qq^.next;
   dispose(q1);
   q1:=qq;
   end;
 end;
for i:=1 to m do
begin
 read(s1);
 t:=0;
 w:=1;
 bfs[1]:=po(s1);
fillchar(p,sizeof(p),true);
fillchar(father,sizeof(father),0);
repeat
  t:=t+1;
  if t>maxn then t:=1;
  q:=ln[bfs[t]];
 if p[bfs[t]] then
  while q<>nil do
   begin
    if father[bfs[t]]<>q^.id then
     begin
     ans:=ans+cost(ind[bfs[t]],ind[q^.id]);
   if father[q^.id]=0 then
    father[q^.id]:=bfs[t];
   if p[q^.id]=true then
   begin
     w:=w+1;
     if w>maxn then w:=1;
     bfs[w]:=q^.id;
    end;
     end;
    q:=q^.next;
   p[bfs[t]]:=false;
   end;
until t=w;
end;
writeln(ans:0:2);
close(output);
end.
