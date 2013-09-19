program stone;
var tab:array[0..2100,0..21]of boolean;
    b:array[0..2100,0..21]of boolean;
   // c:array[0..2100,0..21]of integer;
    p:Array[0..2100]of integer;
    l,s,w,i,j,k,n,m,o,z:longint;
   find:boolean; ind:array[0..110]of integer;
begin
assign(input,'stone.in');
reset(input);
assign(output,'stone.out');rewrite(output);
readln(n,w);
for i:=1 to n do
 begin
 readln(ind[i]);
 s:=s+ind[i];
 end;
fillchar(tab,sizeof(tab),true);
m:=1;
for i:=1 to n do
  begin
   k:=0;
   fillchar(b,sizeof(b),false);
    for j:=w downto 1 do
    begin
     for l:=m+1 downto 1 do
     if tab[l,j] then b[l,j]:=true
     else break;
    end;
    for j:=m downto 0 do
    begin
    o:=0;
     for l:=w downto 1 do
     begin
      if b[j,l] then inc(o)
      else o:=0;
      if o=ind[i] then break;
     end;
     if o<ind[i] then begin
                      k:=j+1;
                      break;
                      end;
    end;
  find:=false;
  repeat
  o:=0;
   for j:=w downto 1 do
   begin
    if b[k,j]  then inc(o)
    else o:=0;
    if o=ind[i] then
     begin
      find:=true;
      z:=j;
      break;
     end;
   end;
  if not(find) then inc(k);
  until find;
 for l:=k to k+ind[i]-1 do
 begin
 for j:=z to z+ind[i]-1 do
  begin
  tab[l,j]:=false;
//  c[l,j]:=i;
  end;
 end;
 if k+ind[i]-1>m then m:=k+ind[i]-1;
end;
//for i:=m downto 1 do begin for j:=w downto 1 do write(c[i,j],' '); writeln; end;
writeln(m);
close(output);
end.
