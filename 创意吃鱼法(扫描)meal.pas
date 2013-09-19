program meal;
var sum:array[0..2501,0..2501]of longint;
    l,r:array[0..1,0..2501]of longint;
    d:array[0..2501]of 0..1;
   i,j,k,n,m,x,ans,now,last:longint;
begin
assign(input,'meal.in');reset(input);
assign(output,'meal.out');rewrite(output);
readln(n,m);
for i:=1 to n do
 begin
 now:=i and 1;
 last:=1-now;
  for j:= 1 to m do
   begin
   read(d[j]);
   sum[i,j]:=sum[i-1,j]+sum[i,j-1]-sum[i-1,j-1]+d[j];
   if d[j]=1 then
    begin
     l[now,j]:=l[last,j-1]+1;
     k:=sum[i,j]-sum[i,j-l[now,j]]-sum[i-l[now,j],j]+sum[i-l[now,j],j-l[now,j]];
    while k<>l[now,j] do
      begin
       dec(l[now,j]);
       k:=sum[i,j]-sum[i,j-l[now,j]]-sum[i-l[now,j],j]+sum[i-l[now,j],j-l[now,j]];
      end;
      if k>ans then ans:=k;
    end
    else l[now,j]:=0;
   end;
   readln;
 for j:=m downto 1 do
   begin
   if d[j]=1 then
     begin
     r[now,j]:=r[last,j+1]+1;
     k:=sum[i,j+r[now,j]-1]-sum[i,j-1]-sum[i-r[now,j],j+r[now,j]-1]+sum[i-r[now,j],j-1];
     while k<>r[now,j] do
      begin
      dec(r[now,j]);
      k:=sum[i,j+r[now,j]-1]-sum[i,j-1]-sum[i-r[now,j],j+r[now,j]-1]+sum[i-r[now,j],j-1];
      end;
     if k>ans then ans:=k;
     end
     else r[now,j]:=0;
   end;
end;
writeln(ans);
close(output);
end.
