program remove;
var ind:array[0..101]of integer;
    dp:array[0..101]of qword;
    s:array[0..101,0..101]of qword;
   x,y,z,i,j,k,n,m:longint;
begin
assign(input,'remove.in');reset(input);
assign(output,'remove.out');rewrite(output);
readln(n);
for i:=1 to n do
read(ind[i]);
for i:=1 to  n do
begin
s[i,i]:=ind[i];
for j:=i+1 to n do
s[i,j]:=abs(ind[j]-ind[i])*(j-i+1);
end;
dp[1]:=ind[1];
for i:=2 to n do
 begin
 for j:=0 to i-1 do
  if dp[j]+s[j+1,i]>dp[i] then
    dp[i]:=dp[j]+s[j+1,i];
 end;
  writeln(dp[n]);
  close(output);
end.
