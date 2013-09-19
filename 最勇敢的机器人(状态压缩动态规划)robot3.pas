program robot3;
var tab:array[0..20001,1..3]of integer;
    A:array[0..20001,1..3]of boolean;
    p:array[0..20001,1..2]of boolean;
  t,i,j,k,n,m,z:longint;
begin
assign(input,'robot3.in');reset(input);
assign(output,'robot3.out');rewrite(output);
readln(t);
for k:=1 to t do
 begin
  readln(n);
  fillchar(a,sizeof(a),false);
  fillchar(p,sizeof(p),false);
  for i:=1 to n do
  for j:=1 to 3 do
  read(tab[i,j]);
  a[1,1]:=true;
  a[1,2]:=true;
  a[1,3]:=true;
  for i:=1 to n do
   begin
    if a[i,1] then
      begin
      if (tab[i,1]=2)and(tab[i,2]=2) then a[i+1,2]:=true;
      if (tab[i,1]=2)and(tab[i,2]=1)and(tab[i,3]=2) then a[i+1,3]:=true;
      if tab[i,1]=1 then a[i+1,1]:=true;
      if (tab[i,1]=1)and(tab[i,2]=2)and(tab[i,3]=2) then p[i+1,1]:=true;
      end;
    if a[i,2] then
     begin
     if (tab[i,2]=2)and(tab[i,1]=2) then a[i+1,1]:=true;
     if (tab[i,2]=2)and(tab[i,3]=2) then a[i+1,3]:=true;
     if (tab[i,2]=1) then a[i+1,2]:=true;
     end;
    if a[i,3] then
     begin
     if (tab[i,3]=2)and(tab[i,2]=2) then a[i+1,2]:=true;
     if (tab[i,3]=2)and(tab[i,2]=1)and(tab[i,1]=2) then a[i+1,1]:=true;
     if (tab[i,3]=1) then a[i+1,3]:=true;
     if (tab[i,3]=1)and(tab[i,2]=2)and(tab[i,1]=2) then p[i+1,2]:=true;
     end;
    if p[i,1] then
     begin
      if (tab[i,1]=2)and(tab[i,2]=2)and(tab[i,3]=1) then a[i+1,3]:=true;
      if (tab[i,1]=1)and(tab[i,2]=1)and(tab[i,3]=1) then p[i+1,1]:=true;
     end;
    if p[i,2] then
     begin
      if (tab[i,3]=2)and(tab[i,2]=2)and(tab[i,1]=1) then a[i+1,1]:=true;
      if (tab[i,3]=1)and(tab[i,2]=1)and(tab[i,1]=1) then p[i+1,2]:=true;
     end;
   end;
  if (a[n+1,1])or(a[n+1,2])or(a[n+1,3]) then writeln('yes')
  else writeln('no');
 end;
 close(output);
end.
