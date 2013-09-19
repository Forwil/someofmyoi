program way;
const ax:array[1..4]of -1..1=(1,0,-1,0);
      ay:array[1..4]of -1..1=(0,1,0,-1);
var  tab:array[0..101,0..101]of char;
     b:array[0..101,0..101]of boolean;
     zz:array[0..20000,0..2]of longint;
     move:array['A'..'Z',1..2,1..2]of integer;
    ans,xx,yy,x1,y1,w,x,y,t,i,j,k,n,m,l:longint;
    find:boolean;
begin
assign(input,'way.in');
reset(input);
assign(output,'way.out');rewrite(output);
readln(n,m);
for i:=1 to n do
begin
 for j:= 1 to m do
  begin
  b[i,j]:=true;
  read(tab[i,j]);
  if tab[i,j]='1' then b[i,j]:=false;
  if (tab[i,j]<>'0')and(tab[i,j]<>'1') then
   begin
   if move[tab[i,j],1,1]<>0 then
   begin move[tab[i,j],2,1]:=i;move[tab[i,j],2,2]:=j;end
   else
   begin move[tab[i,j],1,1]:=i;move[tab[i,j],1,2]:=j;end;
   end;
  end;
 readln;
end;
t:=0;
w:=1;
zz[1,1]:=1;
zz[1,2]:=1;
zz[1,0]:=0;
find:=false;
ans:=-1;
repeat
 t:=t+1;
 x:=zz[t,1];
 y:=zz[t,2];
 for i:=1 to 4 do
  begin
  xx:=x+ax[i];
  yy:=y+ay[i];
  if b[xx,yy] then
   begin
   b[xx,yy]:=false;
   if (tab[xx,yy]<>'0') then
       begin
       if (xx=move[tab[xx,yy],1,1])and(yy=move[tab[xx,yy],1,2]) then
       begin x1:=move[tab[xx,yy],2,1];y1:=move[tab[xx,yy],2,2];end
       else
       begin x1:=move[tab[xx,yy],1,1];y1:=move[tab[xx,yy],1,2];end;
       w:=w+1;
       zz[w,0]:=zz[t,0]+1;
       zz[w,1]:=x1;
       zz[w,2]:=y1;
       end
   else
    begin
    w:=w+1;
    zz[w,0]:=zz[t,0]+1;
    zz[w,1]:=xx;
    zz[w,2]:=yy;
    if (xx=n)and(yy=m) then
          begin
          ans:=zz[w,0];
          find:=true;
          end;
    end;
  end;
  end;
until (t>=w)or(find);
if ans=-1 then  writeln('No Solution.')
else
writeln(ans);
close(output);
end.
