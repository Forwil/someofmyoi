program winmine;
const ax:Array[1..8]of integer=(0,0,1,1,1,-1,-1,-1);
      ay:array[1..8]of integer=(-1,1,1,0,-1,0,-1,1);
var tab:array[0..101,0..101]of longint;
      pass,now:array[0..101,0..101]of integer;
      is:array[0..101,0..101]of boolean;
    lei,p,i,j,k,n,m,l,x,y,t:longint;
    ch:char;
    c:boolean;
procedure open(x,y:longint);
var i,j:longint;
begin
pass[x,y]:=0;
for i:=1 to 8 do
 if pass[x+ax[i],y+ay[i]]=1 then
 if now[x+ax[i],y+ay[i]]=tab[x+ax[i],y+ay[i]] then
  open(x+ax[i],y+ay[i])
  else pass[x+ax[i],y+ay[i]]:=0;
end;

procedure find(x,y:longint);
var i,j:longint;
begin
for i:=1 to 8 do
 if pass[x+ax[i],y+ay[i]]=1 then
 begin
 for j:=1 to 8 do  inc(now[x+ax[i]+ax[j],y+ay[i]+ay[j]]);
 pass[x+ax[i],y+ay[i]]:=-1;
 lei:=lei+1;
 end;
end;

procedure go(x,y:longint);
var t,tt,i,j,z:longint;
  xx,yy:longint;
  flag:boolean;
begin
 open(x,y);
 flag:=true;
 while  flag do
 begin
 flag:=false;
 for i:=1 to n do
 for j:=1 to n do
  if pass[i,j]=0 then
  begin
  t:=0;
  for z:=1 to 8 do  if pass[i+ax[z],j+ay[z]]=1 then inc(t);
  if (t<>0)and(tab[i,j]=now[i,j]) then begin open(i,j);    flag:=true;end;
  if (t<>0)and(tab[i,j]-now[i,j]=t) then begin find(i,j);flag:=true;end;
  end;
 end;
end;
begin
assign(input,'winmine.in');reset(input);
assign(output,'winmine.out');rewrite(output);
readln(n,m,p);
for i:=1 to n do
 for j:=1 to n do
 begin
  read(ch);
  if ch='*' then tab[i,j]:=-1
  else tab[i,j]:=ord(ch)-48;
  if j=n then readln;
 end;
for i:=1 to p do
 begin
 fillchar(is,sizeof(is),false);
 fillchar(now,sizeof(now),0);
 for x:=1 to n do
 for y:=1 to n do pass[x,y]:=1;
 readln(x,y);
 lei:=0;
 go(x,y);
 t:=0;
 for x:=1 to n do
 for y:=1 to n do if pass[x,y]=1 then inc(t);

 if t+lei=m then writeln('Yes')
 else writeln('No');
 end;
 close(output);
end.
