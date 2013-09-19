program word;
var s:string;
  count:array['a'..'z']of integer;
  i,j,k,n,m,max,min:longint;
   can:boolean;
function go(x:longint):boolean;
var i:longint;
begin
for i:=2 to trunc(sqrt(x)) do
if x mod i=0 then exit(false);
exit(true);
end;
begin
assign(input,'word.in');reset(input);
assign(output,'word.out');rewrite(output);
readln(s);
for i:=1 to length(s) do
 inc(count[s[i]]);
 max:=0;
 min:=maxint;
for i:=1 to length(s) do
  begin
  if count[s[i]]>max then max:=count[s[i]];
  if count[s[i]]<min then min:=count[s[i]];
  end;
k:=max-min;
can:=go(k);
if (k=1)or(k=0) then can:=false;
if can then
begin
writeln('Lucky Word');
writeln(k);
end
else
begin
writeln('No Answer');
writeln(0);
end;
close(output);
end.
