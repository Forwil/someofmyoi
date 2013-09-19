program expand;
var s,ss:ansistring;
   i,j,k,n,m,p1,p2,p3:longint;
function get(ch1,ch2:char):ansistring;
var ss:ansistring;
  i:char;
  j:longint;
begin
ss:='';
if p3=1 then
  begin
  for i:=succ(ch1) to pred(ch2) do
   for j:=1 to p2 do
    begin
    if p1=3 then ss:=ss+'*';
    if p1=1 then ss:=ss+i;
    if p1=2 then ss:=ss+upcase(i);
    end;
  end;
if p3=2 then
  begin
  for i:=pred(ch2) downto succ(ch1) do
   for j:=1 to p2 do
    begin
    if p1=3 then ss:=ss+'*';
    if p1=1 then ss:=ss+i;
    if p1=2 then ss:=ss+upcase(i)
    end;
  end;
 get:=ss;
end;
begin
assign(input,'expand.in');reset(input);
assign(output,'expand.out');rewrite(output);
readln(p1,p2,p3);
readln(s);
while pos('-',s)<>0 do
 begin
 k:=pos('-',s);
 if (k<length(s))and(k>1)and(s[k-1]in['0'..'9'])and(s[k+1]in['0'..'9']) then
   begin
   if s[k-1]>=s[k+1]then s[k]:='+'
    else
     begin
     ss:=get(s[k-1],s[k+1]);
     delete(s,k,1);
     insert(ss,s,k);
     end;
    continue;
   end;
  if (k<length(s))and(k>1)and(s[k-1]in['a'..'z'])and(s[k+1]in['a'..'z']) then
   begin
   if s[k-1]>=s[k+1]then s[k]:='+'
    else
     begin
     ss:=get(s[k-1],s[k+1]);
     delete(s,k,1);
     insert(ss,s,k);
     end;
    continue;
   end;
  s[k]:='+';
 end;
 while pos('+',s)<>0 do s[pos('+',s)]:='-';
 writeln(s);
 close(output);
end.
