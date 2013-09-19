program dt1;
var dat:Array[0..201,1..2]of longint;
    dp:Array[0..1,0..40001]of longint;
   i,j,k,n,m,r,now,ans:longint;
function min(a,b:longint):longint;
begin if a>B then min:=b else min:=a;end;
function max(a,b:longint):longint;
begin if a>B then max:=a else max:=b;end;
begin
assign(input,'cs.in');reset(input);
assign(output,'cs.out');rewrite(output);
readln(n);
for i:=1 to n do
 begin
 readln(dat[i,1],dat[i,2]);
 m:=m+dat[i,1];
 end;
 fillchar(dp,sizeof(dp),63);
 r:=dp[0,0];
 dp[0,0]:=0;
for i:=1 to n do
begin
now:=i and 1;
for j:=0 to m do dp[now,j]:=r;
for j:=m-dat[i,1] downto 0 do
if dp[1-now,j]<>r then
 begin
 if dp[now,j+dat[i,1]]>dp[1-now,j] then
    dp[now,j+dat[i,1]]:=dp[1-now,j];

 if dp[now,j]>dp[1-now,j]+dat[i,2] then
    dp[now,j]:=dp[1-now,j]+dat[i,2];
 end;
end;
ans:=maxlongint;
for i:=0 to m do
if dp[n and 1,i]<>r then
 ans:=min(ans,max(dp[n and 1,i],i));
 writeln(ans);
 close(output);
end.
