program game;
var cost:Array[0..51,0..51]of longint;
      min,max:Array[0..51,0..51,0..10]of longint;
     dat,sum:Array[0..51]of longint;
   z,x,i,j,k,n,m,ans1,ans2:longint;
begin
assign(input,'game.in');reset(input);
assign(output,'game.out');rewrite(output);
readln(n,m);
for i:=1 to n do
 begin
 readln(dat[i]);
 sum[i]:=sum[i-1]+Dat[i];
 end;
ans1:=maxlongint;
for i:=1 to n do
for j:=i to n do
begin
 cost[i,j]:=sum[j]-sum[i-1];
 while cost[i,j]<0 do cost[i,j]:=cost[i,j]+10;
 cost[i,j]:=cost[i,j] mod 10;
end;
for i:=0 to n do
for j:=0 to n do
for z:=0 to m do
min[i,j,z]:=100000000;

for i:=1 to n do
begin
for j:=i to n do
begin
min[i,j,1]:=cost[i,j];
max[i,j,1]:=cost[i,j];
if (2=m)and((i<>1)or(j<>n)) then
 begin
 x:=cost[1,i-1]+cost[j+1,n];
 while x<0 do inc(x,10);
 x:=x mod 10;
 if min[i,j,1]*x<ans1 then ans1:=min[i,j,1]*x;
 if max[i,j,1]*x>ans2 then ans2:=max[i,j,1]*x;
 end;
end;
for k:=2 to m do
for j:=i+1 to n do
for z:=i to j-1 do
begin
if min[i,z,k-1]*cost[z+1,j]<min[i,j,k]then
min[i,j,k]:=min[i,z,k-1]*cost[z+1,j];
if max[i,z,k-1]*cost[z+1,j]>max[i,j,k]then
max[i,j,k]:=max[i,z,k-1]*cost[z+1,j];
if (k=m-1)and((i<>1)or(j<>n)) then
 begin
 x:=cost[1,i-1]+cost[j+1,n];
 while x<0 do inc(x,10);
 x:=x mod 10;
 if min[i,j,k]*x<ans1 then ans1:=min[i,j,k]*x;
 if max[i,j,k]*x>ans2 then ans2:=max[i,j,k]*x;
 end;
end;
end;
if m=1 then
begin
ans1:=cost[1,n];
ans2:=cost[1,n];
end;
writeln(ans1);
writeln(ans2);
close(output);
end.