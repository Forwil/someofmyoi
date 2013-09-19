program b_10_6_wei;
var ind:array[0..21]of longint;
  o,t,i,j,k,n,m,now,last,ans:longint;
  ch:char;
begin
assign(input,'b.in');reset(input);
assign(output,'b.out');rewrite(output);
readln(n,m,k);
for t:=1 to k do
 begin
   fillchar(ind,sizeof(ind),0);
   for i:=1 to n do
   for j:=1 to m do
    begin
    read(ch);
    if ch='1' then ind[j]:=ind[j]+ (1 shl (i-1));
    if j=m then readln;
    end;
  readln;
  ans:=0;

  for i:=0 to 1 shl n-1 do
   begin
     now:=i;
     last:=0;
     for j:=1 to m do
      begin
      o:=now;
      now:=now xor(now shr 1)xor(now shr 2)xor (now shl 1)xor(now shl 2)
      xor last xor ind[j];
      now:=now and(1 shl n-1);
      last:=o;
     end;
   if now=0 then inc(ans);
   end;
   writeln(ans);
 end;
 close(output);
end.