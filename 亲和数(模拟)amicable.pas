program amicable;
var i,j,k,n,m,a,b,tot:longint;
function can(x:longint):boolean;
var i,j,z:longint;
begin
z:=1;
 for i:=2 to trunc(sqrt(x)) do
 if x mod i=0 then
  begin
   z:=z+i;
   if i*i<>x then z:=z+ x div i;
  end;
if z<=x then exit(false);
j:=1;
 for i:=2 to trunc(sqrt(z))do
  if z mod i=0 then
   begin
   j:=j+i;
   if i*i<>z then j:=j+ z div i;
   if j>x then exit(false);
   end;
if j=x then exit(true)
else exit(false);
end;
begin
assign(input,'amicable.in');reset(input);
assign(output,'amicable.out');rewrite(output);
readln(a,b);
for i:=a to b do
if can(i) then inc(tot);
writeln(tot);
close(output);
end.