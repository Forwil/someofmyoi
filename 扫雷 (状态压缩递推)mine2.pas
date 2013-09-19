program mine2;
var dp:array[0..1,0..3,1..3]of longint;
   dat:array[0..10000]of integer;
 i,j,k,n,m,now,ans:longint;
begin
assign(input,'mine.in');reset(input);
assign(output,'mine.out');rewrite(output);
readln(n);
for i:=1 to n do
 read(dat[i]);
if dat[1]=1 then
  begin
  dp[1,1,1]:=1;
  dp[1,1,2]:=1;
  end;
if dat[1]=2 then
  dp[1,2,1]:=1;
if dat[1]=0 then
  dp[1,0,1]:=1;

for i:=2 to n do
 begin
 now:= i and 1;
fillchar(dp[now],sizeof(dp[now]),0);
 if dat[i]=1 then
   begin
   if dat[i-1]=1 then
     begin
     dp[now,1,1]:=dp[1-now,1,3];
     dp[now,1,2]:=dp[1-now,1,1];
     dp[now,1,3]:=dp[1-now,1,2];
     end;
   if dat[i-1]=2 then
     begin
     dp[now,1,2]:=dp[1-now,2,3];
     dp[now,1,3]:=dp[1-now,2,2];
     end;
   if dat[i-1]=0 then
     dp[now,1,1]:=dp[1-now,0,1];
   end;

 if dat[i]=2 then
   begin
   if dat[i-1]=1 then
     begin
     dp[now,2,1]:=dp[1-now,1,1];
     dp[now,2,3]:=dp[1-now,1,2];
     end;
   if dat[i-1]=2 then
     begin
     dp[now,2,1]:=dp[1-now,2,3];
     dp[now,2,2]:=dp[1-now,2,1];
     dp[now,2,3]:=dp[1-now,2,2];
     end;
   if dat[i-1]=3 then
     dp[now,2,2]:=dp[1-now,3,1];
   end;

 if dat[i]=3 then
  begin
  if dat[i-1]=2 then
   dp[now,3,1]:=dp[1-now,2,1];
  if dat[i-1]=3 then
   dp[now,3,1]:=dp[1-now,3,1];
  end;

 if dat[i]=0 then
  begin
  if dat[i-1]=1 then
   dp[now,0,1]:=dp[1-now,1,3];
  if dat[i-1]=0 then
   dp[now,0,1]:=dp[1-now,0,1];
  end;
 end;

if dat[n]=1 then
ans:=dp[n and 1,1,2]+dp[n and 1,1,3];

if dat[n]=2 then
ans:=dp[n and 1,2,2];

if dat[n]=0 then
ans:=dp[n and 1,0,1];

writeln(ans);
close(output);
end.
