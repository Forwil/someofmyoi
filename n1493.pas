program n1493;
var dp:Array[0..102,0..50,0..50]of longint;
    ind:array[0..50,0..50]of longint;
    t,w,i,j,k,n,m:longint;
function max(a,b:longint):longint;
begin if a>b then max:=a else max:=b;end;
function min(a,b:longint):longint;
begin if a>b then min:=b else min:=a;end;
begin
readln(n,m);
for i:=1 to n do
for j:=1 to m do
 begin
 read(ind[i,j]);
 if j=m then readln;
 end;

for i:=2 to n+m-2 do
 begin
  w:=min(i,n);
  t:=max(i-m+1,1);
  for j:=t to w do
   for k:=t to w do
    if j<>k then
     begin
     if j-1<>k then
       if dp[i-1,j-1,k]>dp[i,j,k] then
          dp[i,j,k]:=dp[i-1,j-1,k];

     if j-1<>k-1 then
       if dp[i-1,j-1,k-1]>dp[i,j,k] then
          dp[i,j,k]:=dp[i-1,j-1,k-1];

     if j<>k-1 then
       if dp[i-1,j,k-1]>dp[i,j,k] then
          dp[i,j,k]:=dp[i-1,j,k-1];
     if dp[i-1,j,k]>dp[i,j,k] then
        dp[i,j,k]:=dp[i-1,j,k];

     dp[i,j,k]:=dp[i,j,k]+ind[j,i-j+1]+ind[k,i-k+1];
     end;
 end;
 writeln(dp[n+m-2,n,n-1]);
end.