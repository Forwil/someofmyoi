program minsum;
var dis:Array[0..18,0..18]of longint;
    dp:array[0..18,0..70000]of longint;
    s,ans,i,j,k,n,m:longint;
function min(a,b:longint):longint;
begin if a>B then min:=b else min:=a;end;
begin
assign(input,'minsum.in');reset(input);
assign(output,'minsum.out');rewrite(output);
readln(n);
for i:=1 to n do
for j:=1 to n do
begin
read(dis[i,j]);
if j=n then readln;
end;

fillchar(dp,sizeof(dp),63);
for s:=1 to 1 shl n-1 do
  for i:=1 to n do
   if (1 shl(i-1))and s<>0 then
    begin
      for j:=1 to n do
       if ((1 shl (j-1))and s <>0)and(j<>i) then
        dp[i,s]:=min(dp[i,s],dp[j,s-1 shl(i-1)]+dis[j,i]);
       if s-1 shl(i-1)=0 then dp[i,s]:=0;
    end;
 ans:=maxlongint;
for i:=1 to n do
if dp[i,1 shl n-1]<ans then ans:=dp[i,1 shl n-1];
writeln(ans);
close(output);
end.
