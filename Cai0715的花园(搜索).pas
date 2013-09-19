program wg3;
const ax:array[1..4]of -1..1=(1,0,-1,0);
      ay:Array[1..4]of -1..1=(0,1,0,-1);
type
    node=array[0..4]of integer;
var hash:Array[0..4,0..4,0..4,
               0..4,0..4,0..4,
               0..4,0..4,0..4]of longint;
      pass:Array[1..3,1..3,1..4]of boolean;
      zt:array[0..9,0..9,0..9,0..9]of longint;
      tt:node;
     t:array[0..4,0..4]of integer;
    z,i,j,k,n,m,r:longint;
procedure go(z:longint;tt:node);
var i,j,o:integer;
 tot:array[0..4]of integer;
begin
//i//nc(m);
//if m mod 100=0 then writeln(m,' ',z);
if hash[t[1,1],t[1,2],t[1,3],t[2,1],t[2,2],t[2,3],t[3,1],t[3,2],t[3,3]]<=z then exit;
   hash[t[1,1],t[1,2],t[1,3],t[2,1],t[2,2],t[2,3],t[3,1],t[3,2],t[3,3]]:=z;

if zt[tt[1],tt[2],tt[3],tt[4]]>z then
   zt[tt[1],tt[2],tt[3],tt[4]]:=z;

 for i:=1 to 3 do
 for j:=1 to 3 do
 begin
 fillchar(tot,sizeof(tot),0);
 for o:=1 to 4 do
 inc(tot[t[i+ax[o],j+ay[o]]]);

 if pass[i,j,1]=false then
 begin
 pass[i,j,1]:=true;
 o:=t[i,j];
 dec(tt[o]);
 t[i,j]:=1;
 inc(tt[1]);
 go(z+1,tt);
 dec(tt[1]);
 inc(tt[o]);
 t[i,j]:=o;
 pass[i,j,1]:=false;
 end;

 if pass[i,j,2]=false then
 if tot[1]<>0 then
 begin
 pass[i,j,2]:=true;
 o:=t[i,j];
 dec(tt[o]);
 t[i,j]:=2;
 inc(tt[2]);
 go(z+1,tt);
 dec(tt[2]);
 inc(tt[o]);
 t[i,j]:=o;
 pass[i,j,2]:=false;
 end;

 if  pass[i,j,3]=false then
 if (tot[2]<>0)and(tot[1]<>0)then
 begin
 pass[i,j,3]:=true;
 o:=t[i,j];
 dec(tt[o]);
 t[i,j]:=3;
 inc(tt[3]);
 go(z+1,tt);
 dec(tt[3]);
 inc(tt[o]);
 t[i,j]:=o;
 pass[i,j,3]:=false;
 end;

 if  pass[i,j,4]=false then
 if (tot[3]<>0)and(tot[2]<>0)and(tot[1]<>0) then
 begin
 pass[i,j,4]:=true;
 o:=t[i,j];
 dec(tt[o]);
 t[i,j]:=4;
 inc(tt[4]);

 go(z+1,tt);

 dec(tt[4]);
 t[i,j]:=o;
 inc(tt[o]);
 pass[i,j,4]:=false;
 end;
 end;

end;
begin
assign(output,'data.out');rewrite(output);
fillchar(hash,sizeof(hash),63);
fillchar(zt,sizeof(zt),63);
r:=zt[0,0,0,0];
go(0,tt);
for i:=0 to 9 do
for j:=0 to 9 do
for z:=0 to 9 do
for k:=0 to 9 do
if (j+i+z+k<=9)and(zt[i,j,z,k]<>r) then
writeln('zt[',i,',',j,',',z,',',k,']:=',zt[i,j,z,k],';');
close(output);
end.

