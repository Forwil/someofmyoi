program paste;
var
   a,b,c:array[0..100000]of longint;
   now,i,j,k,n,m,x,y,z:longint;
begin
assign(input,'paste.in');reset(input);
assign(output,'paste.out');rewrite(output);
readln(n,m);
for i:=1 to m do
readln(a[i],b[i],c[i]);

for i:=1 to 10 do
 begin
 now:=i;
  for j:=m downto 1 do
  begin
   if (c[j]>=now)and(b[j]<now+(b[j]-a[j]+1)) then now:=now+(b[j]-a[j]+1)
   else
   if (c[j]<now)and(c[j]+(b[j]-a[j]+1)>=now) then now:=a[j]+(now-c[j]-1)
   else
   if (c[j]<now)and(a[j]>now-(b[j]-a[j]+1)) then now:=now-(b[j]-a[j]+1);
  end;
 writeln(now);
 end;
 close(output);
end.
