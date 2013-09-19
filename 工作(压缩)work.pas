program work;
var  dp:array[0..50,0..500]of boolean;
     ind:array[1..50,1..2]of integer;
     date:array[0..50,0..2]of integer;
     wo:array[1..24,0..8]of integer;
i,j,k,m,n,t,z:longint;
procedure kuaipai(i,j:longint);
var x,y,z,zz:longint;
begin
x:=i;
y:=j;
z:=date[(x+y)shr 1,1];
zz:=date[(x+y)shr 1,0];
repeat
 while (z<date[y,1])or((z=date[y,1])and(date[y,0]>zz)) do dec(y);
 while (z>date[x,1])or((z=date[X,1])and(date[x,0]<zz)) do inc(x);
  if x<=y then
  begin
  date[0]:=date[x];
  date[x]:=date[y];
  date[y]:=date[0];
  inc(x);dec(y);
  end;
until x>y;
if x<j then kuaipai(x,j);
if y>i then kuaipai(i,y);
end;
begin
assign(input,'work.in');
reset(input);
assign(output,'work.out');
rewrite(output);
readln(t);
for k:=1 to t do
 begin
 readln(n);
 for i:=1 to  n do
  begin
  read(ind[i,1],ind[i,2]);
  read(wo[i,0]);
  for j:=1 to wo[i,0] do
   read(wo[i,j]);
  end;
  readln;
  for i:=1 to n do
  begin
   date[i*2-1,0]:=0;
   date[i*2-1,1]:=ind[i,1];
   date[i*2-1,2]:=i;
   date[i*2,0]:=1;
   date[i*2,1]:=ind[i,2];
   date[i*2,2]:=i;
  end;
  n:=n*2;
  kuaipai(1,n);
  fillchar(dp,sizeof(dp),false);
  dp[0,0]:=true;

  for i:=1 to n do
   for j:=0 to(1 shl 8)-1 do
    begin
     for z:=1 to wo[date[i,2],0] do
      begin
      if (date[i,0]=0)and((j and(1 shl(wo[date[i,2],z]-1)))<>0) then
      if dp[i-1,j xor(1 shl(wo[date[i,2],z]-1))]=true then
      dp[i,j]:=true;
      if (date[i,0]=1)and((j and (1 shl(wo[date[i,2],z]-1)))=0) then
      if dp[i-1,j or(1 shl(wo[date[i,2],z]-1))]=true then
      dp[i,j]:=true;
      end;
    end;
  if dp[n,0] then writeln('YES')
  else writeln('NO');
 end;
 close(output);
end.
