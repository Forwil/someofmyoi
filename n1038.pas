program n1038;
var dp:Array[0..50,0..50]of longint;
    p:Array[0..50,0..50]of longint;
    ind:Array[0..50]of longint;
    sum:array[0..50,0..50]of longint;
    z,i,j,k,n,m:longint;
    ans:string;
function  go(i,j:longint):string;
var x,y,z:longint;
 s,ss,sss:string;
begin
s:='';
if i-j=0 then
 begin
 str(ind[i],s);
 exit(s);
 end;
if i-j=1 then
 begin
 str(ind[i],s);
 str(ind[j],ss);
 str(sum[i,j],sss);
 ans:=ans+' '+sss;
 exit('('+s+'+'+ss+')');
 end;
 str(sum[i,j],sss);
go:='('+go(i,p[i,j])+'+'+go(p[i,j]+1,j)+')';
ans:=ans+' '+sss;
end;
begin
assign(input,'n1038.in');reset(input);
readln(n);
ans:='';
fillchar(dp,sizeof(dp),63);
for i:=1 to n do
 begin
 read(ind[i]);
 dp[i,i]:=0;
 end;

for i:=1 to n do
for j:=i to n do
 sum[i,j]:=sum[i,j-1]+ind[j];

for i:=1 to n do
for j:=i-1 downto 1 do
 begin
  for z:=i-1 downto j do
  if dp[j,i]>dp[j,z]+dp[z+1,i] then
     begin
     dp[j,i]:=dp[j,z]+dp[z+1,i];
     p[j,i]:=z;
     end;
  dp[j,i]:=dp[j,i]+sum[j,i];
 end;
 writeln(go(1,n));
 writeln(dp[1,n]);
 delete(ans,1,1);
 writeln(ans);
end.
