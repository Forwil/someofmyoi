program A9_4;
var tab:array[0..1001]of integer;
     dp:array[0..1,0..1001]of longint;
     now,last,i,j,k,n,m:longint;
begin

readln(n);
readln(dp[1,1]);
for i:=2 to n do
begin
now:=i and 1;
last:=1- now;
dp[last,0]:=maxlongint-500;
dp[last,i]:=maxlongint-500;
dp[now,0]:=maxlongint-500;
dp[now,i+1]:=maxlongint-500;


 for j:=1 to  i do
   begin
   read(tab[j]);

   dp[now,j]:=maxlongint;

   if dp[last,j]<dp[now,j]  then
     dp[now,j]:=dp[last,j];

   if dp[last,j-1]<dp[now,j]then
     dp[now,j]:=dp[last,j-1];

   if (j=1)and(dp[last,i-1]<dp[now,j]) then
      dp[now,j]:=dp[last,i-1];

  if (j=i)and(dp[last,1]<dp[now,j]) then
      dp[now,j]:=dp[last,1];

   dp[now,j]:=dp[now,j]+tab[j];
   end;
readln;
//---------------------------------------

if dp[now,1]> dp[now,i]+tab[1] then
   dp[now,1]:=dp[now,i]+tab[1]
else
if dp[now,i]> dp[now,1]+tab[i] then
   dp[now,i]:=dp[now,1]+Tab[i];

for j:=2 to i  do
if dp[now,j-1]+tab[j]<dp[now,j] then
   dp[now,j]:=dp[now,j-1]+tab[j];

for j:=i-1 downto 1 do
if dp[now,j+1]+tab[j]<dp[now,j] then
   dp[now,j]:=dp[now,j+1]+tab[j];
//----------------------------------------
if dp[now,1]> dp[now,i]+tab[1] then
 begin
   dp[now,1]:=dp[now,i]+tab[1];
   for j:=2 to i  do
if dp[now,j-1]+tab[j]<dp[now,j] then
   dp[now,j]:=dp[now,j-1]+tab[j];
 end

else
if dp[now,i]> dp[now,1]+tab[i] then
 begin
   dp[now,i]:=dp[now,1]+Tab[i];

   for j:=i-1 downto 1 do
if dp[now,j+1]+tab[j]<dp[now,j] then
   dp[now,j]:=dp[now,j+1]+tab[j];
 end;

end;
writeln(dp[n and 1,1]);
end.
