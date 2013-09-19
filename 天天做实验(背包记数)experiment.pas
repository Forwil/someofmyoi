program experiment;
var dp:array[0..25,-8000..8000]of qword;
    len:array[0..25]of longint;
    wi:Array[0..25]of longint;
  z,i,j,k,n,m,t,w,tt,ww:longint;
  ans:qword;
begin
assign(input,'experiment.in');reset(input);
assign(output,'experiment.out');rewrite(output);
readln(n,m);
for i:=1 to n do
 read(len[i]);
 readln;
for i:=1 to m do
 read(wi[i]);
dp[0,0]:=1;
t:=0;w:=0;
for i:=1 to m do
begin
tt:=t;ww:=w;
 for j:=1 to n do
 for z:=t to w do
 if dp[i-1,z]<>0 then
 begin
 inc(dp[i,z+len[j]*wi[i]],dp[i-1,z]);
 if z+len[j]*wi[i]<tt then tt:=z+len[j]*wi[i];
 if z+len[j]*wi[i]>ww then ww:=z+len[j]*wi[i];
 end;
t:=tt;w:=ww;
//ans:=ans+dp[i,0];
//writeln(dp[i,0]);
end;
writeln(dp[m,0]);
close(output);
end.
