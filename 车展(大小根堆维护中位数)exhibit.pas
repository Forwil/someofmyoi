program exhibit;
var  dat:array[0..1001]of longint;
 min,max:Array[0..1001]of longint;
     ans:array[0..1001,0..1001]of qword;
    x,y,z,i,j,n,m,tmin,tmax:longint;
    out,k:qword;
    smax,smin:int64;
procedure dmin(i:integer);
var j:integer;
begin
 j:=i*2;
while j<=tmin  do
 begin
  if (min[j+1]<min[j])and(j<tmin)then j:=j+1;
  if min[i]>min[j]then
   begin
   min[0]:=min[i];
   min[i]:=min[j];
   min[j]:=min[0];
   i:=j;
   j:=i*2;
   end
  else exit;
 end;
end;

procedure dmax(i:integer);
var j:integer;
begin
j:=i*2;
 while j<=tmax do
  begin
   if (max[j]<max[j+1])and(J<tmax)then j:=j+1;
   if max[j]>max[i]then
   begin
   max[0]:=max[i];
   max[i]:=max[j];
   max[j]:=max[0];
   i:=j;
   j:=i*2;
   end
  else exit;
end;
end;

procedure umin(i:integer);
var j:integer;
begin
j:=i shr 1;
while j<>0 do
 if min[i]<min[j]then
  begin
  min[0]:=min[i];
  min[i]:=min[j];
  min[j]:=min[0];
  i:=j;
  j:=i shr 1;
  end
 else exit;
end;

procedure umax(i:integer);
var j:integer;
begin
j:=i shr 1;
while j<>0 do
 if max[i]>max[j]then
  begin
  max[0]:=max[i];
  max[i]:=max[j];
  max[j]:=max[0];
  i:=j;
  j:=i shr 1;
  end
 else exit;
end;

begin
assign(input,'exhibit.in');reset(input);
assign(output,'exhibit.out');rewrite(output);
readln(n,m);
for i:=1 to n do
 read(dat[i]);
for i:=1 to n do
begin
tmin:=0;smin:=0;
tmax:=0;smax:=0;
for j:=i to n do
begin
if tmin=tmax then
 begin
 tmin:=tmin+1;
 min[tmin]:=dat[j];
 smin:=smin+dat[j];
 umin(tmin);
 end
else
 begin
 tmax:=tmax+1;
 max[tmax]:=dat[j];
 smax:=smax+Dat[j];
 umax(tmax);
 end;
while (min[1]<max[1])and(tmin>=1)and(tmax>=1) do
 begin
 smax:=smax-max[1]+min[1];
 smin:=smin-min[1]+max[1];
 min[1]:=max[1]xor min[1];
 max[1]:=max[1]xor min[1];
 min[1]:=max[1]xor min[1];
 dmin(1);dmax(1);
 end;

if tmax<>0 then
  ans[i,j]:=tmax*min[1]-smax;
if tmin<>1 then
  ans[i,j]:=(smin-min[1])-min[1]*(tmin-1)+ans[i,j];
  k:=ans[i,j];
end;
end;
for i:=1 to m do
 begin
 readln(x,y);
 inc(out,ans[x,y]);
 end;
writeln(out);
close(output);
end.
