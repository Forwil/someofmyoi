program n1121;
var dp:Array[-5..50,-5..50]of longint;
     b:Array[-5..50,-5..50]of boolean;
x,y,i,j,k,n,m:longint;
begin
 readln(n,m,x,y);
 for i:=0 to n do
 for j:=0 to m do
  b[i,j]:=true;
b[x,y]:=false;
b[x+2,y+1]:=false;
b[x+2,y-1]:=false;
b[x+1,y+2]:=false;
b[x+1,y-2]:=false;
b[x-1,y+2]:=false;
b[x-1,y-2]:=false;
b[x-2,y+1]:=false;
b[x-2,y-1]:=false;
dp[0,-1]:=1;
for i:=0 to n do
 for j:=0 to m do
  if b[i,j] then
   dp[i,j]:=dp[i-1,j]+dp[i,j-1]
   else
   dp[i,j]:=0;
writeln(dp[n,m]);
end.