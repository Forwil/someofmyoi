program lock;
var s,s1,s2:ansistring;
   i,j,k,n,m,p:longint;
begin
assign(input,'lock.in');reset(input);
assign(output,'lock.out');rewrite(output);
readln(s);
readln(m,n,p);
if n=1 then
 begin
 for i:=1 to length(s) do
  begin
  if s[i] in['a'..'z'] then s[i]:=chr(ord(s[i])-32) else
  if s[i] in['A'..'Z'] then s[i]:=chr(ord(s[i])+32);
  end;
  s:=s+'Immorta1';
 end;
if n=2 then
 begin
 s2:=copy(s,m,length(s)-m+1);
 s1:=copy(s,1,m-1);
 while pos(s2,s)<>0 do delete(s,pos(s2,s),length(s2));
 while pos('1013',s)<>0 do
  begin
  k:=pos('1013',s);
  delete(s,k,4);
  insert('hh4742',s,k);
  end;
 end;
if n=3 then
 begin
 k:=abs(n-m);
 s2:=copy(s,m,length(s)-m+1);
 delete(s,m,length(s2));
 insert(s2,s,k);
 end;
 for i:=1 to length(s) do
 for j:=1 to p+1 do
  write(s[i]);
  close(output);
end.