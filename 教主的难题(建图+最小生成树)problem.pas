program problem;
var
   pass:array[0..99999]of longint;
      z:array[0..99999]of longint;
    dat:array[0..6]of longint;
      f:Array[0..99999]of longint;
      p:array[0..300000,1..3]of longint;
  ans,y,t,w,i,j,k,n,m,x,mlen,tot,a,b,c:longint;
   s,ss:string;
   ch:char;
procedure sort(i,j:longint);
var x,y,z:longint;
begin
x:=i;y:=j;z:=p[(x+Y)shr 1,3];
repeat
while z<p[y,3] do dec(y);
while z>p[x,3] do inc(x);
if x<=y then
begin
p[0]:=p[x];p[x]:=p[y];p[y]:=p[0];
inc(x);dec(y);
end;
until x>y;
if i<y then sort(i,y);
if x<j then sort(x,j);
end;

function get(x:longint):longint;
begin
if f[x]=x then exit(x)
else
begin
f[x]:=get(f[x]);
exit(f[x]);
end;
end;
function getf(s:string;i:integer):char;
begin
if i=0 then exit(s[length(s)])
else exit(s[i]);
end;
function geth(s:string;i:integer):char;
begin
if i=length(s) then exit(s[1])
else exit(s[i+1]);
end;
begin
assign(input,'problem.in');reset(input);
assign(output,'problem.out');rewrite(output);
readln(n);
for i:=1 to n do
begin
read(dat[i]);
if trunc(ln(dat[i])/ln(10))+1>mlen then
 mlen:=trunc(ln(dat[i])/ln(10))+1;
z[i]:=dat[i];
pass[dat[i]]:=i;
if i>1 then
 begin
 p[i-1,1]:=i-1;
 p[i-1,2]:=i;
 end;
end;
t:=0;
w:=n;
tot:=n-1;
repeat
t:=t+1;
str(z[t],s);

 for i:=1 to length(s)do
 for j:=i+1 to length(s) do
 if s[i]<>s[j] then
 begin
 ss:=s;
 ch:=ss[i];ss[i]:=ss[j];ss[j]:=ch;
 b:=ord(ss[i])-48;
 c:=ord(ss[j])-48;
 val(ss,x,k);
 if pass[x]=0 then
  begin
   w:=w+1;
   z[w]:=x;
   pass[x]:=w;
  end;
   tot:=tot+1;
   p[tot,1]:=t;
   p[tot,2]:=pass[x];
   p[tot,3]:=((b and c)+(b xor c))*2;
 end;

 if length(s)>1 then
 for i:=1 to length(s) do
 if (s[i]>=s[(i-2+length(s))mod length(s)+1])and
    (s[i]<=s[i mod length(s)+1])then
 begin
 ss:=s;
 a:=ord(s[i])-48;
 b:=ord(s[(i-2+length(s))mod length(s)+1])-48;
 c:=ord(s[i mod length(s)+1])-48;
 delete(ss,i,1);
 val(ss,x,k);
 if pass[x]=0 then
  begin
   w:=w+1;
   z[w]:=x;
   pass[x]:=w;
  end;
   tot:=tot+1;
   p[tot,1]:=t;
   p[tot,2]:=pass[x];
   p[tot,3]:=a+(b and c)+(b xor c);
 end;

 if length(s)<mlen then
 for i:=0 to length(s) do
      if getf(s,i)<=geth(s,i) then
 for ch:=getf(s,i)to geth(s,i) do
 begin
 ss:=s;
 insert(ch,ss,i+1);
 a:=ord(ch)-48;
 b:=ord(s[(i-1+length(s))mod length(s)+1 ])-48;
 c:=ord(s[i mod length(s)+1])-48;
 val(ss,x,k);
 if pass[x]=0 then
  begin
   w:=w+1;
   z[w]:=x;
   pass[x]:=w;
  end;
   tot:=tot+1;
   p[tot,1]:=t;
   p[tot,2]:=pass[x];
   p[tot,3]:=a+(b and c)+(b xor c);
  end;
until t>=w;

sort(1,tot);
for i:=1 to w do f[i]:=i;
t:=0;
for i:=1 to tot do
 begin
 x:=get(p[i,1]);y:=get(p[i,2]);
 if x<>y then
  begin
  f[x]:=y;
  ans:=ans+p[i,3];
  t:=t+1;
//  if t=w-1 then break;
  end;
 end;

writeln(ans);
close(output);
end.
