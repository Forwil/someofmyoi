program matches;
const a:array['0'..'9']of integer=
 (6,2,5,5,4,5,6,3,7,6);
var x,i,j,k,n,m,z,tot,ans:longint;
s1,s2,s3:string;
function cost(s:string):longint;
var i,j:longint;
begin
j:=0;
for i:=1 to length(s) do
j:=j+a[s[i]];
exit(j);
end;
begin
assign(input,'matches.in');reset(input);
assign(output,'matches.out');rewrite(output);
readln(n);
for i:=0 to 1111 do
for j:=0 to i do
 begin
 tot:=4;
 z:=i+j;
 str(i,s1);
 str(j,s2);
 str(z,s3);
 tot:=tot+cost(s1);if tot>n then continue;
 tot:=tot+cost(s2);if tot>n then continue;
 tot:=tot+cost(s3);if tot>n then continue;
 if tot=n then
 begin
 inc(ans);
 if j<>i then inc(ans);
 end;
 end;
 writeln(ans);
 close(output);
end.
