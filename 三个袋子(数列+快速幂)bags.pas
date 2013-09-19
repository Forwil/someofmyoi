program bags;
var i,j,k,n,m:longint;
  x:qword;
function get(x:qword):qword;
var l,r:qword;
begin
if x=1 then exit(3);
if x=0 then exit(1);
l:=get(x div 2)mod m;
r:=get(x mod 2)mod m;
exit((l*l)mod m*r);
end;
begin
assign(input,'bags.in');reset(input);
assign(output,'bags.out');rewrite(output);
readln(n,m);
m:=m*2;
x:=get(n-1);
writeln(((x+1)div 2)mod (m div 2));
close(output);
end.