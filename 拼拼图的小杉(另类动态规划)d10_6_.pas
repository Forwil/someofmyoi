program d10_6;
var dp:Array[0..1001,0..1001,0..1]of longint;
   ind:array[0..1001]of longint;
   i,j,k,n,m,ans:longint;
   l:array[0..1]of longint;
begin
assign(input,'d.in');
reset(input);
//assign(output,'d.out');
//rewrite(output);
 readln(n,m,k);
 for i:=1 to n do
  read(ind[i]);
 for i:=1 to n do
 dp[i-1,i,0]:=maxlongint div 2;
 for i:=1 to n do
 for j:=1 to i do
  begin
   if dp[i-1,j-1,1]+ind[i]<=k then
    begin
     l[0]:=dp[i-1,j-1,0];
     l[1]:=dp[i-1,j-1,1]+ind[i];
    end
   else
    begin
     l[0]:=dp[i-1,j-1,0]+1;
     l[1]:=ind[i];
    end;
  if dp[i-1,j,0]<l[0] then
   dp[i,j]:=dp[i-1,j];
  if dp[i-1,j,0]>l[0] then
   dp[i,j]:=l;

  if dp[i-1,j,0]=l[0] then
  if dp[i-1,j,1]<l[1] then
   dp[i,j]:=dp[i-1,j]
   else
   dp[i,j]:=l;
  end;
for i:=1 to n do
if (dp[n,i,0]+1<=m)and(dp[n,i,1]<=k)
then ans:=i;
writeln(ans);
close(output);
end.