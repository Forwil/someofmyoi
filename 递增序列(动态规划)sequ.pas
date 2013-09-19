program sequence;
var dp:array[0..81,0..81]of string[90];
     s:array[0..81,0..81]of string[90];
     p:array[0..81,0..81]of longint;
     out:set of 0..255;
    x,z,t,w,i,j,k,m,n:longint;
    ss,s1,s2,max:string[90];
function big(s1,s2:string[80]):boolean;
begin
while (s1[1]='0')and(length(s1)>1) do
delete(s1,1,1);
while (s2[1]='0')and(length(s2)>1) do
delete(s2,1,1);
if length(s1)>length(s2) then exit(true);
if (length(s1)=length(s2))and(s1>s2) then exit(true);
exit(false);
end;
function deng(s1,s2:string):boolean;
begin
while (s1[1]='0')and(length(s1)>1) do
delete(s1,1,1);
while (s2[1]='0')and(length(s2)>1) do
delete(s2,1,1);
if s1=s2 then exit(true)
else exit(false);
end;
begin
assign(input,'sequ.in');reset(input);
assign(output,'sequ.out');rewrite(output);
 readln(ss);
 n:=length(ss);
 for i:=1 to n do
 for j:=i to n do
   s[i,j]:=copy(ss,i,j-i+1);

 for i:=1 to n do
  begin
  dp[i,n]:=s[i,n];
  p[i,n]:=n;
  end;
max:='9999999999';
max:=max+max+max+max;
 for i:=n-1 downto 1 do
 for j:=n-1 downto i do
begin
dp[i,j]:='';
  for z:=n downto j do
  if dp[j+1,z]<>'' then
   begin
    s1:=s[i,j];
    s2:=s[j+1,z];
    if big(s2,s1) then
    if (dp[i,j]='')or(big(dp[i,j],dp[j+1,z])) then
        begin
          p[i,j]:=z;
         dp[i,j]:=dp[j+1,z];
        end;
   end;
   if (i=1)and(big(max,dp[i,j]))and(dp[i,j]<>'') then max:=dp[i,j];
end;

 for i:=1 to n do
 if deng(dp[1,i],max) then
  begin
  k:=i;
  end;
i:=1;
if k<>0 then
begin
repeat
j:=k;
out:=out+[k];
k:=p[i,k];
i:=j+1;
until k>=n;
for i:=1 to n do
 begin
 write(ss[i]);
 if i in out then write(',');
 end;
end
else writeln(ss);
 close(output);
end.
