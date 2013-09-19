


program c9_13;
var dp:Array[0..2]of longint;
   i,j,k,n,m,l,ll:longint;
   s:ansistring;
   ss:string;
begin
readln(s);
while s<>'0' do
 begin
 fillchar(dp,sizeof(dp),0);
 dp[1]:=1;
 dp[0]:=1;
  for i:=2 to length(s) do
    begin
    n:=i mod 3;
    l:=(i-1) mod 3;
    ll:=(i-2) mod 3;
    dp[n]:=0;
    if s[i]='0' then
     dp[n]:=dp[ll]
    else
    if (s[i-1]='1')or((s[i-1]='2')and(s[i]<='6')) then
     dp[n]:=dp[l]+dp[ll]
    else
     dp[n]:=dp[l];
    end;
    writeln(dp[length(s) mod 3]);
    readln(s);
 end;
end.
