program wg2;
type link=^dfdf;
 dfdf=record
 id:integer;
 next:link;
 end;
var    ln:Array[0..1001]of link;
 ans,time:array[0..1001]of longint;
     pass:array[0..1001]of boolean;
    i,j,k,n,m,f,min:longint;
    q:link;
procedure go(x:longint);
var q:link;
    z:array[0..1001]of integer;
    t,i:integer;
 procedure sort(i,j:longint);
 var x,y,zz:longint;
 begin
 x:=i;y:=j;zz:=z[(x+y)shr 1];
 repeat
 while zz<z[y] do dec(y);while zz>z[x] do inc(x);
 if x<=y then
 begin z[0]:=z[x];z[x]:=z[y];z[y]:=z[0];inc(x);dec(y);end;
 until x>y;
 if i<y then sort(i,y);
 if x<j then sort(x,j);
 end;

begin
pass[x]:=true;
q:=ln[x];
t:=0;
while q<>nil do
 begin
  if not(pass[q^.id]) then
     begin
     go(q^.id);
     t:=t+1;
     z[t]:=time[q^.id]+1;
     end;
 q:=q^.next;
 end;
if t<>0 then sort(1,t);
for i:=1 to t do
 if z[i]+t-i>time[x] then
  time[x]:=z[i]+t-i;
end;
begin
assign(input,'virus.in');reset(input);
assign(output,'virus.out');rewrite(output);
readln(n);
for i:=2 to n do
 begin
 readln(f);
 new(q);
 q^.id:=i;q^.next:=ln[f];ln[f]:=q;
 new(q);
 q^.id:=f;q^.next:=ln[i];ln[i]:=q;
 end;

for i:=1 to n do
 begin
 fillchar(time,sizeof(time),0);
 fillchar(pass,sizeof(pass),false);
 go(i);
 ans[i]:=time[i];
 end;
 min:=maxlongint;
for i:=1 to n do
if min>ans[i] then min:=ans[i];
writeln(min+1);
for i:=1 to n do
if ans[i]=min then write(i,' ');
close(output);
end.
