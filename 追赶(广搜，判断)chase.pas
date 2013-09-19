program chase;
type link=^dfdf;
dfdf=record
id:longint;
next:link;
end;
var a,b,f:array[0..3001]of longint;
    ln:array[0..3001]of link;
    pass:array[0..3001]of boolean;
    z:array[0..3001]of integer;
  t,w,i,j,k,n,m,st,en,x,y:longint;
  q:link;
begin
assign(input,'chase.in');reset(input);
assign(output,'chase.out');rewrite(output);
readln(n,m,st,en);
for i:=1 to m do
 begin
 readln(x,y);
 new(q);
 q^.id:=x;q^.next:=ln[y];ln[y]:=q;
 new(q);
 q^.id:=y;Q^.next:=ln[x];ln[x]:=q;
 inc(f[x]);inc(f[y]);
 end;
//---------------------------------------
t:=0;
w:=1;
z[w]:=st;
pass[st]:=true;
repeat
t:=t+1;
q:=ln[z[t]];
while q<>nil do
 begin
 if pass[q^.id]=false then
   begin
   w:=w+1;
   z[w]:=q^.id;
   a[q^.id]:=a[z[t]]+1;
   pass[q^.id]:=true;
   end;
 q:=q^.next;
 end;
until t>=w;
//---------------------------------------
fillchar(pass,sizeof(pass),false);
t:=0;
w:=1;
z[w]:=en;
pass[en]:=true;
repeat
t:=t+1;
q:=ln[z[t]];
while q<>nil do
 begin
 if pass[q^.id]=false then
   begin
   w:=w+1;
   z[w]:=q^.id;
   b[q^.id]:=b[z[t]]+1;
   pass[q^.id]:=true;
   end;
 q:=q^.next;
 end;
until t>=w;
//-------------------------------------------
fillchar(pass,sizeof(pass),false);
for i:=1 to n do
 begin
 k:=0;
  for j:=1 to n do
   if (f[j]<=1)and(not(pass[j]))then
     begin
     k:=j;
     break;
     end;
 pass[k]:=true;
 q:=ln[k];
 while q<>nil do
  begin
  dec(f[q^.id]);
  q:=q^.next;
  end;
 end;

for i:=1 to n do
if (pass[i]=false)and(a[i]<b[i]) then
 begin
 writeln('NO');
 CLOsE(output);
 halt;
 end;
 m:=0;
for i:=1 to n do
 if (a[i]<b[i])and(b[i]>m) then m:=b[i];
 writeln(m);
 close(output);
end.