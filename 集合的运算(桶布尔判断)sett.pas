program sett;
var a,b:Array[0..30000]of boolean;
   t,x,i,j,k,n,m:longint;
begin
assign(input,'sett.in');reset(input);
assign(output,'sett.out');rewrite(output);

while not eoln  do
 begin
 read(x);
 a[x]:=true;
 if x>m then m:=x;
 end;
readln;
while not eoln do
 begin
 read(x);
 b[x]:=true;
 if x>m then m:=x;
 end;

 t:=0;
for i:=1 to m do
if a[i] or b[i]then inc(t);
if t=0 then writeln(-1)
else
for i:=1 to m do
if a[i] or b[i]then
begin
t:=t-1;
if t<>0 then write(i,' ')
else writeln(i);
end;

t:=0;
for i:=1 to m do
if a[i] and not b[i] then inc(t);
if t=0 then writeln(-1)
else
for i:=1 to m do
if a[i] and not b[i] then
begin
t:=t-1;
if t<>0 then write(i,' ')
else writeln(i);
end;

T:=0;
for i:=1 to m do
if a[i] and b[i] then inc(t);
if t=0 then writeln(-1)
else
for i:=1 to m do
if a[i] and b[i] then
begin
t:=t-1;
if t<>0 then write(i,' ')
else writeln(i);
end;

t:=0;
for i:=1 to m do
if a[i] xor b[i]then inc(t);
if t=0 then writeln(-1)
else
for i:=1 to m do
if a[i] xor b[i] then
begin
t:=t-1;
if t<>0 then write(i,' ')
else writeln(i);
end;

close(output);
end.