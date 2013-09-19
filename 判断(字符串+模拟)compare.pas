program compare;
var tab:array[0..1001,0..1001]of extended;
    b:array[0..1001,0..1001]of boolean;
    l,x,y,i,j,k,n,m:longint;
     ans,o:extended;
     z:double;
     can,out:boolean;
     ch:char;
     s:string;
     begin
assign(input,'compare.in');reset(input);
assign(output,'compare.out');rewrite(output);
readln(n,m,l);
for i:=1 to n do
for j:=1 to n do tab[i,j]:=1e100;
for i:=1 to m do
 begin
 readln(x,y,z);
 if z<tab[x,y] then
 begin
 tab[x,y]:=z;
 tab[y,x]:=z;
 b[x,y]:=true;
 b[y,x]:=true;
 end;
 end;
for i:=1 to n do
begin
 b[i,i]:=true;
 tab[i,i]:=0;
end;
 ans:=1e38;
 out:=false;

for i:=1 to l do
 begin
 x:=0;
 y:=0;
 k:=0;
 can:=true;
  o:=0;
   while not(eoln) do
    begin
    s:='';
    read(ch);
     while ch in['0'..'9']do
       begin
       s:=s+ch;
       val(s,k,j);
       if k>n then begin can:=false; break; end;
       read(ch);
       end;
    y:=k;
    if can=false then break;
    if (x<>0)and(y<>0)then
     o:=o+tab[x,y];
      x:=y;
    end;
    readln;
   if x<>n then can:=false;
   if can then
   if o<ans then
    begin
    ans:=o;
    out:=true;
    end;
 end;
 if out then writeln(ans:0:4)
 else writeln('Wrong');
 close(output);
end.
