program gallery;
var dp:array[0..101,0..10*60]of longint;
    time,v,l,r:array[0..101]of longint;
   i,j,k,n,m,t:longint;

procedure init;
var x,id:integer;
begin
n:=n+1;
id:=n;
read(x);
time[id]:=x;
read(x);
if x=0 then
 begin
 l[id]:=n+1;
 init;
 r[id]:=n+1;
 init;
 end
else v[id]:=x;
end;
procedure go(x,mt:integer);
var i,j:integer;
begin
 if l[x]<>0 then go(l[x],mt-time[x]*2);
 if r[x]<>0 then go(r[x],mt-time[x]*2);
 if (l[x]=0)and(r[x]=0) then
 begin
  for i:=1 to v[x] do
  if i*5<=mt-time[x]*2 then
  dp[x,i*5+time[x]*2]:=i else break;
  for j:=1 to mt do
  if dp[x,j]<dp[x,j-1]then
    dp[x,j]:=dp[x,j-1];
  exit;
 end;
for i:=0 to mt-time[x]*2 do
for j:=0 to i do
if dp[x,i+time[x]*2]< dp[l[x],j]+dp[r[x],i-j]then
   dp[x,i+time[x]*2]:=dp[l[x],j]+dp[r[x],i-j];
end;
begin
assign(input,'gallery.in');reset(input);
assign(output,'gallery.out');rewrite(output);
readln(t);
n:=0;
init;
go(1,t);
writeln(dp[1,t-1]);
close(output);
end.