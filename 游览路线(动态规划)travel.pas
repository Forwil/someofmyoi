program travel;
var tab:array[0..3001,0..500]of longint;
     dp:array[0..1,0..3001]of longint;
    max,i,j,k,n,m,ans:longint;
begin
assign(input,'travel.in');reset(input);
assign(output,'travel.out');rewrite(output);
 readln(n,m);
 for i:=1 to n do
  begin
   for j:=1 to m do
    read(tab[i,j]);
    readln;
  end;
  max:=-maxlongint;
  ans:=-maxlongint;
for i:=1 to n do
if tab[i,1]>max then max:=tab[i,1];
for i:=2 to m do
 begin
 for j:=1 to n do
  begin
  if max>0 then
  dp[i and 1,j]:=max+tab[j,i];

  if ans< dp[i and 1,j] then
     ans:=dp[i and 1,j];
  end;
  max:=-maxlongint;
 for j:=1 to n do
  if dp[i and 1,j]>max then max:=dp[i and 1,j] ;
 end;
 writeln(ans);
 close(output);
end.
