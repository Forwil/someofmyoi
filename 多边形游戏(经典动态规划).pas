program a10_29;
var dp1,dp2:array[0..101,0..101]of longint;
    dat:Array[0..101]of longint;
     f:Array[0..101]of char;
    ans1,ans2,z,i,j,k,m,n:longint;
function max(a,b:longint):longint;
begin if a>B then max:=a else max:=b;end;
function min(a,b:longint):longint;
begin if a>B then min:=b else min:=a;end;
begin

readln(n);
for i:=1 to n do
 read(f[i]);
for i:=1 to n do
 read(dat[i]);
for i:=n+1 to n*2 do
 begin
 dat[i]:=dat[i-n];
 f[i]:=f[i-n];
 end;
fillchar(dp2,sizeoF(dp2),63);
fillchar(dp1,sizeof(dp1),$f7);
for i:=1 to n*2 do
 begin
 dp1[i,i]:=dat[i];
 dp2[i,i]:=dat[i];
 end;

for i:=2 to n*2 do
for j:=i-1 downto 1 do
for z:=i-1 downto j do
 begin
 if f[z]='+' then
   begin
   dp1[j,i]:=max(dp1[j,z]+dp1[z+1,i],dp1[j,i]);
   dp2[j,i]:=min(dp2[j,z]+dp2[z+1,i],dp2[j,i]);
   end;
 if f[z]='*' then
   begin
   dp1[j,i]:=max(dp1[j,z]*dp1[z+1,i],dp1[j,i]);
   dp2[j,i]:=min(dp2[j,z]*dp2[z+1,i],dp2[j,i]);
   end;
 end;
 ans2:=maxlongint;
 ans1:=-maxlongint;
for i:=1 to n do
 begin
 ans2:=min(ans2,dp2[i,i+n-1]);
 ans1:=max(ans1,dp1[i,i+n-1]);
 end;
 writeln(ans1);
 writeln(ans2);
 close(output);
end.
