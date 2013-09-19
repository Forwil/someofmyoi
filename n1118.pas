program n1118;
var b:array[0..201,0..201]of longint;
    dp:array[0..40,0..201]of longint;
    br:array[0..6]of boolean;
    ind:array[0..40]of string;
    s,ss:string;
    ans,z,x,o,i,j,k,n,m:longint;
function max(a,b:longint):longint;
begin if a>b then max:=a else max:=b;end;
begin
assign(input,'n1118.in');reset(input);
readln(o,k);
s:='';
for i:=1 to o do
 begin
 readln(ss);
 s:=s+ss;
 end;
readln(m);
for i:=1 to m do
 begin
 readln(ind[i]);
 for j:=i-1 downto 1 do
 if ind[i]=ind[j] then br[j]:=true;
 end;
n:=length(s);
for i:=n downto 1 do
for j:=i downto 1 do
 begin
 x:=0;
   for o:=1 to m do
    if (length(ind[o])+j-1<=i)and
    (copy(s,j,length(ind[o]))=ind[o])and(br[o]=false)then
    x:=x+1;
  b[j,i]:=b[j+1,i]+x;
 end;
for i:=1 to k do
for j:=i to n do
for z:=j-1 downto i-1 do
 begin
 dp[i,j]:=max(dp[i,j],dp[i-1,z]+b[z+1,j]);
 if i=k then ans:=max(ans,dp[i,j]);
 end;
writeln(ans);
end.
