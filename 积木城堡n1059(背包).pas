program n1059;
var b,a:array[0..10001]of boolean;
    mm,s,x,i,j,k,m,n:longint;
begin
assign(input,'a.in');reset(input);
readln(n);
fillchar(a,sizeof(a),true);
mm:=maxlongint;
for i:=1 to n do
begin
read(x);
fillchar(b,sizeof(b),false);
s:=0;
b[0]:=true;
 while x<>-1 do
  begin
   for j:=s downto 0 do
   begin
   if b[j] then b[j+x]:=true;
   if j+x>s then s:=j+x;
   end;
   read(x);
  end;

if s>m then m:=s;
if s<mm then mm:=s;
for j:=m downto 0 do
 a[j]:=b[j] and a[j];
end;
for i:=mm downto 0 do
if a[i] then
begin
writeln(i);
break;
end;
end.
