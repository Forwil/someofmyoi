program eldrethalas;
var  ind:array[0..2501]of longint;
     b:array[0..101,0..101]of longint;
     tab:Array[0..2500,0..2500]of boolean;
     p:array[0..2501]of longint;
     pass:array[0..2501]of boolean;
     min,k,i,j,n,m,pp,r,oo:longint;
begin
assign(input,'eldrethalas.in');reset(input);
assign(output,'eldrethalas.out');rewrite(output);
readln(m,n,pp);
for i:=1 to n do
 readln(ind[i]);
for i:=1 to m do
for j:=1 to m do
 begin
 read(b[i,j]);
 if b[i-1,j]<>b[i,j] then
 begin
  tab[b[i-1,j],b[i,j]]:=true;
  tab[b[i,j],b[i-1,j]]:=true;
 end;
 if b[i,j-1]<>b[i,j] then
 begin
  tab[b[i,j-1],b[i,j]]:=true;
  tab[b[i,j],b[i,j-1]]:=true;
 end;
 if j=m then readln;
 end;

 fillchar(p,sizeof(p),63);
 for i:=1 to m do
 p[b[1,i]]:=ind[b[1,i]];
 for i:=1 to n do
 begin
 min:=maxlongint;
  for j:=1 to n do
  if (pass[j]=false)and(p[j]<min) then
   begin
    min:=p[j];
    k:=j;
   end;
 pass[k]:=true;
 for j:=1 to n do
  if (pass[j]=false)and(tab[k,j])and(p[k]+ind[j]<p[j])then
   p[j]:=p[k]+ind[j];
 end;
 oo:=maxlongint;
for i:=1 to m do
  if p[b[m,i]]<oo then oo:=p[b[m,i]];
if pp-oo<=0 then writeln('NO')
else
 writeln(pp-oo);
 close(output);
end.
