program vote;
var ind:Array[0..1001]of longint;
    xd:array[0..1001,0..1001]of integer;
    b:array[1..1001]of boolean;
    i,j,k,n,m,min:longint;
begin
assign(input,'vote.in');reset(input);
assign(output,'vote.out');rewrite(output);
 readln(n,m);
 for i:=1 to m do
 for j:=1 to n do
 begin
 read(xd[i,j]);
 if j=n then readln;
 xd[i,0]:=1;
 end;
 fillchar(b,sizeof(b),true);
for i:=1 to n do
 begin
 fillchar(ind,sizeof(ind),0);
  for j:=1 to m do
   begin
   xd[j,0]:=1;
   while (xd[j,0]<=n)and(b[xd[j,xd[j,0]]]=false) do
      inc(xd[j,0]);

   if xd[j,0]<=n then
    inc(ind[xd[j,xd[j,0]]]);
  end;
   min:=maxlongint;
  for j:=n downto 1 do
   if (b[j])and(ind[j]<min) then
     begin
     min:=ind[j];
     k:=j;
     end;
  b[k]:=false;
  writeln(k);
 end;
 close(output);
end.
