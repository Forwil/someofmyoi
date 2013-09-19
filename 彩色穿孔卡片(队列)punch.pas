program punch;
var
    z:array[0..50000,0..2]of longint;
    b:array[0..50000]of boolean;
    t,w,tot,i,j,k,n,m,x,y,ww:longint;
begin
assign(input,'punch.in');reset(input);
assign(output,'punch.out');rewrite(output);
readln(n);
t:=1;
readln(x,y);
w:=1;
z[w,1]:=x;
z[w,2]:=y;
z[w,0]:=1;
for i:=2 to n do
begin
 readln(x,y);
 ww:=w;
   for j:=t to ww do
   if z[j,1]<>-1 then
   begin
   if (x>=z[j,2])or(y<=z[j,1]) then continue;
   if (x<=z[j,1])and(y>=z[j,2]) then
   begin z[j,1]:=-1;continue;end;
   if z[j,1]<x then
    begin
    w:=w+1;
    z[w,1]:=z[j,1];
    z[w,2]:=x;
    z[w,0]:=z[j,0];
    end;
   if z[j,2]>y then
    begin
    w:=w+1;
    z[w,1]:=y;
    z[w,2]:=z[j,2];
    z[w,0]:=z[j,0]
    end;
   z[j,1]:=-1;
   end;
 while z[t,1]=-1 do inc(t);
 w:=w+1;
 z[w,1]:=x;z[w,2]:=y;
 z[w,0]:=i;
end;
for i:=1 to w do
if (z[i,1]<>-1)and(b[z[i,0]]=false) then
 begin
 inc(tot);
 b[z[i,0]]:=true;
 end;
writeln(tot);
close(output);
end.