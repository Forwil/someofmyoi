program decode;
var ind,ln:array[1..100000]of boolean;
     e:array[-200..200]of boolean;
    i,j,k,n,m,l,x,y,t,w,p:longint;
     ch:char;
begin
assign(input,'decode.in');
reset(input);
assign(output,'decode.out');
rewrite(output);
 readln(n,m,l,k);
 for i:=1 to m do
  begin
  read(ch);
  if ch='1' then e[i]:=true;
  end;
  readln;
  for i:=1 to n do
   begin
   read(ch);
   if ch='1' then ind[i]:=true;
   end;
   p:=1;
  for i:=1 to k do
   begin
    p:=((p+(l mod n)-1) mod n)+1;
    t:=(p-1+n-1) mod n +1;
    w:=m;
    while w>0 do
     begin
     ind[t]:=ind[t] xor e[w];
     t:=(t-1+n-1) mod n +1;
     w:=w-1;
     end;
   end;
  for i:=1 to n do
  write(ord(ind[(p+i-1-1+n*2)mod n +1]));
  writeln;
  close(output);
end.
