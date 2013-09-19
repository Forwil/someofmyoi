program link;
var dp:array[0..10001]of longint;
   dat:Array[0..10001]of string[60];
 ans,i,j,k,n,m:longint;
begin
assign(input,'link.in');reset(input);
assign(output,'link.out');rewrite(output);
readln(n);
for i:=1 to n do
readln(dat[i]);
for i:=1 to n do
begin
dp[i]:=1;
for j:=i-1 downto 1 do
 if dat[i,1]=dat[j,1] then
 begin
 if length(dat[j])<length(dat[i]) then
 if (dp[j]+1>dp[i])and(copy(dat[i],1,length(dat[j]))=dat[j])then
    begin
    dp[i]:=dp[j]+1;
     if dp[i]>ans then
   begin
    ans:=dp[i];
    break;
   end;
    break;
    end;
 end
 else break;
end;
writeln(ans);
close(output);
end.
