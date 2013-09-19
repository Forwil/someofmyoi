program adven;
const ax:array[1..4]of -1..1=(1,-1,0,0);
      ay:Array[1..4]of -1..1=(0,0,-1,1);
var tab:array[0..101,0..101]of longint;
     b:array[0..101,0..101]of boolean;
    ans,i,j,k,n,m:longint;
function maxn(a,b:longint):longint;
begin if a>b then maxn:=a else maxn:=b;end;
function minn(a,b:longint):longint;
begin if a>b then minn:=b else minn:=a;end;
procedure dfs(x,y,min,max:longint);
var xx,yy,i:longint;
begin
if (xx=n)and(yy=n)then
          begin
           if max-min<ans then ans:=max-min;
           exit;
          end;
if max-min>=ans then exit;
for i:=1 to 4 do
 begin
  xx:=ax[i]+x;
  yy:=ay[i]+y;
  if b[xx,yy] then
    begin
    b[xx,yy]:=false;
    dfs(xx,yy,minn(min,tab[xx,yy]),maxn(max,tab[xx,yy]));
    b[xx,yy]:=true;
    end;
 end;
end;
begin
assign(input,'adven.in');
reset(input);
assign(output,'adven.out');rewrite(output);
readln(n);
for i:=1 to n do
 begin
  for j:= 1 to n do
   begin
   read(tab[i,j]);
   b[i,j]:=true;
   end;
 readln;
 end;
 ans:=1000;
b[1,1]:=false;
dfs(1,1,tab[1,1],tab[1,1]);
writeln(ans);
close(output);
end.
