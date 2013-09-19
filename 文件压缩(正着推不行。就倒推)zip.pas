program zip;
type link=^df;
  df=record
  id:longint;
  next:link;
  end;
var  a,b:array[0..10001]of integer;
      ln:array[0..500]of link;
   x,i,j,k,n,m,p:longint;
  ch:char;
  ans:ansistring;
  q:link;
procedure sort(i,j:longint);
var x,y,z:longint;
begin
x:=i;y:=j;z:=b[(x+y)shr 1];
repeat
while z<b[y] do dec(y);
while z>b[x] do inc(x);
if x<=y then
 begin
 b[0]:=b[x];
 b[x]:=b[y];
 b[y]:=b[0];
 inc(x);dec(y);
 end;
until x>y;
if x<j then sort(x,j);
if i<y then sort(i,y);
end;

begin
assign(input,'zip.in');reset(input);
assign(output,'zip.out');rewrite(output);
readln(n);
for i:=1 to n do
begin
read(ch);
a[i]:=ord(ch);
b[i]:=a[i];
end;
readln;
sort(1,n);
for i:=1 to n do
begin
new(q);
q^.id:=i;
q^.next:=ln[b[i]];
ln[b[i]]:=q;
end;
 readln(p);
 for i:=1 to n do
 if a[p]=b[i] then break;{找到头。并推出尾}
 p:=i;

 ans:=chr(a[p]);
for i:=1 to n-1 do
 begin
 x:=ln[a[p]]^.id;  {从尾往前推，才满足唯一性}
 ln[a[p]]:=ln[a[p]]^.next;
 p:=x;
 ans:=chr(a[p])+ans;
 end;
 writeln(ans);
close(output);
end.
