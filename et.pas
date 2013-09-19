program et;
type link=^redf;
  redf=record
  id,vi:longint;
  next:link;
  end;
var ln:array[0..30000]of link;
    ind:Array[0..30000]of longint;
    ans:array[0..30000]of longint;
      b:array[0..30000]of boolean;
  an,min,x,y,z,i,j,k,n,m,max,t:longint;
  q:link;
procedure dfs(x,z:longint);
var q:link;
begin
b[x]:=false;
q:=ln[x];
if (x<>i)then
begin
if z<min then begin
              min:=z;
              ans[i]:=1;
              end
else
if z=min then ans[i]:=ans[i]+1;
end;
if z<min then
while q<>nil do
 begin
 if (b[q^.id]) then dfs(q^.id,z+q^.vi);
 q:=q^.next;
 end;
end;
begin
assign(input,'et.in');reset(input);
assign(output,'et.out');rewrite(output);
readln(n,m);
for i:=1 to n do
begin
readln(ind[i]);
if ind[i]>max then
         begin
         max:=ind[i];
         t:=1;
         end
else
 if ind[i]=max then t:=t+1;
end;
for i:=1 to m do
 begin
 readln(x,y,z);
 new(q);
 q^.id:=y;
 q^.vi:=z;
 q^.next:=ln[x];
 ln[x]:=q;
 new(q);
 q^.id:=x;
 q^.vi:=z;
 q^.next:=ln[y];
 ln[y]:=q;
 end;
for i:=1 to n do
 begin
 min:=maxlongint;
 fillchar(b,sizeof(b),true);
 dfs(i,0);
 end;
 an:=0;
 for i:=1 to n do
 begin
  inc(ans[i]);
  inc(an,ans[i]);
 end;
 writeln(an);
 close(output);
end.