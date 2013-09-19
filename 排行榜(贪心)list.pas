program list;
var
   name:array[0..101]of string;
   wh:array[0..101]of integer;
   ans:Array[0..101]of integer;
  pass:Array[0..101]of boolean;
  i,j,k,n,m:longint;
  s:string;
begin
assign(input,'list.in');reset(input);
assign(output,'list.out');rewrite(output);
readln(n);
for i:=1 to n do
 begin
 readln(name[i]);
 readln(s);
 if s='UP'then wh[i]:=1;
 if s='DOWN'then wh[i]:=2;
 if s='SAME'then
 begin
 pass[i]:=true;
 ans[i]:=i;
 end;
 end;

for i:=n downto 1 do
if wh[i]=1 then
begin
 for j:=n downto i+1 do
  if not pass[j] then break;
 pass[j]:=true;
 ans[j]:=i;
end;

for i:=1 to n do
if wh[i]=2 then
begin
 for j:=1 to i-1 do
 if not pass[j] then break;
 pass[j]:=true;
 ans[j]:=i;
end;

for i:=1 to n do
writeln(name[ans[i]]);
close(output);
end.
