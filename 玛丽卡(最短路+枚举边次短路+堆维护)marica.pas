program marica;
type link=^dfdf;
  dfdf=record
  vi,id,b:longint;
  next:link;
  end;
var     p:Array[0..1001]of longint;
     pass:array[0..1001]of boolean;
       ln:array[0..1001]of link;
id,f,wh:array[0..1001]of integer;
   a:Array[0..50001]of longint;
 l,t,min,z,i,j,k,n,m,x,y,ans:longint;
  q:link;

procedure get(x:longint);
var q:link;
begin
if f[x]<>n then get(f[x]);
t:=t+1;
q:=ln[f[x]];
while q^.id<>x do q:=q^.next;
a[t]:=q^.b;
end;

procedure usort(i:integer);
var j:integer;
begin
j:=i div 2;
while j<>0 do
 begin
 if p[id[i]]<p[id[j]] then
  begin
  id[0]:=id[i];id[i]:=id[j];id[j]:=id[0];
  wh[id[i]]:=i;
  wh[id[j]]:=j;
  end
 else exit;
 i:=j;
 j:=i div 2;
 end;
end;

procedure dsort(i:integer);
var j:integer;
begin
j:=i*2;
while j<=n do
 begin
 if p[id[j+1]]<p[id[j]] then j:=j+1;
 if p[id[i]]>p[id[j]] then
  begin
  id[0]:=id[i];id[i]:=id[j];id[j]:=id[0];
  wh[id[i]]:=i;
  wh[id[j]]:=j;
  end
  else break;
 i:=j;
 j:=i*2;
 end;
end;

begin
assign(input,'marica.in');reset(input);
assign(output,'marica.out');rewrite(output);
readln(n,m);
for i:=1 to m do
 begin
 readln(x,y,z);
 new(q);
 q^.id:=y;q^.next:=ln[x];q^.vi:=z;q^.b:=i;ln[x]:=q;
 new(q);
 q^.id:=x;q^.next:=ln[y];q^.vi:=z;q^.b:=i;ln[y]:=q;
 end;
fillchar(p,sizeof(p),63);
q:=ln[n];
while q<>nil do
  begin
  p[q^.id]:=q^.vi;
  f[q^.id]:=n;
  q:=q^.next;
  end;

pass[n]:=true;
for i:=1 to n-1 do
 begin
 min:=maxlongint;
 k:=0;
  for j:=1 to n do
   if not(pass[j])and(p[j]<min) then
   begin
   min:=p[j];
   k:=j;
   end;
 pass[k]:=true;
 q:=ln[k];
 while q<>nil do
  begin
  if not(pass[q^.id])and(p[q^.id]>p[k]+q^.vi) then
   begin
   p[q^.id]:=p[k]+q^.vi;
   f[q^.id]:=k;
   end;
  q:=q^.next;
  end;
 if pass[1] then break;
 end;
get(1);

for l:=1 to t do
begin
for i:=1 to n do
 begin
 id[i]:=i;
 p[i]:=maxlongint shr 1;
 pass[i]:=false;
 wh[i]:=i;
 end;

p[n]:=0;
usort(n);
for i:=1 to n do
 begin
 min:=p[id[1]];
 k:=id[1];
 if k=1 then break;
 pass[k]:=true;
 p[id[1]]:=maxlongint shr 1;
 dsort(1);
 q:=ln[k];
 while q<>nil do
  begin
  if not(pass[q^.id])and(p[q^.id]>min+q^.vi)and(q^.b<>a[l]) then
   begin
   p[q^.id]:=min+q^.vi;
   usort(wh[q^.id]);
   end;
   q:=q^.next;
  end;
 end;
if p[1]>ans then ans:=p[1];
end;
writeln(ans);
close(output);
end.
