program girlman;
var  dp:Array[0..90,0..90]of int64;
     bb:array[0..90,0..90]of boolean;
    dat:array[0..1001,1..3]of longint;
   z,s,i,b,j,k,n,m:longint;
   x,y:int64;
begin
assign(input,'girlman.in');reset(input);
assign(output,'girlman.out');rewrite(output);
readln(n,s,b);
for i:=1 to n do
readln(dat[i,1],dat[i,2],dat[i,3]);
bb[0,0]:=true;
for i:=1 to n do
for j:=s downto 0 do
for z:=b downto 0 do
if bb[j,z] then
 begin
 x:=j+dat[i,1];
 y:=z+dat[i,2];
 if x>s then x:=s;
 if y>b then y:=b;
 if (not bb[x,y])or(bb[x,y] and (dp[x,y]>dp[j,z]+dat[i,3]))  then
    dp[x,y]:=dp[j,z]+Dat[i,3];
 bb[x,y]:=true;
 end;
writeln(dp[s,b]*2);
close(output);
end.
