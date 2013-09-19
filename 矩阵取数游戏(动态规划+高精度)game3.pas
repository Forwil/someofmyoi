program game;
type node=array[0..50]of longint;
var dp:array[0..81,0..81]of node;
    ind:Array[0..81]of longint;
    e:array[0..81]of node;
    n,t,i,j,k,m:longint;
    ans,x,y,mm:node;
function max(a,b:node):node;
var i:longint;
begin
if a[0]>b[0] then exit(a);
if a[0]<b[0] then exit(b);
i:=a[0];
while (a[i]=b[i])and(i>=1) do dec(i);
if i=0 then exit(a);
if a[i]>b[i] then exit(a);
if a[i]<b[i] then exit(b);
end;
function c(s1:node;x:longint):node;
var i,j:longint;
begin
fillchar(c,sizeof(c),0);
c[0]:=s1[0];
for i:=1 to s1[0] do
 c[i]:=s1[i]*x;
for i:=1 to s1[0] do
 begin
 c[i+1]:=c[i+1]+c[i] div 100000;
 c[i]:=c[i] mod 100000;
 end;
while c[c[0]+1]<>0 do
 begin
 inc(c[0]);
 inc(c[c[0]+1],c[c[0]] div 100000);
 c[c[0]]:=c[c[0]] mod 100000;
 end;
end;

function ar(s1,s2:node):node;
var i,j:longint;
begin
j:=0;
fillchar(ar,sizeof(ar),0);
if s1[0]>s2[0] then ar[0]:=s1[0]
else ar[0]:=s2[0];

for i:=1 to ar[0] do
 begin
 ar[i]:=(j+s1[i]+s2[i]) mod 100000;
 j:=(j+s1[i]+s2[i])div 100000;
 end;
if j<>0 then
 begin
 ar[0]:=ar[0]+1;
 ar[ar[0]]:=j;
 end;
end;

begin
assign(input,'game.in');reset(input);
assign(output,'game.out');rewrite(output);
readln(n,m);
e[0,0]:=1;
e[0,1]:=1;
for i:=1 to m do
 e[i]:=c(e[i-1],2);

for t:=1 to n do
 begin
 for i:=1 to m do
  read(ind[i]);

 for i:=1 to m do
  for j:=m downto i do
   begin
   x:=ar(dp[i-1,j],c(e[i+m-j-1],ind[i-1]));
   y:=ar(dp[i,j+1],c(e[i+m-j-1],ind[j+1]));
   dp[i,j]:=max(x,y);
   end;
   mm[0]:=0;

 for i:=1 to m do
 mm:=max(mm,ar(dp[i,i],c(e[m],ind[i])));
 ans:=ar(ans,mm);
 end;
 write(ans[ans[0]]);
 for i:=ans[0]-1 downto 1 do
 begin
 if ans[i]<10000then write('0');
 if ans[i]<1000then write('0');
 if ans[i]<100 then write('0');
 if ans[i]<10  then write('0');
 write(ans[i]);
 end;
 writeln;
 close(output);
end.
