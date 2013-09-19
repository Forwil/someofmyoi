program square;
var i,j,k,n:longint;
   s:ansistring;
begin
assign(input,'square.in');reset(input);
assign(output,'square.out');rewrite(output);
readln(n);
for i:=1 to n do
 begin
 write('*');
 if i<>n then write(' ')
 else writeln(' ');
 end;
 s:=s+'*';
for i:=1 to n*2-3 do s:=s+' ';
 s:=s+'*';

for i:=1 to n-2 do
 writeln(s);

if n<>1 then
for i:=1 to n do
 begin
 write('*');
 if i<>n then write(' ')
 else writeln(' ');
 end;
close(output);
end.
