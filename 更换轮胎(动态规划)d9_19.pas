program d9_19;
var dp:array[0..1001,0..1001]of longint;
    ind:array[0..1001,0..1001]of longint;
  ans,o,i,j,n,m,cost,min,minn:longint;
begin
readln(n,m,cost);
minn:=maxlongint DIV 2;
for i:=1 to n do
 begin
 for j:=1 to m do
   read(ind[i,j]);
   READLN;
 min:=minn;
 minn:=maxlongint DIV 2;

 for j:=1 to m do
  begin
   dp[i,j]:=dp[i-1,j]+ind[i,j];
  if  dp[i,j]>cost+min+ind[i,j] then
      dp[i,j]:=cost+min+ind[i,j];
   if minn>dp[i,j] then minn:=dp[i,j];
  end;
 end;
 writeln(minn);
end.
