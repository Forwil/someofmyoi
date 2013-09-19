program b9_18;
var dp:array[0..200]of longint;
    p:Array[0..200]of set of byte;
    i,j,k,n,m:longint;
function get(i,j:longint):longint;
var o,z:longint;
    su:set of byte;
begin
z:=0;
su:=p[i]+p[j];
for o:=1 to n do
  if o in su then inc(z);
  exit(z);
end;
begin
assign(input,'chain.in');reset(input);
assign(output,'chain.out');rewrite(output);
readln(n);
dp[1]:=1;
for i:=1 to n do
 begin
 p[i]:=p[i]+[i];
  for j:=i downto 1 do
  if (dp[i+j]=0)or(dp[i+j]>get(i,j)) then
    begin
    dp[i+j]:=get(i,j);
    p[i+j]:=p[j]+p[i];
    end;
 end;
 for i:=1 to n-1 do
 if i in p[n] then write(i,' ');
 writeln(n);
 close(output);
end.

