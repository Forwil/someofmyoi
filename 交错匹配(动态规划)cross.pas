program cross;
var up:array[0..210]of longint;
    dn:array[0..210]of longint;
    dp:array[0..210,0..210]of longint;
   x,y,z,i,j,k,n,m,l:longint;
begin
assign(input,'cross.in');reset(input);
assign(output,'cross.out');rewrite(output);
 readln(n,m);
 for i:=1 to n do
 read(up[i]);
 for i:=1 to m do
 read(dn[i]);
 for i:=1 to n do
  for j:=1 to m do
   begin
   dp[i,j]:=dp[i-1,j-1];
   x:=0;
   y:=0;
   for z:=i-1 downto 1 do
    if (up[z]=dn[j]) then
       begin
       x:=z;
       break;
       end;
   for z:=j-1 downto 1 do
    if (dn[z]=up[i]) then
       begin
       y:=z;
       break;
       end;
   if (x<>0)and(y<>0)and(up[i]<>dn[j])and(dp[i,j] <dp[x-1,y-1]+2)  then
                         dp[i,j]:=dp[x-1,y-1]+2;
   if dp[i,j-1]>dp[i,j] then dp[i,j]:=dp[i,j-1];
   if dp[i-1,j]>dp[i,j] then dp[i,j]:=dp[i-1,j];
  end;
writeln(dp[n,m]);
close(output);
end.
