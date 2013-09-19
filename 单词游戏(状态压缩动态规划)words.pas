program words;
var dp:Array[0..17,0..70000]of boolean;
    ln:Array[0..17,0..17]of boolean;
    name:Array[0..17]of string;
   ans,s,i,j,k,n,m,t:longint;
begin
assign(input,'words.in');reset(input);
assign(output,'words.out');rewrite(output);
readln(n);
for i:=1 to n do
readln(name[i]);
for i:=1 to n do
for j:=1 to n do
if (i<>j)and(name[i][length(name[i])]=name[j][1]) then
ln[i,j]:=true;

for s:=1 to 1 shl n-1 do
for i:=1 to n do
if s and (1 shl (i-1))<>0 then
 begin

  if s-1 shl(i-1)=0 then dp[i,s]:=true
  else
  for j:=1 to n do
  if (s and (1 shl(j-1))<>0)and(i<>j) then
   dp[i,s]:=dp[i,s]or((dp[j,s-1shl(i-1)])and(ln[j,i]));

  t:=0;
  if dp[i,s] then
  for j:=1 to n do
  if s and (1 shl(j-1))<>0 then t:=t+length(name[j]);
  if t>ans then ans:=t;
 end;
writeln(ans);
close(output);
end.