program compony;
var a:array[0..10,0..10]of longint;
    i,j,k,n,m,ans:longint;
begin
assign(input,'company.in');reset(input);
assign(output,'company.out');rewrite(output);
readln(n,m);
if (n<5)and(m<5) then ans:=0
else
if (n>=5)and(m<5) then ans:=(n div 5)*m
else
if (m>=5)and(n<5) then ans:=(m div 5)*n
else
begin
ans:=n*(m div 5)+m*(n div 5)-1;
dfs()
end;
writeln(ans);
close(output);
end.
