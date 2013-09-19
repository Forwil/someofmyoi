program vijos2_2;
type node=array[0..500]of longint;
var dp:array[0..100,0..100]of node;
  i,j,k,n,m:longint;
function jia(s1,s2:node):node;
var s3:node;
   l,jin,i,j:longint;
begin
fillchar(s3,sizeof(s3),0);
if s1[0]>s2[0] then l:=s1[0]
else l:=s2[0];
jin:=0;
s3[0]:=l;
for i:=1 to l do
begin
s3[i]:=(s1[i]+s2[i]+jin) mod 10;
jin:=(s1[i]+s2[i]+jin) div 10;
end;
if jin<>0 then
begin
s3[0]:=s3[0]+1;
s3[s3[0]]:=jin;
end;
jia:=s3;
end;
function chen(s1:node;x:integer):node;
var i,l:longint;
s3:node;
begin
fillchar(s3,sizeof(s3),0);
 s3[0]:=s1[0];
 for i:=1 to s3[0] do
  s3[i]:=s1[i]*x;
 for i:=1 to s3[0] do
 begin
 s3[i+1]:=s3[i+1]+s3[i] div 10;
 s3[i]:=s3[i] mod 10;
 end;
while s3[s3[0]+1]<>0 do
begin
s3[0]:=s3[0]+1;
s3[s3[0]+1]:=s3[s3[0]+1] + s3[s3[0]] div 10;
s3[s3[0]]:=s3[s3[0]] mod 10;
end;
chen:=s3;
end;
begin
for i:=1 to 100 do
begin
dp[i,1,0]:=1;
dp[i,1,1]:=1;
end;
for i:=1 to 100 do
for j:=2 to i do
begin
dp[i,j]:=chen(dp[i-1,j],j);
dp[i,j]:=jia(dp[i,j],dp[i-1,j-1]);
end;
while not(eof) do
 begin
  readln(n,m);
  if (n<m)or(n=0)or(m=0) then writeln(0);
  begin
  for i:=dp[n,m,0] downto 1 do
  write(dp[n,m,i]);
  writeln;
  end;
 end;
end.
