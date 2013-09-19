program robot2;
var tot,n,a,t,i,j:longint;
    b,bb:boolean;
begin
assign(input,'robot2.in');reset(input);

assign(output,'robot2.out');
rewrite(output);

readln(t);
for i:=1 to t do
begin
  read(n);
  tot:=0;
  read(a);
  b:=true;
  for j:=2 to n do
  begin
  read(a);
  if a mod 2=0 then
    if b=true then bb:=false
    else bb:=true;
  if a mod 2<>0 then
    bb:=true;
  b:=bb;
  end;
  readln;
  if bb=true then writeln('yes')
  else writeln('no');
end;
close(output);
end.
