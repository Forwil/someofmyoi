program lamp;
var mi,x,y,s,s1,s2,s3,t,w:string;
   tot,i,j,k,n:longint;
   xx,yy,ss:real;
procedure chen(s1,s2:string;var s3:string);
var a:array[0..255]of 0..9;
    b:array[0..255]of 0..9;
    c:array[0..1000]of longint;
    i,j,len:longint;
begin
fillchar(c,sizeof(c),0);
for i:=1 to length(s1) do
 a[length(s1)-i+1]:=ord(s1[i])-48;
for i:=1 to length(s2) do
 b[length(s2)-i+1]:=ord(s2[i])-48;
for i:=1 to length(s1) do
for j:=1 to length(s2) do
 c[i+j-1]:=c[i+j-1]+a[i]*b[j];
for i:=1 to length(s1)+length(s2) do
 begin
 c[i+1]:=c[i+1]+c[i] div 10;
 c[i]:=c[i] mod 10;
 end;
if c[length(s1)+length(s2)]>0 then len:=length(s1)+length(s2)
else len:=length(s1)+length(s2)-1;
 s3:='';
for i:=1 to len do
 s3:=chr(c[i]+48)+s3;
end;
procedure chu2(s1:string;var s2:string);
var x,y,j,i:longint;
  s3,s4,ss:string;
begin
s4:='';
ss:='';
repeat
  s1:=ss+s1;
 s3:=copy(s1,1,2);
 delete(s1,1,2);
 val(s3,i,j);
 x:=i div 2;
 str(x,ss);
 s4:=s4+ss;
 x:=i mod 2;
 str(x,ss);
until s1='';
s2:=s4;
end;
procedure jia(s1,s2:string;var s3:string);
var x,y,jin,l1,l2,l3:longint;
begin
l1:=length(s1);
l2:=length(s2);
jin:=0;
if l1>l2 then l3:=l1
else l3:=l2;
s3:='';
for i:=1 to l3 do
 begin
 x:=0;y:=0;
 if l1>0 then
   begin
    x:=ord(s1[l1])-48;
    l1:=l1-1;
    end;
 if l2>0 then
  begin
  y:=ord(s2[l2])-48;
  l2:=l2-1;
  end;
s3:=chr((x+y+jin) mod 10+48)+s3;
jin:=(x+y+jin)div 10;
end;
if jin<>0 then s3:='1'+s3;
end;
function big(a,b:string):boolean;
begin
if length(a)>length(b) then exit(true)
else
if (length(a)=length(b))and(a>b) then exit(true)
else exit(false);
end;
procedure jian1(s1:string;var s2:string);
var i:longint;
can:boolean;
begin
can:=false;
i:=length(s1);
while not(can) do
if s1[i]<>'0' then
begin
 s1[i]:=chr(ord(s1[i])-1);
 can:=true;
end
else
begin
s1[i]:='9';
i:=i-1;
end;
s2:=s1;
end;
begin
assign(input,'lamp.in');reset(input);
assign(output,'lamp.out');rewrite(output);
readln(s);
t:='1';
w:=s;
jia(t,w,s1);
chu2(s1,mi);
chen(mi,mi,s3);
repeat
if big(s3,s) then jian1(mi,w)
else jia(mi,'1',t);
jia(t,w,s1);
chu2(s1,mi);
chen(mi,mi,s3);
until big(t,w);
write(mi);
close(output);
end.