program meal_dp;
var dl,dr:array[0..1,0..2501]of longint;
    l,r:array[0..2501]of longint;
    u:array[0..1,0..2501]of longint;
    b:array[0..2501]of longint;
 i,j,k,n,m,now,last,ans:longint;
function min(a,b:longint):longint;
begin if a>b then min:=b else min:=a; end;
begin
assign(input,'meal.in');reset(input);
assign(output,'meal.out');rewrite(output);
readln(n,m);
for i:=1 to n do
 begin
 now:=i and 1;
 last:=1-now;
  for j:=1 to m do
    begin
     read(b[j]);
     if b[j]=0 then l[j+1]:=l[j]+1 else l[j+1]:=0;
     if b[j]=0 then u[last,j]:=u[now,j]+1
     else u[last,j]:=0;
     if b[j]=1 then dl[now,j]:=min(min(dl[last,j-1],l[j]),u[now,j])+1
     else dl[now,j]:=0;
     if dl[now,j]>ans then ans:=dl[now,j];
    end;
 for j:=m downto 1 do
    begin
     if b[j]=0 then r[j-1]:=r[j]+1 else r[j-1]:=0;
     if b[j]=1 then dr[now,j]:=min(min(dr[last,j+1],r[j]),u[now,j])+1
     else dr[now,j]:=0;
     if dr[now,j]>ans then ans:=dr[now,j];
    end;
 end;
 writeln(ans);
 close(output);
end.
