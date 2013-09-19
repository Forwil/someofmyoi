program a9_190;
var a:array[0..1,0..10000]of longint ;
    i,j,k,n,m,now,ans:longint;
begin
assign(input,'fuel.in');reset(input);
assign(output,'fuel.out');rewrite(output);
readln(n,m);
for i:=1 to m do
 readln(a[0,i]);
 ans:=a[0,1];
for i:=n-1 downto 1 do
 begin
 now:=(n-i) and 1;
 for j:=1 to i do
  a[now,j]:=a[1-now,j]+a[1-now,j+1];
 ans:=ans+a[now,1];
 end;
 writeln(ans);
 close(output);
end.
