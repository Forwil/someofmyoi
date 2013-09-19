program secret;
const p=19920229;
type node=array[1..2,1..2]of int64;
var s:ansistring;
   f:array[1..2]of int64;
  x,y,i,j,k,n,m,a,b,c:longint;
  t,ss:node;
  q,h,ans:int64;
function get(x:longint):node;
var o:node;
    i,j,k:longint;
begin
if x=1 then exit(ss);
o:=get(x div 2);
fillchar(get,sizeof(get),0);
for i:=1 to 2 do
for j:=1 to 2 do
for k:=1 to 2 do
get[i,j]:=(get[i,j]+o[i,k]*o[k,j] mod p) mod p;
if odd(x)then
 begin
 fillchar(o,sizeof(o),0);
 for i:=1 to 2 do
 for j:=1 to 2 do
 for k:=1 to 2 do
 o[i,j]:=(o[i,j]+get[i,k]*ss[k,j] mod p)mod p;
 exit(o);
 end;
end;
begin
assign(input,'secret.in');reset(input);
readln(x,a,b,n,m);
ss[1,1]:=0;ss[1,2]:=a;
ss[2,1]:=1;ss[2,2]:=b;
t:=get(n);
for i:=1 to x do
 begin
 readln(s);
 c:=0;
 for j:=1 to length(s) do
   c:=c xor ord(s[j]);
 if i<=m then q:=(q+c)mod p
 else h:=(h+c) mod p;
 end;
 f[1]:=q;
 f[2]:=h;
 ans:=(f[1]*t[1,2] mod p+ f[2]*t[2,2] mod p) mod p;
 writeln(ans);
end.
