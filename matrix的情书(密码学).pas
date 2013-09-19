program a10_23;
var count:array[0..26] of longint;
    ind:array[0..100000]of char;
    i,j,k,n,m:longint;
    ch:char;
begin
assign(input,'a.in');reset(input);
assign(output,'a.out');rewrite(output);
n:=0;
while not(eof) do
 begin
  read(ch);
  if ch in (['a'..'z']+['A'..'Z']) then
    inc(count[ord(upcase(ch))-64]);
  n:=n+1;
  ind[n]:=ch;
 end;
for i:=1 to 26 do
 if count[i]>m then
 begin m:=count[i];k:=i;end;
 k:=k-5;
for i:=1 to n do
 begin
 if ind[i] in['a'..'z'] then
  ind[i]:=chr((ord(ind[i])-96-k+26-1) mod 26+1+96);
 if ind[i] in['A'..'Z'] then
  ind[i]:=chr((ord(ind[i])-64-k+26-1) mod 26+1+64);
 write(ind[i]);
 end;
 close(output);
end.
