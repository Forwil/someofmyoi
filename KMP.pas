program a2;
var next:array[0..100001]of longint;
    ans:array[0..100001]of longint;
    s1,s2:array[0..100001]of char;
    l1,l2,t,i,j,k,n,m:longint;
begin
assign(input,'a.in');
reset(input);
assign(output,'a.out');rewrite(output);
l1:=0;
while not(eoln) do
 begin
 l1:=l1+1;
 read(s1[l1]);
 end;
 readln;
while not(eoln) do
 begin
 l2:=l2+1;
 read(s2[l2]);
 end;
i:=1;
j:=0;
t:=0;
repeat
 if (j=0)or(s1[i]=s1[j]) then
        begin
        j:=j+1;
        i:=i+1;
        next[i]:=j;
        end
 else
  j:=next[j];
until i>=l1;
next[l1+1]:=0;
i:=1;
j:=1;
repeat
 if (s2[i]=s1[j])or(j=0) then
  begin
  i:=i+1;
  j:=j+1;
  end
 else j:=next[j];
 if (j=l1)and(s2[i]=s1[j]) then
  begin
   j:=next[j];
   inc(t);
   ans[t]:=i-l1+1;
  end;
until i>l2;
if t<>0 then
begin
writeln(t);
for i:=1 to  t do
writeln(ans[i]);
end
else writeln('There must be something wrong.');
close(output);
end.
