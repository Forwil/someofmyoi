program migong;
const ax:array[1..4]of -1..1=(1,0,-1,0);
      ay:array[1..4]of -1..1=(0,1,0,-1);
type link=^dfd;
dfd=record
x,y:integer;
next:link;
end;
var dis:Array[0..101,0..101]of longint;
    tab:array[0..101,0..101]of char;
    z:array[0..10000,1..2]of longint;
    p:array[0..10000]of longint;
    b:array[0..101,0..101]of boolean;
    ln:array['A'..'Z']of link;
    ans,n,m,i,j,t,w,x,y:longint;
    q:link;
    mm:char;
   k,f,g:char;
   out:boolean;
begin
assign(input,'migong.in');reset(input);
assign(output,'migong.out');rewrite(output);
readln(n,m);
for i:=1 to n do
for j:=1 to m do
   begin
   read(tab[i,j]);
   if tab[i,j] in['A'..'Z'] then
    begin
    new(q);
    q^.x:=i;q^.y:=j;
    q^.next:=ln[tab[i,j]];
    ln[tab[i,j]]:=q;
    end;
   if j=m then readln;
   if tab[i,j]>mm then mm:=tab[i,j];
   end;
//---------------------------------------
for k:='A' to mm do
 begin
 fillchar(z,sizeof(z),0);
 fillchar(b,sizeof(b),false);
 for i:=1 to n do
 for j:=1 to m do
 begin
 b[i,j]:=true;
 if tab[i,j]='2' then b[i,j]:=false;
 end;
 f:=k;
 g:=succ(f);
if f=mm then g:='A';
 q:=ln[f];
w:=0;
t:=0;
while q<>nil do
 begin
  w:=w+1;
  z[w,1]:=q^.x;
  z[w,2]:=q^.y;
  p[w]:=dis[q^.x,q^.y];
  b[q^.x,q^.y]:=false;
  q:=q^.next;
 end;

repeat
t:=t+1;
 for i:=1 to 4 do
  begin
  x:=z[t,1]+ax[i];
  y:=z[t,2]+ay[i];
  if b[x,y] then
   begin
   b[x,y]:=false;
   w:=w+1;
   z[w,1]:=x;
   z[w,2]:=y;
   p[w]:=p[t]+1;
   if tab[x,y]=g then dis[x,y]:=p[w];
   end;
  end;
until t>=w;
q:=ln[g];
out:=true;
while q<>nil do
 begin
  out:=out and b[Q^.x,q^.y];
  q:=q^.next;
 end;
if out then
 begin
 writeln('Impossible');
 close(output);
 halt;
 end;
end;
//---------------------------------------------
q:=ln['A'];
ans:=maxlongint;
while q<>nil do
 begin
 if dis[q^.x,q^.y]<ans then ans:=dis[q^.x,q^.y];
 q:=q^.next;
 end;
 writeln(ans);
 close(output);
end.
