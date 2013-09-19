program c9_4;
var dp:array[0..100000]of longint;
    pc:array[0..100000]of set of 0..255;
    ind:array[0..101]of integer;
   totw,i,j,k,n,m,s,sum:longint;
procedure out;
var i,j,o,t:longint;
begin
if dp[totw]>1 then writeln(-1);
if dp[totw]=0 then writeln(0);
if dp[totw]=1 then
begin
t:=0;

for i:=1 to n do
if not(i in pc[totw]) then inc(t);
o:=0;

for i:=1 to n do
if not(i in pc[totw])then
 begin
  inc(o);
  if o<t then write(i,' ')
  else writeln(i);
 end;
end;
halt;
end;
begin
assign(input,'c.in');reset(input);
readln(totw);
readln(n);
for i:=1 to n do
begin
 readln(ind[i]);
 sum:=sum+ind[i];
end;
if sum<totw then totw:=sum;

s:=0;
dp[0]:=1;
for i:=1 to n do
for j:=s downto 0 do
if (j+ind[i]<=totw)
and((dp[j]>0)or(j=0)) then
  begin
   dp[j+ind[i]]:=dp[j+ind[i]]+dp[j];
   pc[j+ind[i]]:=pc[j]+[i];
  if j+ind[i]>s then s:=j+ind[i];
  if dp[totw]>1 then out;
  end;

out;
end.
