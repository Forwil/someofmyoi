program mm2;
const ax:array[1..4]of integer=(1,0,-1,0);
      ay:Array[1..4]of integer=(0,1,0,-1);

var
    p:array[0..8,0..8]of boolean;
    x1,y1,i,j,k,n,x,y,m,t,w,tot:longint;
    ch:char;
    can:boolean;
procedure dfs(x,y,z:longint);
var xx,yy,i:longint;
begin
if z>k then exit;
if not((x=x1)and(y=y1))then
for i:=1 to  4 do
 begin
 xx:=x+ax[i];
 yy:=y+ay[i];
 if p[xx,yy] then
  begin
  p[xx,yy]:=false;
  dfs(xx,yy,z+1);
  if can then exit;
  p[xx,yy]:=true;
  end;
 end
else
 if z=k then
  begin
  writeln('Yes');
  can:=true;
  exit;
  end;
end;
begin
assign(input,'game.in');reset(input);
assign(output,'game.out');rewrite(output);
while true do
 begin
 readln(n,m,k);
 tot:=0;
 if ((n=0)and(m=0)and(k=0)) then break;
 for i:=1 to n do
 for j:=1 to m do
   begin
   read(ch);
   if ch='*' then p[i,j]:=true;
   if ch='D' then begin x1:=i;y1:=j; p[i,j]:=true; end;
   if ch='H' then p[i,j]:=false;
   if j=m then readln;
   if p[i,j] then inc(tot);
   end;
   can:=false;
   if (k>tot)or((x1+y1)mod 2<>k mod 2) then writeln('No')
   else
   begin
   dfs(1,1,0);
  if can=false then writeln('No');
   end;
  end;
   close(output);
end.
