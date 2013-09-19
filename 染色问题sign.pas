program sign;
var tab:Array[0..11,0..11]of boolean;
     a:array[0..11]of integer;
     xian:array[0..11,1..2]of integer;
    i,j,k,m,n,x,y,ans:longint;
    nn:boolean;

function can:boolean;
var i:longint;
begin
for i:=1 to m do
if (a[xian[i,1]]=1)and(a[xian[i,2]]=1) then  exit(false);
exit(true);
end;

procedure go(x,z:integer);
var i:longint;
begin
if x<=n then
 begin
  a[x]:=1;
  go(x+1,z+1);
  a[x]:=2;
  go(x+1,z);
 end
else if (can)and(z>ans) then ans:=z;
end;

begin
assign(input,'sign.in');reset(input);
assign(output,'sign.out');rewrite(output);
readln(m,n);
for i:=1 to m do
 begin
 readln(x,y);
 xian[i,1]:=x;
 xian[i,2]:=y;
 tab[x,y]:=true;
 tab[y,x]:=true;
 end;
go(1,0);
writeln(ans);
close(output);
end.
