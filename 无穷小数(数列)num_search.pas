program num;
//nst biao=array[0..9,0..9]of longint=
const maxn=13;
var l:array[0..100]of longint;
   cc:array[0..100]of longint;
i,j,k,n,m,x,y,get,t,w,mi,tt,ww,mm:longint;     f:text;
can:boolean;
function pan:longint;
var i:longint;
begin
pan:=1;
for i:=1 to maxn do
 begin
 if l[i]<cc[i] then exit(3);
 if l[i]>cc[i] then exit(2);
 end;
end;
procedure go(x,y:longint);
var i,j:longint;
begin
for i:=0 to maxn do
 begin
 cc[i]:=x div y;
 x:=(x-cc[i]*y)*10;
 end;
end;
begin
assign(f,'biao.txt');rewrite(f);
for l[1]:=7 to 9 do
begin
x:=1;
y:=2;
for l[2]:=0 to 9 do
if (l[1] mod 2 =1)and(l[2] mod 2 =0) then
begin
for i:=3 to maxn do
 l[i]:=(l[i-1]+l[i-2])mod 4;
 repeat
 go(x,y);
 get:=pan;
 if get=1 then break;
 if get=2 then x:=x+1;
 if get=3 then y:=y+1;
 until false;
writeln(f,'if (i=',l[1],')and(j=',l[2],') then writeln(',x,',',y,'))');
writeln('if (i=',l[1],')and(j=',l[2],') then writeln(',x,',',y,'))');
end;
end;
close(f);
end.
