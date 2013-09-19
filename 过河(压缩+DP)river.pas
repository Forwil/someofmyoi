program river;
var ind:Array[0..101]of longint;
     b:Array[0..10500]of boolean;
     dp:array[0..10500]of integer;
    ans,st,en,i,j,k,n,m,l,now,r:longint;
begin
assign(input,'river.in');reset(input);
assign(output,'river.out');rewrite(output);
readln(l);
readln(st,en,n);
for i:=1 to n do
 read(ind[i]);
for i:=1 to n do
for j:=i+1 to n do
 if ind[i]>ind[j] then
   begin
   ind[0]:=ind[i];
   ind[i]:=ind[j];
   ind[j]:=ind[0];
   end;
now:=0;
ind[0]:=0;
if st=en then
 begin
  ans:=0;
  for i:=1 to n do
   if (ind[i]<=l)and(ind[i]mod st=0)then
   inc(ans);
   writeln(ans);
   close(output);
   halt;
 end;
for i:=1 to n do
if ind[i]<=l then
 begin
 if ind[i]-ind[i-1]>100 then  now:=now+100
 else now:=now+(ind[i]-ind[i-1]);
 b[now]:=true;
 end;
l:=now+101;
fillchar(dp,sizeof(dp),$7f);
r:=dp[0];
dp[0]:=0;
for i:=0 to l do
if dp[i]<>r then
 for j:=st to en do
    if dp[i]+ord(b[i+j])<dp[j+i] then
      dp[j+i]:=dp[i]+ord(b[i+j]);

    ans:=maxint;
for i:=l to l+100 do
  if dp[i]<ans then  ans:=dp[i];
  writeln(ans);
 close(output);
end.
