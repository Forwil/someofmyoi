program c9_5;
var dp:array[0..1001,0..1001]of boolean;
    ind:array[0..101]of integer;
    sum,z,s,i,j,k,m,n,w:longint;
begin

readln(n);
for i:=1 to n do
begin
read(ind[i]);
sum:=sum+ind[i];
end;
for i:=1 to n do
for j:=i+1 to n do
if ind[i]>ind[j] then
   begin
   ind[0]:=ind[i];
   ind[i]:=ind[j];
   ind[j]:=ind[0];
   end;
dp[0,0]:=true;
s:=0;
w:=0;
for i:=1 to n do
for j:=s downto 0 do
for z:=w downto 0 do
if dp[j,z] then
 begin
 if j+ind[i]<=sum div 2 then
 begin
 dp[j+ind[i],z]:=true;
 if j+ind[i]>s then s:=j+ind[i];
 end;
 if z+ind[i]<=sum div 2 then
 begin
 dp[j,z+ind[i]]:=true;
 if z+ind[i]>w then w:=z+ind[i];
 end;
 end;

for i:= sum div 2 downto 0 do
if dp[i,i] then break;
if i>0 then
writeln(i)
else
writeln('Impossible');
end.
