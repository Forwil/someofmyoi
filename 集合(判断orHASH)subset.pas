program subset;
var ind:array[0..100000,1..2]of longint;
    i,j,k,n,m:longint;
    b,a,c,d:boolean;
    s:string;
procedure sort(i,j,l:longint);
var x,y,z,o:longint;
begin
x:=i;
y:=j;
z:=ind[(x+y)shr 1,l];
repeat
while z<ind[y,l] do dec(y);
while z>ind[x,l] do inc(x);
if x<=y then
 begin
 o:=ind[x,l];
 ind[x,l]:=ind[y,l];
 ind[y,l]:=o;
  inc(x);dec(y);
 end;
until x>y;
if x<j then sort(x,j,l);
if i<y then sort(i,y,l);
end;
begin
assign(input,'subset.in');reset(input);
assign(output,'subset.out');rewrite(output);
read(ind[0,1]);
for i:=1 to ind[0,1] do
read(ind[i,1]);
readln;
read(ind[0,2]);
for i:=1 to ind[0,2] do
read(ind[i,2]);
close(input);
sort(1,ind[0,1],1);
sort(1,ind[0,2],2);
i:=1;
j:=1;
b:=true;
a:=true;
c:=true;
d:=false;
while (i<=ind[0,1])and(j<=ind[0,2]) do
 begin
 if ind[i,1]=ind[j,2] then
          begin
          inc(i);
          inc(j);
          d:=true;
          end
  else
   begin
   a:=false;
   if ind[i,1]>ind[j,2] then
       begin
       inc(j);
       c:=false;
       end
   else
       begin
       inc(i);
       b:=false;
       end;
   end;
 end;
 if ind[0,1]>ind[0,2] then b:=false;
 if ind[0,2]>ind[0,1] then c:=false;
 if i<=ind[0,1] then b:=false;
 if j<=ind[0,2] then c:=false;
 if (a)and(ind[0,1]=ind[0,2]) then writeln('A equals B')
else
 begin
 if (d)and(b)and(not(c)) then
     writeln('A is a proper subset of B');
 if (d)and(c)and(not(b)) then
     writeln('B is a proper subset of A');
 if not(d) then
     writeln('A and B are disjoint');
 if (not(a))and(not(c))and(not(b))and(d) then
    begin
    writeln('I'''+'m confused!');
    end;
 end;
close(output);
end.