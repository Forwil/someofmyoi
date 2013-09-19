program vijos4_1;
var ind:array[0..1501]of longint;
   c,max,min,i,j,k,n,l,m:longint;
    can:boolean;
begin
assign(input,'silver.in');
reset(input);
assign(output,'silver.out');
rewrite(output);
readln(n,ind[1],k);
max:=ind[1];
min:=ind[1];
for i:=2 to n do
 begin
 read(ind[i]);
 if ind[i]>max then max:=ind[i];
 if ind[i]<min then min:=ind[i];
 end;
 c:=max-min;
 can:=true;
 if c>2*k then
  begin
  l:=min+k;
  m:=max-k;
  for i:=1 to n do
   if (ind[i]>l)and(ind[i]<m) then
   begin
   can:=false;
   break;
   end;
  end;
if can then writeln('Yes')
else writeln('No');
close(output);
end.
