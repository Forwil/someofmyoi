program a9_18;
var p:array[0..101]of longint;
    tab:array[0..101,0..101]of longint;
   ans,z,i,j,k,n,m,x,y,min:longint;
begin
assign(input,'fire.in');reset(input);
assign(output,'fire.out');rewrite(output);
readln(n,m);
fillchar(tab,sizeof(tab),$7f);
for i:=1 to m do
 begin
  readln(x,y,z);
  if z<tab[x,y] then
   begin
   tab[x,y]:=z;
   tab[y,x]:=z;
   end;
 end;
for i:=2 to n do
 p[i]:=tab[1,i];
 p[1]:=-1;
for i:=1 to n-1 do
 begin
 min:=maxlongint;
  for j:=1 to n do
   if (p[j]<>-1)and(p[j]<min) then
     begin
     min:=p[j];
     k:=j;
     end;
 for j:=1 to n do
  if (p[j]<>-1)and(tab[k,j]<p[j]) then
    p[j]:=tab[k,j];
  p[k]:=-1;
  ans:=ans+min;
 end;
 ans:=ans*7;
 x:=ans div (29*17);
 ans:=ans mod (29*17);
 y:=ans div 29;
 ans:=ans mod 29;
 z:=ans;
 if x<>0 then write(x,'jalor');
 if y<>0 then write(y,'rh');
 if z<>0 then write(z,'kl');
 close(output);
end.
