program d2;
var dt:array[0..101,0..101]of string;
    a:Array[0..101]of string;
     i,j,k,n,m:longint;
function jia(s1,s2:string):string;
var l1,l2,l3,x,y,i,jin:longint;
    s3:string;
begin
 l1:=length(s1);
 l2:=length(s2);
 if l1>l2 then l3:=l1
 else l3:=l2;
 jin:=0;
 s3:='';
 for i:=1 to l3 do
  begin
   x:=0;
   y:=0;
   if l1>0 then
     begin
     x:=ord(s1[l1])-48;
     l1:=l1-1;
     end;
  if l2> 0 then
     begin
     y:=ord(s2[l2])-48;
     l2:=l2-1;
     end;
 s3:=chr((x+y+jin)mod 10 +48)+s3;
 jin:=(x+y+jin)div 10;
 end;
 if jin<>0 then s3:='1'+s3;
 jia:=s3;
end;
function chen(s1:string;x:longint):string;
var c:array[0..256]of longint;
    a:array[0..256]of 0..9;
i,j,len:longint;
s3:string;
begin
fillchar(a,sizeof(a),0);
fillchar(c,sizeof(c),0);
for i:=1 to length(s1) do
 a[length(s1)-i+1]:=ord(s1[i])-48;
for i:=1 to length(s1) do
  c[i]:=a[i]*x;
for i:=1 to length(s1) do
  begin
  c[i+1]:=c[i+1]+c[i] div 10;
  c[i]:=c[i] mod 10;
  end;
  len:=length(s1);
while c[len+1]<>0 do
 begin
  c[len+2]:=c[len+2]+c[len+1] div 10;
  c[len+1]:=c[len+1] mod 10;
  len:=len+1;
 end;
 s3:='';
for i:=1 to len do
 s3:=chr(c[i]+48)+s3;
 chen:=s3;
end;
function chen2(s1,s2:string):string;
var a,b:array[0..255]of 0..9;
     c:array[0..255]of longint;
    i,j,len:longint;
    s3:string;
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
c[i+1]:=c[i+1]+c[i]div 10;
c[i]:=c[i] mod 10;
end;
if c[length(s1)+length(s2)]<>0 then len:=length(s1)+length(s2)
else len:=length(s1)+length(s2)-1;
s3:='';
for i:=1 to len do
s3:=chr(c[i]+48)+s3;
  chen2:=s3;
end;
begin
//assign(input,'d.in');reset(input);
//assign(output,'d.out');rewrite(output);
a[0]:='1';
for i:=1 to 100 do
a[i]:=chen(a[i-1],i);
readln(n,m);
n:=n-1;
for i:=0 to n do
for j:=0 to n do
dt[i,j]:='0';
for i:=0 to m do
dt[1,i]:='1';
for i:=2 to n do
 for j:=i to m do
   dt[i,j]:=jia(chen(dt[i,j-1],i),dt[i-1,j-1]);
writeln(chen2(dt[n,m],a[n]));
close(output);
end.