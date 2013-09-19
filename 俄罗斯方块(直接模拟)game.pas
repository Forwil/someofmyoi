program game;
var ind:array[0..101]of longint;
  ans,i,j,k,n,m,l:longint;
begin
assign(input,'game.in');reset(input);
assign(output,'game.out');rewrite(output);
readln(n,k);
for i:=1 to n do
read(ind[i]);
case k of

1:begin
  ans:=ans+n;
  for i:=1 to n-3 do
   if (ind[i]=ind[i+1])and(ind[i]=ind[i+2])and(ind[i]=ind[i+3]) then
    inc(ans);
  end;

2: for i:=1 to n-1 do
    if ind[i]=ind[i+1] then inc(ans);

3:  for i:=1 to n-1 do
   begin
   if ind[i]-ind[i+1]=1 then inc(ans);
   if i<=n-2 then
   if (ind[i+2]-ind[i+1]=1)and(ind[i]=ind[i+1]) then
   inc(ans);
   end;

4: for i:=1 to n-1 do
   begin
   if ind[i+1]-ind[i]=1 then inc(ans);
   if i<=n-2 then
   if (ind[i+1]=ind[i+2])and(ind[i]-ind[i+1]=1) then
   inc(ans);
   end;

5: for i:=1 to n-1 do
   begin
   if ind[i+1]-ind[i]=1 then inc(ans);
   if ind[i]-ind[i+1]=1 then inc(ans);
   if i<=n-2 then
    begin
    if (ind[i]=ind[i+2])and(ind[i]-ind[i+1]=1)then inc(ans);
    if (ind[i]=ind[i+1])and(ind[i+1]=ind[i+2])then inc(ans);
    end;
   end;

6:
  for i:=1 to n-1 do
   begin
   if ind[i]-ind[i+1]=2  then inc(ans);
   if ind[i]=ind[i+1] then inc(ans);
   if i<=n-2 then
    begin
    if (ind[i]=ind[i+1])and(ind[i]=ind[i+2]) then inc(ans);
    if (ind[i+1]=ind[i+2])and(ind[i+1]-ind[i]=1)then inc(ans);
    end;
   end;
7:
  for i:=1 to n-1 do
   begin
   if ind[i+1]-ind[i]=2 then inc(ans);
   if ind[i]=ind[i+1] then inc(ans);
    if i<=n-2 then
      begin
      if (ind[i]=ind[i+1])and(ind[i]=ind[i+2]) then inc(ans);
      if (ind[i]=ind[i+1] )and(ind[i]-ind[i+2]=1)then inc(ans);
      end;
   end;
end;
writeln(ans);
close(output);
end.