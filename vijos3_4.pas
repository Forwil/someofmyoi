program vijos3_4;
var ind:array[0..1001,0..2001]of char;
    tot,jj,ii,o,x,y,i,j,k,n,m,ans:longint;
begin
assign(input,'vijos3_4.in');
reset(input);
readln(n);
for i:=1 to n+1 do
begin
for j:=1 to n*2+1 do
 read(ind[i,j]);
readln;
end;
i:=1;
j:=1;
while (i<=n+1) do
  begin
   x:=i+1;
   y:=j+2;
   while x<=n+1 do
    begin
    if y>2*n+1 then y:=j+2;
    tot:=0;
    for o:=i to x do
      begin
       if ind[o,j]='|' then inc(tot);
       if ind[o,y]='|' then inc(tot);
      end;
    for o:=j to y do
      begin
       if ind[x,o]='_' then inc(tot);
       if ind[i,o]='_' then inc(tot);
      end;
    if tot=(x-i)*2+((y-1)-(j-1))-1 then
     inc(ans);
    x:=x+1;
    y:=y+2;
    end;
   j:=j+2;
   if j>2*n+1 then
   begin
   j:=1;
   i:=i+1;
   end;
  end;
  writeln(ans);
end.

