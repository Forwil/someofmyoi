program n1244;
var  s:array[0..5100]of char;
  C:array[0..26]of longint;
 n,k,t,i,j,max:longint;
 ch:char;
begin
assign(input,'n1244.in');reset(input);
i:=0;
while not(eof) do
 begin
 read(ch);
 if (ch in ['A'..'Z'])or(ch in ['a'..'z']) then
   inc(c[ord(upcase(ch))-64]);
 i:=i+1;
 s[i]:=ch;
 end;
 n:=i;
for i:=1 to 26 do
 if c[i]>max then
 begin
 max:=c[i];
 k:=i;
 end;
t:=(k+96)-ord('e');

for i:=1 to n do
 begin
 if (s[i] in ['a'..'z'])then
  begin
   j:=ord(s[i])-t-96;
   j:=(j-1+26)mod 26 +1;
   j:=j+96;
   s[i]:=chr(j);
  end;
  if (s[i] in ['A'..'Z'])then
  begin
   j:=ord(s[i])-t-64;
   j:=(j-1+26)mod 26 +1;
   j:=j+64;
   s[i]:=chr(j);
  end;
   write(s[i]);
 end;
end.
