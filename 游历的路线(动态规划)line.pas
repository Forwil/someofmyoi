program line;
var dp:array[0..202,0..101]of longint;
    tab:array[0..101,0..101,0..20]of longint;
      b:Array[0..202,0..101]of boolean;
    z,i,j,k,n,m,min:longint;
begin
assign(input,'line.in');reset(input);
assign(output,'line.out');rewrite(output);
readln(n,m);
for i:=1 to n do
for j:=1 to n do
if j<>i then
 begin
 read(tab[i,j,0]);
  for z:=1 to tab[i,j,0] do
   read(tab[i,j,z]);
   readln;
 end;
dp[1,1]:=0;
b[1,1]:=true;
for i:=2 to m+1 do
  for j:=1 to n do
   begin
    min:=maxlongint;
    for z:=1 to n do
    if (b[i-1,z])and(z<>j)and(tab[z,j,(i-2) mod tab[z,j,0]+1]<>0) then
    if min> dp[i-1,z]+tab[z,j,(i-2) mod tab[z,j,0]+1] then
       min:=dp[i-1,z]+tab[z,j,(i-2) mod tab[z,j,0]+1];
   if min<>maxlongint then
     begin
      b[i,j]:=true;
      dp[i,j]:=min;
     end;
   end;
writeln(dp[m+1,n]);
close(output);
end.