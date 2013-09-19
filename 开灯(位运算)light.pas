program light;
var i,j,n,t:longint;
  ans,m:int64;
 k:real;
begin
assign(input,'light.in');reset(input);
assign(output,'light.out');rewrite(output);
readln(n);
ans:=0;
for i:=1 to n do
 begin
  readln(k,t);
   for j:=1 to t do
    begin
    m:=trunc(j*k);
    ans:=ans xor m;
    end;
 end;
writeln(ans);
close(output);
end.
