program format;
var dat:array[0..10001]of integer;
     dp:array[0..10001]of longint;
     cost:array[0..80,0..80]of longint;
   z,s,i,j,k,n,m,t:longint;
   ch:char;
function min(a,b:longint):longint;
begin if a>B then min:=b else min:=a;end;
begin
assign(input,'format.in');reset(input);
assign(output,'format.out');rewrite(output);
readln(m);
t:=0;
n:=0;
while not(eof) do
 begin
 read(ch);
 if (ord(ch)>=33)and(ord(ch)<=126)then
  t:=t+1
 else
  if t<>0 then
   begin
   n:=n+1;
   dat[n]:=t;
   t:=0;
   end;
 end;

fillchar(cost,sizeof(cost),63);

for i:=1 to 80 do
begin
cost[1,i]:=(i-1)*(i-1);
cost[0,i]:=500;
end;
cost[0,0]:=0;
for i:=2 to 80 do
for j:=i to 80 do
for z:=j-1 downto i-1 do
cost[i,j]:=min(cost[i,j],cost[i-1,z]+(j-z-1)*(j-z-1));

for i:=1 to n do
 begin
 s:=0;
 for j:=i-1 downto 0 do
  begin
  s:=s+dat[j+1];
  if i-j+s-1>m then break;
  dp[i]:=min(dp[i],dp[j]+cost[i-j-1,m-s]);
  end;
 end;

 writeln('Minimal badness is ',dp[n],'.');
 close(output);
end.
