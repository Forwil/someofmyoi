program orzz;
var dp:array[0..3000]of longint;
   dat:Array[0..3000]of longint;
 t,i,j,k,n,m:longint;
begin
assign(input,'orz.in');reset(input);
assign(output,'orz.out');rewrite(output);
readln(n,m);
for i:=1 to n do
readln(dat[i]);
fillchar(dp,sizeof(dp),63);
dp[0]:=0;
for i:=1 to n do
begin
 t:=0;
  for j:=i-1 downto 0 do
   begin
    if dat[j+1]=1 then inc(t);
    if dat[j+1]=2 then dec(t);
    if ((abs(t)<=m)or(abs(t)=i-j))and(dp[i]>dp[j]+1) then
    dp[i]:=dp[j]+1;
   end;
end;
writeln(dp[n]);
close(output);
end.
