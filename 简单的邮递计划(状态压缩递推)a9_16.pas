program a9_16;
type node=array[0..255]of longint;
var dp:Array[0..1001,1..6]of node;
    i,j,k,n,m:longint;
    ans:node;
function max(a,b:longint):longint;
begin if a>b then max:=a else max:=b;end;
function jia(s1,s2:node):node;
var  jin,i:longint;
 s3:node;
begin
fillchar(s3,sizeof(s3),0);
jin:=0;
s3[0]:=max(s1[0],s2[0]);
for i:=1 to s3[0] do
 begin
 s3[i]:=(jin+s1[i]+s2[i]) mod 10000;
 jin:=(jin+s1[i]+s2[i]) div 10000;
 end;
if jin<>0 then
begin
s3[0]:=s3[0]+1;
s3[s3[0]]:=jin;
end;
jia:=s3;
end;
begin
readln(n);
dp[1,1][0]:=1;
dp[1,1][1]:=1;
dp[1,2][0]:=1;
dp[1,2][1]:=1;
for i:=2 to n-1 do
 begin
 dp[i,1]:=jia(jia(jia(dp[i-1,2],dp[i-1,5]),dp[i-1,6]),dp[i-1,4]);
 dp[i,3]:=jia(dp[i-1,3],dp[i-1,1]);
 dp[i,2]:=jia(jia(dp[i-1,5],dp[i-1,2]),dp[i-1,6]);
 dp[i,4]:=dp[i-1,1];
 dp[i,5]:=jia(dp[i-1,1],dp[i-1,3]);
 dp[i,6]:=dp[i,5];
 end;
ans:=jia(dp[n-1,1],dp[n-1,3]);
ans:=jia(ans,ans);
write(ans[ans[0]]);
for i:=ans[0]-1 downto 1 do
 case ans[i] of
 0..9:write('000',ans[i]);
 10..99:write('00',ans[i]);
 100..999:write('0',ans[i]);
 1000..9999:write(ans[i]);
 end;
end.
