program happy;
var ind:array[0..1000001]of integer;
     c:array[-35000..35000]of longint;
     t,ans,ans0,w,i,j,k,n,m,x,y:longint;
begin
assign(input,'happy.in');reset(input);
assign(output,'happy.out');rewrite(output);
readln(n,k);
for i:=1 to n do
readln(ind[i]);
w:=1;
for i:=1 to n do
 begin
 if c[ind[i]]=0 then inc(t);
 inc(c[ind[i]]);
 while (c[ind[w]]>1)or(i-w+1>k) do
   begin
   if c[ind[w]]=1 then dec(t);
   dec(c[ind[w]]);
   inc(w);
   end;
 if t>ans then
   begin ans:=t; ans0:=i-w+1;   end
  else
  if (t=ans)and(i-w+1<ans0) then ans0:=i-w+1;
 end;
 writeln(ans,' ',ans0);
 close(output);
end.