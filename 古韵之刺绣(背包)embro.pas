program embro;
var ind,vi:array[0..101]of longint;
      F:array[0..3,1..2]of longint;
      ha:array[0..32799]of longint;
      dp:array[0..8001]of longint;
   t,x,y,z,i,j,k,n,m:longint;
function max(a,b:longint):longint;
begin if a>b then max:=a else max:=b;end;
begin
assign(input,'embro.in');reset(input);
assign(output,'embro.out');rewrite(output);
readln(n,m);
for i:=1 to 3 do
 begin
 readln(x,y,z);
 ha[x]:=i;
 f[i,1]:=y;
 f[i,2]:=z;
 end;

for i:=1 to n do
 begin
 readln(ind[i],y);
 vi[i]:=ind[i]*f[ha[y],1];
 ind[i]:=ind[i]+ind[i]*f[ha[y],2];
 end;

 for i:=1 to n do
 for j:=m-ind[i] downto 0 do
 dp[j+ind[i]]:=max(dp[j+ind[i]],dp[j]+vi[i]);
writeln(dp[m]);
close(output);
end.
