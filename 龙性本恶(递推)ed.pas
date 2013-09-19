program ed;
var f,ff:array[0..3]of double;
  z,bf,sf:real;
  i,j,k,n,m:longint;
begin
assign(input,'ed.in');reset(input);
assign(output,'ed.out');rewrite(output);
 f[1]:=0;
 f[2]:=1;
 f[3]:=0;
 readln(n);
if n<=21 then
  begin
  for i:=1 to n do
   begin
   ff[1]:=f[1]*4+f[2];
   ff[2]:=f[2]*2;
   f:=ff;
   end;
  writeln(f[2]/(f[1]+f[2])*100:0:4,'%');
  end
 else writeln('0.0000%');
close(output);
end.
