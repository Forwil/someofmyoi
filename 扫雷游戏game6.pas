program game;
const ax:Array[1..4]of -1..1=(1,0,-1,0);
      ay:Array[1..4]of -1..1=(0,1,0,-1);
var tab:Array[-1..21,-1..21]of char;
   pass:Array[-1..21,-1..21]of integer;
     b:array[-1..21,-1..21]of integer;
     zf:array['A'..'E',1..12,1..2]of integer;
     sl:Array['A'..'E']of integer;
   i,j,k,n,m:longint;
   ans:string;
   ch:char; cg:boolean;

procedure go(i,j,last,tot,ii,jj:integer);
var z,x,y:integer;
begin
if (i=ii)and(j=jj)and(tot<=3) then cg:=true;
if not((i=ii)and(j=jj))then
for z:=1 to 4 do
 begin
 x:=i+ax[z];y:=j+ay[z];
 if (b[x,y]=1)or((x=ii)and(y=jj)) then
  begin
  b[x,y]:=0;
  go(x,y,z,tot+ord(z<>last),ii,jj);
  if cg then exit;
  b[x,y]:=1;
  end;
 end;
end;

function can(i,j,ii,jj:integer):boolean;
begin
cg:=false;
b:=pass;
go(i,j,0,0,ii,jj);
exit(cg);
end;

procedure get(x:integer;z:string);
var i,j,ii,jj,t1,t2:longint;
c:char;
begin
if z>=ans then exit;
if (x-1)*2=m*n then
begin
 if z<ans then ans:=z;
 exit;
end;
 for c:='A' to 'E' do
 for t1:=1 to sl[c] do
 if pass[zf[c,t1,1],zf[c,t1,2]]=2 then
 for t2:=t1+1 to sl[c] do
 if pass[zf[c,t2,1],zf[c,t2,2]]=2 then
 begin
 i:=zf[c,t1,1];j:=zf[c,t1,2];
 ii:=zf[c,t2,1];jj:=zf[c,t2,2];
 if (can(i,j,ii,jj))then
 begin
 pass[i,j]:=1;
 pass[ii,jj]:=1;
 get(x+1,z+tab[i,j]);
 pass[ii,jj]:=2;
 pass[i,j]:=2;
 end;
 end;
end;
begin
 assign(input,'game.in');reset(input);
 assign(output,'game.out');rewrite(output);
 readln(n,m);
 for i:=1 to n do
 for j:=1 to m do
  begin
  read(tab[i,j]);
  inc(sl[tab[i,j]]);
  zf[tab[i,j],sl[tab[i,j]],1]:=i;
  zf[tab[i,j],sl[tab[i,j]],2]:=j;
  if j=m then readln;
  end;
 for i:=0 to n+1 do
 for j:=0 to m+1 do
 pass[i,j]:=1;
 for i:=1 to n do
 for j:=1 to m do
 pass[i,j]:=2;
 ans:='ZZZZZZZZ';
 get(1,'');
 if ans<>'ZZZZZZZZ'then
 writeln(ans)
 else writeln('Game over.');
 close(output);
end.
