program b9_19;
type ar=array[0..10]of longint;
var ind:array[0..201,0..10]of longint;
    k:array[0..10]of longint;
    dp:Array[0..5000000]of longint;
    o:ar;
    ans,i,j,j1,j2,j3,j4,j5,h1,h2,n,m,t,i1,i2,i3,i4,i5:longint;
function  hash(i1,i2,i3,i4,i5:longint):longint;
begin
hash:=(((i5*(k[4]+1)+i4)*(k[3]+1)+i3)*
(k[2]+1)+i2)*(k[1]+1)+i1;
end;
begin
readln(n,m);
for i:=1 to m do
read(k[i]);
for i:=1 to n do
 begin
 read(ind[i,0]);
  for j:=1 to m do
   read(ind[i,j]);
 readln;
 end;
 fillchar(dp,sizeof(dp),$ff);
 dp[0]:=0;
 for i:=1 to n do
 for i1:=k[1] downto ind[i,1] do
 for i2:=k[2] downto ind[i,2] do
 for i3:=k[3] downto ind[i,3] do
 for i4:=k[4] downto ind[i,4] do
 for i5:=k[5] downto ind[i,5] do
 begin
  j1:=i1-ind[i,1];j2:=i2-ind[i,2];
  j3:=i3-ind[i,3];j4:=i4-ind[i,4];
  j5:=i5-ind[i,5];
  h1:=hash(j1,j2,j3,j4,j5);
  h2:=hash(i1,i2,i3,i4,i5);
 if hash(j1,j2,j3,j4,j5)<>-1 then
  begin

   begin
   if dp[hash(j1,j2,j3,j4,j5)]+ind[i,0]>dp[hash(i1,i2,i3,i4,i5)] then
      dp[hash(i1,i2,i3,i4,i5)]:=dp[hash(j1,j2,j3,j4,j5)]+ind[i,0];
   if ans<dp[hash(i1,i2,i3,i4,i5)] then
      ans:=dp[hash(i1,i2,i3,i4,i5)];
   end;
  end;
end;
writeln(ans);
end.
