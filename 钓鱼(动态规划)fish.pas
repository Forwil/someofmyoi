program fish;
var dp:array[0..30,0..16*12*2]of longint;
    f,d,t:array[0..30]of longint;
ans,s,v,n,h,i,j,k,m,l:longint;

function max(a,b:longint):longint;
begin if a>b then max:=a else max:=b;end;

begin
assign(input,'input.txt');reset(input);
assign(output,'output.txt');rewrite(output);
readln(n);
readln(h);
h:=h*12;
for i:=1 to n do
 read(f[i]);
for i:=1 to n do
 read(d[i]);
for i:=2 to n do
 read(t[i]);
dp[0,0]:=1;
for i:=1 to n do
for j:=0 to h-t[i] do
if (dp[i-1,j]<>0) then
 begin
  v:=f[i];
  s:=0;
  l:=1;
  dp[i,j+t[i]]:=max(dp[i,j+t[i]],dp[i-1,j]);
  while (v>0)and(j+l+t[i]<=h) do
   begin
   s:=s+v;
   dp[i,j+l+t[i]]:=max(dp[i,l+j+t[i]],dp[i-1,j]+s);
   v:=v-d[i];
   l:=l+1;
   end;
 end;
for i:=1 to n do
for j:=0 to h do
ans:=max(ans,dp[i,j]);
writeln(ans-1);
close(output);
end.
