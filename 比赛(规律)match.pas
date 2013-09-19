program match;
var tab:array[0..500,0..500]of longint;
    a,t:Array[0..500]of longint;
    x,i,j,k,n,m,tt:longint;
begin
assign(input,'match.in');reset(input);
assign(output,'match.out');rewrite(output);
readln(n,m,tt);
for i:=1 to n do
 begin
 readln(x);
 tab[m,i]:=x;
 tab[x,i]:=m;
 t[x]:=i;
 end;
for i:=1 to n do
 if tab[m,i]=m then break;
j:=1;
repeat
a[j]:=tab[m,i];
i:=i mod n +1;
j:=j+1;
until j>n;

for i:=1 to n do
begin
j:=1;
repeat
tab[i,t[i]]:=a[j];
j:=j+1;
t[i]:=t[i] mod n+1;
until j>n;
end;
for i:=1 to n-1 do
write(tab[i,tt],' ');
writeln(tab[n,tt]);
close(output);
end.
