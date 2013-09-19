program canoe;
var dat:array[0..30001]of integer;
   ans,i,j,k,n,m:longint;

procedure sort(i,j:longint);
var x,y,z:longint;
begin
x:=i;y:=j;z:=dat[(x+y)shr 1];
repeat
while z<dat[y] do dec(y);while z>dat[x] do inc(x);
if x<=y then
begin
dat[0]:=dat[x];dat[x]:=dat[y];dat[y]:=dat[0];
inc(x);dec(y);
end;
until x>y;
if i<y then sort(i,y);
if x<j then sort(x,j);
end;

begin
assign(input,'canoe.in');reset(input);
assign(output,'canoe.out');rewrite(output);
readln(m);
readln(n);
for i:=1 to n do
readln(dat[i]);
sort(1,n);
j:=1;
for i:=n downto 1 do
 begin
 if j=i then break;
 if dat[i]+dat[j]<=m then
  begin
  j:=j+1;
  ans:=ans+1;
  if j=i then break;
  end;
 end;
writeln(n-ans);
close(output);
end.
