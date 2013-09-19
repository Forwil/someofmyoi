program soultap;
var ind:Array[0..101,0..2]of longint;
    dp:array[0..101,0..101]of longint;
    p:array[1..12,0..101]of longint;
    z,x,y,i,j,k,n,m,m1,m2,l,r,ans:longint;
begin
assign(input,'soultap.in');reset(input);
assign(output,'soultap.out');rewrite(output);
readln(n,m,m1,m2);
for i:=1 to n do
 begin
 readln(ind[i,1],ind[i,2],k,ind[i,0]);
 inc(p[k,0]);
 p[k,p[k,0]]:=i;
 end;
 for i:=1 to m do
 for x:=m1 downto 0 do
 for y:=m2 downto 0 do
  if (dp[x,y]>0)or((x=0)and(y=0))then
  for z:=1 to p[i,0] do
   begin
    l:=x+ind[p[i,z],1];
    r:=y+ind[p[i,z],2];
    if (l<=m1)and(r<=m2)then
    if dp[l,r]<dp[x,y]+ind[p[i,z],0]then
     begin
       dp[l,r]:=dp[x,y]+ind[p[i,z],0];
       if ans<dp[l,r] then
         ans:=dp[l,r];
     end;
   end;
writeln(ans);
close(output);
end.
