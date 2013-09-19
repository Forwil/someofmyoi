program c9_8;
var sum:Array[-1..1001,0..5]of longint;
     dp:array[-1..1001,0..5]of longint;
     z,id:array[0..5,0..5,-1..1004]of longint;
  r,y,now,last,l,i,j,k,n,m,x,ans,o:longint;
  t,w:array[0..5,0..5]of longint;
begin
assign(input,'c.in');reset(input);
readln(m,n,k,l);
for i:=1 to n do
for j:=1 to m do
 begin
 read(x);
 sum[j,i]:=sum[j-1,i]+x;
 if j=m then readln;
 end;
 fillchar(dp,sizeof(dp),63);
for i:=1 to m do
 begin

  for j:=1 to n do
  for y:=1 to n do
  if j<>y then
   begin
    while (i-id[y,j,t[y,j]]>l) do
        inc(t[y,j]);
    if dp[i,j]>z[y,j,t[y,j]]+sum[i,j]+k then
       dp[i,j]:=z[y,j,t[y,j]]+sum[i,j]+k
   end;

  for j:=1 to n do
   for y:=1 to n do
   if y<>j then
     begin
     r:=dp[i,j]-sum[i,y];
     while (r<=z[j,y,w[j,y]])and(w[j,y]>=t[j,y]) do
     w[j,y]:=w[j,y]-1;
     inc(w[j,y]);
     z[j,y,w[j,y]]:=r;
     id[j,y,w[j,y]]:=i;
     end;
end;
ans:=maxlongint;
for i:=1 to n do
if dp[m,i]<ans then ans:=dp[m,i];
writeln(ans-k);
end.
