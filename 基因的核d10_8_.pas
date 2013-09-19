program d10_8_;
var s:array[0..101]of ansistring;
   p,dp:array[0..501,0..501]of longint;
  i,j,k,n,m:longint;
  s1:string;
function get(s1,s2:ansistring):ansistring;
var s3:ansiString;
 x,y,z,i:longint;
begin
s3:='';
x:=length(s1);
y:=length(s2);
while p[x,y]<>0 do
 begin
 if p[x,y]=3 then
 begin s3:=s1[x]+s3;x:=x-1;y:=y-1;end else
 if p[x,y]=2 then
 x:=x-1
 else y:=y-1;
 end;
exit(s3);
end;
function go(s1,s2:ansistring):ansistring;
var i,j:longint;
s3:ansistring;
begin
{if t+1<w then
 begin
   s1:=go(t,(t+w)shr 1);
   s2:=go((t+w)shr 1+1,w);
 end;
if t+1=w then
 begin
 s1:=s[t];
 s2:=s[w];
 end;
if t=w then exit(s[w]);}
dp[0,0]:=0;dp[1,0]:=0;dp[0,1]:=0;
for i:=1 to length(s1) do
for j:=1 to length(s2) do
begin
 if s1[i]=s2[j]then
 begin dp[i,j]:=dp[i-1,j-1]+1;  p[i,j]:=3; continue;end;
 if dp[i-1,j]>dp[i,j-1] then
 begin dp[i,j]:=dp[i-1,j];p[i,j]:=2;end
 else
 begin dp[i,j]:=dp[i,j-1];p[i,j]:=1;end;
end;
exit(get(s1,s2));
end;
begin
readln(n);
for i:=1 to n do
readln(s[i]);
for i:=1 to n do
for j:=i+1 to n do
 if s[i]>s[j] then
 begin
 s[0]:=s[i];
 s[i]:=s[j];
 s[j]:=s[0];
 end;

 s1:=s[1];
for i:=2 to n do
  s1:=go(s1,s[i]);
writeln(length(s1));
end.
