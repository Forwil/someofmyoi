program candy;
var tab:array[0..1100,0..1100]of integer;
     dp:Array[0..1,0..1001,1..3]of longint;
     sum:array[0..1001,0..1001]of longint;
     ans,z,x,s,i,j,k,n,m,y,xx,yy,now,last:longint;
begin
assign(input,'candy.in');reset(input);
assign(output,'candy.out');rewrite(output);
readln(n,m);
ans:=0;
for i:=1 to n do
begin
for j:=1 to m do
begin
read(tab[i,j]);
sum[i,j]:=sum[i-1,j]+sum[i,j-1]-sum[i-1,j-1]+tab[i,j];
end;
readln;
end;
for i:=0 to m do
begin
 dp[0,i,2]:=i-1;
 dp[0,i,3]:=m-i;
end;
for i:=1 to n do
begin
now:=i and 1;
last:=1-now;
 for j:=1 to m do
  begin
  if tab[i-1,j]=0 then
  begin
  dp[now,j,1]:=1;
  dp[now,j,2]:=j-1;
  dp[now,j,3]:=m-j;
  end
  else
  begin
  dp[now,j,1]:=dp[last,j,1]+1;
  dp[now,j,2]:=dp[last,j,2];
  dp[now,j,3]:=dp[last,j,3];
  end;
   for z:=j-1 downto j-dp[now,j,2] do
   if tab[i,z]=0 then
    begin
     dp[now,j,2]:=j-z-1;
     break;
    end;
  for z:=j+1 to j+dp[now,j,3] do
   if tab[i,z]=0 then
    begin
    dp[now,j,3]:=z-j-1;
    break;
   end;
   if tab[i,j]<>0 then
  begin
   x:=i-dp[now,j,1]+1;
   y:=j-dp[now,j,2];
   yy:=j+dp[now,j,3];
   k:=sum[i,yy]-sum[x-1,yy]-sum[i,y-1]+sum[x-1,y-1];
   if k>ans then ans:=k;
  end;
 end;
end;
 writeln(ans);
close(output);
end.
