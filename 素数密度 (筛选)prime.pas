program prime;
var   p:Array[0..10000]of longint;
   pass:array[0..1000001]of boolean;
   ans,l,i,j,k,n,m,tot:longint;
   is:boolean;
   t,r:int64;
begin
assign(input,'prime.in');reset(input);
assign(output,'prime.out');rewrite(output);
readln(l,r);
p[1]:=2;
tot:=1;
for i:=3 to 60000 do
 begin
 is:=true;
 for j:=1 to tot do
  begin
  if p[j]>trunc(sqrt(i)) then break;
  if i mod p[j]=0 then
    begin
    is:=false;
    break;
    end;
  end;

 if is then
  begin
  tot:=tot+1;
  p[tot]:=i;
  end;
end;

for i:=1 to tot do
if p[i]*2<=r then
 begin
 if p[i]<l then t:=(l div p[i])*p[i]
 else t:=p[i]*2;

 while t<=r do
  begin
  if t>=l then pass[t-l]:=true;
  t:=t+p[i];
  end;
 end
else break;

for i:=0 to r-l do
if (not pass[i])and(i+l<>1)and(i+l<>0)then inc(ans);
writeln(ans);
close(output);
end.
