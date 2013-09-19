program corner;
var dp:array[0..23,0..301,0..301]of int64;
    tab:array[0..301,0..301]of longint;
  x,y,i,j,k,n,m,z:longint;
  r,ans:int64;
begin
assign(input,'corner.in');reset(input);
assign(output,'corner.out');rewrite(output);
readln(m,n);
for i:=1 to n do
for j:=1 to m do
 begin
 read(tab[i,j]);
 if j=m then readln;
 if tab[i,j]=0 then
 begin
 x:=i;
 y:=j;
 end;
 end;
 fillchar(dp,sizeof(dp),$80);
 r:=dp[0,0,0];
 dp[0,x,y]:=0;
for i:=1 to 23 do
 for j:=1 to n do
 for z:=1 to m do
 if (tab[j,z]<>-1)and(tab[j,z]<>0)then
   begin
              if dp[i-1,j+1,z]<>r then
   if dp[i,j,z]< dp[i-1,j+1,z]+tab[j,z] then
      dp[i,j,z]:=dp[i-1,j+1,z]+tab[j,z];

              if dp[i-1,j,z+1]<>r then
   if dp[i,j,z]< dp[i-1,j,z+1]+tab[j,z] then
      dp[i,j,z]:=dp[i-1,j,z+1]+tab[j,z];

              if dp[i-1,j-1,z]<>r then
   if dp[i,j,z]< dp[i-1,j-1,z]+tab[j,z] then
      dp[i,j,z]:=dp[i-1,j-1,z]+tab[j,z];

              if dp[i-1,j,z-1]<>r then
   if dp[i,j,z]< dp[i-1,j,z-1]+tab[j,z] then
      dp[i,j,z]:=dp[i-1,j,z-1]+tab[j,z];

   end;
  ans:=-maxlongint;
for i:=1 to n do
for j:=1 to m do
if dp[23,i,j]>ans then
 ans:=dp[23,i,j];
 writeln(ans);
 close(output);
end.
