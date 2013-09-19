program lowtrees;
var dp:Array[0..201,0..201]of longint;
    dat,sum:array[0..201]of longint;
  z,i,j,k,n,m:longint;
function min(a,b:longint):longint;
begin if a>b then min:=b else min:=a;end;
begin
assign(input,'lowtrees.in');reset(input);
assign(output,'lowtrees.out');rewrite(output);
readln(n);
for i:=1 to n do
begin
read(dat[i]);
sum[i]:=sum[i-1]+dat[i];
end;
fillchar(dp,sizeof(dp),63);
for i:=1 to n do dp[i,i]:=0;
for i:=2 to n do
for j:=i-1 downto 1 do
for z:=i-1 downto j do
dp[j,i]:=min(dp[j,i],dp[j,z]+dp[z+1,i]+sum[i]-sum[j-1]);
writeln(dp[1,n]);
close(output);
end.