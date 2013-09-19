program fbi;
var l,r:array[0..2002]of integer;
     s:ansistring;
     i,j,k,n,m,ans:longint;
begin
assign(input,'fbi.in');reset(input);
assign(output,'fbi.out');rewrite(output);
readln(s);
for i:=1 to length(s) do
 l[i]:=l[i-1]+ord(s[i]='F');
for i:=length(s) downto 1 do
 r[i]:=r[i+1]+ord(s[i]='I');
for i:=1 to length(s) do
if s[i]='B'then ans:=ans+l[i]*r[i];
writeln(ans);
close(output);
end.