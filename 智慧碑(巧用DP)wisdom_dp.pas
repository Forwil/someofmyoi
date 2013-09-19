program wisdom_dp;
var dp:Array[0..1,0..1000,0..5,0..6]of longint;
  ans,z,i,j,k,n,m,a,b,c,a1,b1,c1:longint;
function max(a,b:longint):longint;
begin if a>b then max:=a else max:=b;end;
begin
assign(input,'wisdom.in');reset(input);
assign(output,'wisdom.out');rewrite(output);
readln(a,b,c);
readln(a1,b1,c1);
while c1>=100 do
 if c>=100 then
  begin
   a:=a-25;
   a1:=a1-15;
   c1:=c1-100;
   c:=c-100;
   k:=k+1;
   if a1<=0 then writeln('No answer');
   if a<=0 then
   begin
   writeln(1);
   halt;
   end;
  end
 else
  begin
  a:=a-25;
  c:=c+10;
  a1:=a1-b1;
  c1:=c1-100;
  k:=k+1;
  if a1<=0 then writeln('No answer');
   if a<=0 then
   begin
   writeln(1);
   halt;
   end;
  end;
  if k>5 then k:=5;
  i:=0;
  dp[0,a,c1 div 20,k]:=1;
while a1>0 do
begin
if c>=100 then
begin a1:=a1-15; c:=c-100;end
else
begin a1:=a1-b;c:=c+10;end;
if a1<=0 then break;

 for z:=1 to a do
 for j:=0 to 5 do
 for k:=0 to 6 do
 if dp[i,z,j,k]<>0 then
begin
 if j<5 then
 begin
  dp[1-i,z,j+1,0]:=dp[1-i,z,j+1,0]+dp[i,z,j,k];
  if k<5 then dp[1-i,max(0,z-b1),j,k+1]:=dp[1-i,max(0,z-b1),j,k+1]+dp[i,z,j,k];
 end;
if (j=5) then
 dp[1-i,max(0,z-25),0,k+1]:=dp[1-i,max(0,z-25),0,k+1]+dp[i,z,j,k];
end;
fillchar(dp[i],sizeof(dp[i]),0);
i:=1-i;
for j:=0 to 5 do
for k:=0 to 6 do
ans:=ans+dp[i,0,j,k];
end;
if ans<>0 then
writeln(ans)
else writeln('No answer');
close(output);
end.
