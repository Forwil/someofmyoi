program shorten;
var a:longint;
   x,t,i,j,k,n,m,l:longint;
   ch:char;
begin
assign(input,'shorten.in');
reset(input);
assign(output,'shorten.out');rewrite(output);
readln(n,m);
for i:=1 to  n do
 begin
  read(ch);
  if i mod 72=0 then begin
               readln;
               end;
  if ch='(' then inc(a);
  if ch=')' then dec(a);
  if ch=']' then dec(a);
  if a<0 then break;
 end;
if a>=0 then
 begin
 writeln(1);
 for i:=1 to m-1 do
  writeln(1);
  writeln(a+1);
 end
else writeln(0);
close(output);
end.
