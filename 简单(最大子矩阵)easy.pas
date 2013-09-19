program easy;
var ind:array[0..1001,0..1001]of byte;
    h,l,r:array[0..1001]of integer;
    i,j,k,n,m,ans:longint;
begin
assign(input,'easy.in');reset(input);
assign(output,'easy.out');rewrite(output);
readln(n,m);
for i:=1 to n do
 begin
  for j:=1 to m do
   begin
    read(ind[i,j]);
    if ind[i,j]=0 then h[j]:=h[j]+1 else h[j]:=0;
    k:=j;
    while (h[k-1]>=h[j])and(k>1) do k:=l[k-1];
    l[j]:=k;
   end;
   readln;
  for j:=m downto 1 do
   begin
    k:=j;
    while (h[k+1]>=h[j])and(k<m) do k:=r[k+1];
    r[j]:=k;
    if h[j]*(r[j]-l[j]+1)>ans then
      ans:=h[j]*(r[j]-l[j]+1);
   end;
 end;
 writeln(ans);
close(output);
end.