program recuitment;
var l,i,j,k,n,m:longint;
   t:qword;
   sa:array[0..35]of qword;
begin
assign(input,'recuitment.in');reset(input);
assign(output,'recuitment.out');rewrite(output);
readln(n);
sa[0]:=1;
for i:=1 to 32 do
  sa[i]:=sa[i-1]*3;
for i:=1 to n do
 begin
  readln(k);
  l:=0;
  t:=0;
  while  k<>0 do
   begin
   if (1 shl l)and k <>0 then
    begin
    t:=t+sa[l];
    k:=k-1 shl l;
    end;
   l:=l+1;
   end;
   writeln(t);
 end;
 close(output);
end.
