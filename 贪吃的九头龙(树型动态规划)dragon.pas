program dragon;
var
     tab:array[0..301,0..301]of longint;
     l,r,f:array[0..301]of integer;
     d:array[0..1,0..1]of integer;
     b:array[0..301]of boolean;
     dp:array[0..301,-1..301,0..1]of longint;
flag,x,y,z,i,j,k,n,m:longint;
procedure build(x:integer);
var
    i,y:integer;
begin
b[x]:=false;
y:=0;
for i:=1 to n do
if (b[i])and(i<>x)and(tab[x,i]<>flag) then
 begin
 f[i]:=x;
 if y=0 then
  begin  l[x]:=i;  y:=i;  end
 else
  begin  r[y]:=i;  y:=i;  end;
  build(i);
 end;
end;
function min(a,b:longint):longint;
begin if a>b then min:=b else min:=a;end;
procedure go(x:longint);
var i,j,z:longint;
 begin
 if l[x]<>0 then go(l[x]);
 if r[x]<>0 then go(r[x]);

 for i:=0 to k do
 for j:=0 to i do
 for z:=0 to 1 do
  begin
  dp[x,i,z]:=min(dp[l[x],j,1]+dp[r[x],i-j-1,z]+tab[f[x],x]*d[z,1],dp[x,i,z]);
  dp[x,i,z]:=min(dp[l[x],j,0]+dp[r[x],i-j,z]+tab[f[x],x]*d[z,0],dp[x,i,z]);
  end;
 end;
begin
 readln(n,m,k);
 if (k+m-1>n) then
  begin
  writeln(-1);
  halt;
  end;
 fillchar(tab,sizeof(tab),63);
 flag:=tab[0,0];
for i:=1 to n-1 do
 begin
 readln(x,y,z);
 tab[x,y]:=z;
 tab[y,x]:=z;
 end;
d[1,1]:=1;
d[1,0]:=0;
d[0,1]:=0;
d[0,0]:=0;
if m=2 then d[0,0]:=1;
fillchar(b,sizeof(b),true);
build(1);
fillchar(dp,sizeof(dp),63);
dp[0,0,0]:=0;
dp[0,0,1]:=0;
go(1);
if dp[l[1],k-1,1]=0 then writeln('kk');
writeln(dp[l[1],k-1,1]);
end.