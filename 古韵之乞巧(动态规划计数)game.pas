program game;
var dat:array[0..102]of longint;
    dp:array[0..102,0..25]of qword;
    z,i,j,k,n,m:longint;
    ans:qword;
begin
assign(input,'game.in');reset(input);
assign(output,'game.out');rewrite(output);
readln(n,m);
for i:=1 to n do
read(dat[i]);
dp[0,0]:=1;
dat[0]:=-20000;
  for i:=1 to n do
   begin
    for j:=m downto 1 do
     for z:=i-1 downto 0 do
      if dat[i]>=dat[z] then inc(dp[i,j],dp[z,j-1]);
    ans:=ans+dp[i,m];
   end;
write(ans);
close(output);
end.
