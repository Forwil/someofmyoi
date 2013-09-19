program words;
var ch:array[0..101]of char;
    next:array[0..101]of longint;
  i,j,k,n,m,t,w:longint;
begin
//assign(input,'word.in');reset(input);
//assign(output,'word.out');rewrite(output);
while not eoln do
 begin
 i:=i+1;
 read(ch[i]);
 ch[i]:=upcase(ch[i]);
 end;
  n:=i;
  t:=0;
for i:=2 to n do
 begin
  while (t>0)and(ch[t+1]<>ch[i]) do t:=next[t];
  if ch[t+1]=ch[i] then t:=t+1;
  next[i]:=t;
 end;
for i:=1 to n do
write(next[i],' ');
w:=n-next[n];
for i:=1 to w do
write(chr(ord(ch[i])+32));
writeln;
close(output);
end.
