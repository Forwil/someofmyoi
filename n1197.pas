program n1197;
const pp=450001;
var ha:array[0..pp]of longint;
    z:array[0..450000]of longint;
    s:array[0..450000]of longint;
    n,x,t,w,i,j,k,o:longint;
    ch:char;
    find:boolean;
function hash(x:longint):boolean;
var i:longint;
begin
i:=0;
while (ha[(x+i) mod pp]<>0)and(ha[(x+i) mod pp]<>x) do
 inc(i);
if ha[(x+i) mod pp]=x then exit(false);
if ha[(x+i) mod pp]=0 then
 ha[(x+i) mod pp]:=x;
 exit(true);
end;
begin
w:=1;
t:=0;
z[1]:=(1 shl 25)-1;
repeat
t:=t+1;
if s[t]>=6 then break;
 for i:=1 to 5 do
 for j:=1 to 5 do
  begin
  z[0]:=z[t];
  z[0]:=z[0] xor (1 shl ((i-1)*5+j-1));
  if j+1<=5 then
  z[0]:=z[0] xor (1 shl ((i-1)*5+j+1-1));
  if j-1>=1 then
  z[0]:=z[0] xor (1 shl ((i-1)*5+j-1-1));
  if i-1>=1 then
  z[0]:=z[0] xor (1 shl ((i-2)*5+j-1));
  if i+1<=5 then
  z[0]:=z[0] xor (1 shl ((i)*5+j-1));
  if hash(z[0]) then
   begin
   w:=w+1;
   z[w]:=z[0];
   s[w]:=s[t]+1;
   end;
  end;
until (t>=w);
readln(n);
for t:=1 to n do
begin
o:=0;
 for i:=1 to 5 do
 for j:=1 to 5 do
  begin
   read(ch);
   if ch='1' then o:=o+1 shl((i-1)*5+j-1);
   if j=5 then readln;
  end;
  readln;
  find:=false;
 for i:=0 to w do
   if z[i]=o then
   begin
   writeln(s[i]);
   find:=true;
   break;
   end;
if find=false then writeln(-1);
end;

end.
