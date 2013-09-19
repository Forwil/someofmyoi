program lyf;
var v,a,s,ss,t:int64;
 i:longint;
begin
assign(input,'lyf.in');reset(input);
assign(output,'lyf.out');rewrite(output);
readln(t,s);
readln(v,a);
for i:=1 to t do
 begin
 ss:=ss+v;
 v:=v+A;
 end;
if ss>s then writeln('KILL!')
else writeln('Sir. Lyf cry.');
close(output);
end.