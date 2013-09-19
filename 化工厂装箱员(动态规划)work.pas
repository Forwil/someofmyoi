program work;
const cost:array[1..7]of 0..3=(1,1,2,1,2,2,3);
var dp:Array[0..100,0..10,0..10,0..10]of integer;
   x,z,a,b,c,i,j,k,n,m,aa,bb,cc,r:longint;
   ch:char;
begin
assign(input,'work.in');reset(input);
assign(output,'work.out');rewrite(output);
readln(n);
fillchar(dp,sizeof(dp),$7f);
r:=dp[0,0,0,0];
dp[0,0,0,0]:=0;
for i:=1 to n do
 begin
 readln(ch);
 if ch='A' then AA:=1;
 if ch='B' then BB:=1;
 if ch='C' then CC:=1;
  for a:=0 to 10 do
  for b:=0 to 10-a do
  for c:=0 to 10-a-b do
  if (dp[i-1,a,b,c]<>r)and(a+aa+b+bb+c+cc<=10)then
  dp[i,a+aa,b+bb,c+cc]:=dp[i-1,a,b,c];

  for a:=0 to 10 do
  for b:=0 to 10-a do
  for c:=0 to 10-a-b do
  if dp[i,a,b,c]<>R then
  for z:=1 to 1 shl 3-1 do
  begin
  x:=dp[i,a,b,c];
  aa:=a*ord(4 and z=0);
  bb:=b*ord(2 and z=0);
  cc:=c*ord(1 and z=0);
  if dp[i,a,b,c]+cost[z]<dp[i,aa,bb,cc]then
     dp[i,aa,bb,cc]:=dp[i,a,b,c]+cost[z];
  end;
 aa:=0;bb:=0;cc:=0;
 end;
writeln(dp[n,0,0,0]);
close(output);
end.
