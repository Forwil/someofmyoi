program vijos6_3;
var tab:array[0..51,0..51]of longint;
   dp:array[0..21,0..51,0..51,0..1]of longint;
     b:array[0..20,0..51,0..51]of boolean;
   z,i,j,k,n,m,x:longint;
begin
assign(input,'dian.in');
reset(input);
readln(n,m,x);
for i:=1 to n do
begin
for j:=1 to m do
begin
read(tab[i,j]);
if tab[i,j]=1000  then
begin
 b[0,i,j]:=true;
 dp[0,i,j,1]:=1000;
end;
end;
readln;
end;
for i:=1 to x do
 for j:=1 to n do
 for z:=1 to m do
 if b[i-1,j,z]=false then
 begin
 dp[i,j,z,1]:=0;
 dp[i,j,z,0]:=0;
 if (b[i-1,j+1,z])then
  begin
  if (dp[i-1,j+1,z,1]>dp[i,j,z,1]) then
               begin
                    dp[i,j,z,1]:=dp[i-1,j+1,z,1];
                    dp[i,j,z,0]:=1;
               end
  else if dp[i,j+1,z,1]=dp[i,j,z,1] then dp[i,j,z,0]:=dp[i,j,z,0]+1;
  b[i,j,z]:=true;
  end;
//---------------------------------
  if (b[i-1,j-1,z])then
  begin
  if (dp[i-1,j-1,z,1]>dp[i,j,z,1]) then
               begin
                    dp[i,j,z,1]:=dp[i-1,j-1,z,1];
                    dp[i,j,z,0]:=1;
               end
  else if dp[i,j-1,z,1]=dp[i,j,z,1] then dp[i,j,z,0]:=dp[i,j,z,0]+1;
  b[i,j,z]:=true;
  end;
//-------------------------------
  if (b[i-1,j,z+1])then
  begin
  if (dp[i-1,j,z+1,1]>dp[i,j,z,1]) then
               begin
                    dp[i,j,z,1]:=dp[i-1,j,z+1,1];
                    dp[i,j,z,0]:=1;
               end
  else if dp[i,j,z+1,1]=dp[i,j,z,1] then dp[i,j,z,0]:=dp[i,j,z,0]+1;
  b[i,j,z]:=true;
  end;
//-------------------------------
  if (b[i-1,j,z-1])then
  begin
  if (dp[i-1,j,z-1,1]>dp[i,j,z,1]) then
               begin
                    dp[i,j,z,1]:=dp[i-1,j,z-1,1];
                    dp[i,j,z,0]:=1;
               end
  else if dp[i,j,z-1,1]=dp[i,j,z,1] then dp[i,j,z,0]:=dp[i,j,z,0]+1;
  b[i,j,z]:=true;
  end;
 if b[i,j,z] then
 dp[i,j,z,1]:=dp[i,j,z,1]+tab[j,z];
 k:=dp[i,j,z,1];
end;
for i:=1 to n do
begin
for j:=1 to m do
write(dp[x,i,j,1],' ');
writeln;
end;
end.