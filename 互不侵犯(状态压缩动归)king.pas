program king;
var zt:array[0..600]of longint;
    tt:array[0..600]of integer;
    dp:Array[0..9,0..400,0..90]of qword;
    l,z,i,j,k,n,m:longint;
    ans:qword;

procedure go(x,y,z:longint);
begin
if (x>n)and(y<=k) then
 begin
 m:=m+1;
 zt[m]:=z;
 tt[m]:=y;
 exit;
 end;
if y<=k then
 begin
 go(x+1,y,z);
 go(x+2,y+1,z or (1 shl(n-x)));
 end;
end;

begin
assign(input,'king.in');reset(input);
assign(output,'king.out');rewrite(output);
readln(n,k);
go(1,0,0);
for i:=1 to m do
 dp[1,i,tt[i]]:=1;

 for i:=2 to n do
 for j:=1 to m do
 for z:=1 to m do if ((zt[z] shr 1)and zt[j]=0)
 and((zt[z] shl 1)and zt[j]=0)and(zt[j] and zt[z] =0)then
 for l:=0 to k-tt[j] do
 inc(dp[i,j,l+tt[j]],dp[i-1,z,l]);

for i:=1 to m do
ans:=ans+dp[n,i,k];
writeln(ans);
close(output);
end.