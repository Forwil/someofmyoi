program tictac;
var i,j,k,n,m,ans:longint;
begin
assign(input,'tictac.in');
reset(input);
assign(output,'tictac.out');
rewrite(output);
 readln(n);
 ans:=12+n*2*6-12+4+(n-2)*3*2+(n-2)*(n-2)*3;
if n>1 then writeln(ans)
else writeln(1);
close(output);
end.
