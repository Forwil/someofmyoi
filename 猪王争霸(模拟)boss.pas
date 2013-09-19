program boss;
var name:array[0..1001]of string[13];
     pig:array[0..1001]of ansistring;
       no,bb:array[0..1001]of integer;
  t,i,j,k,n,m:longint;
  ans:ansistring;
function big1(i,j:longint):boolean;
begin
if length(pig[i])>length(pig[j]) then exit(true);
if (length(pig[i])=length(pig[j]))
and(pig[i]>pig[j]) then exit(true);
exit(false);
end;

procedure jia(var s2:ansistring;s1:ansiString);
var jin,i,k:longint;
begin
while length(s2)<490 do s2:='0'+s2;
while length(s1)<490 do s1:='0'+s1;
while length(s1)>490  do delete(s1,1,1);
jin:=0;
for i:=490 downto 1 do
begin
k:=ord(s1[i])-48+ord(s2[i])-48+jin;
s2[i]:=chr(k mod 10+48);
jin:=k div 10;
end;
end;

begin
assign(input,'boss.in');reset(input);
assign(output,'boss.out');rewrite(output);
readln(n);
for i:=1 to n do
 begin
 readln(name[i]);
 readln(pig[i]);
 jia(ans,pig[i]);
 end;
for i:=1 to n do
 for j:=i+1 to n do
 if big1(i,j) then inc(bb[i])
 else
   if (pig[i]=pig[j])and(name[j]>name[i]) then
   inc(bb[i])
   else inc(bb[j]);

for i:=1 to n do
no[bb[i]]:=i;

for i:=n-1 downto 0 do
writeln(name[no[i]]);
writeln(ans);
close(output);
end.
