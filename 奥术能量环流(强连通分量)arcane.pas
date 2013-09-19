program arcane;
var a,b,tab:array[0..101,0..101]of boolean;
        ind:Array[0..101,0..101]of integer;
    ans,x,y,t,z,i,j,k,n,m,c:longint;
procedure dfs1(i,j:longint);
begin
a[i,j]:=true;
if (1 and (ind[i,j])<>0)and(a[i,j+1]=false) then dfs1(i,j+1);
if (2 and (ind[i,j])<>0)and(a[i,j-1]=false) then dfs1(i,j-1);
if (4 and (ind[i,j])<>0)and(a[i+1,j]=false) then dfs1(i+1,j);
if (8 and (ind[i,j])<>0)and(a[i-1,j]=false) then dfs1(i-1,j);
end;
procedure dfs2(i,j:longint);
begin
b[i,j]:=true;
if a[i,j] then
 begin
 tab[i,j]:=false;
 t:=t+1;
 end else exit;
if (2 and ind[i,j+1]<>0)and(b[i,j+1]=false) then dfs2(i,j+1);
if (1 and ind[i,j-1]<>0)and(b[i,j-1]=false) then dfs2(i,j-1);
if (8 and ind[i+1,j]<>0)and(b[i+1,j]=false) then dfs2(i+1,j);
if (4 and ind[i-1,j]<>0)and(b[i-1,j]=false) then dfs2(i-1,j);
end;
begin
assign(input,'arcane.in');reset(input);
assign(output,'arcane.out');rewrite(output);
readln(n,m);
for i:=1 to n do
for j:=1 to m do
 read(ind[i,j]);

fillchar(tab,sizeof(tab),true);
for i:=1 to n do
for j:=1 to m do
if tab[i,j] then
begin
fillchar(a,sizeof(a),false);
fillchar(b,sizeof(b),false);
t:=0;
dfs1(i,j);
dfs2(i,j);
if t>=2 then ans:=ans+1;
end;
 writeln(ans);
 close(output);
end.
