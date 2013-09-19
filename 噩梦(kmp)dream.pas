program dream;
var  next:array[0..201,0..201]of integer;
     ind:array[0..201]of string;
     a:array[0..201]of integer;
     i,j,k,n,m,x,y:longint;
     ans:qword;
     s:string;
procedure go(s:string;i:longint);
var x,y,z:longint;
begin
x:=1;
Y:=0;
next[i,1]:=0;
repeat
if (y=0)or(s[x]=s[y]) then
  begin
  y:=y+1;
  x:=x+1;
  next[i,x]:=y;
  end
 else y:=next[i,y];
until  x>length(s);
end;
begin
assign(input,'dream.in');reset(input);
assign(output,'dream.out');rewrite(output);
readln(n,m);
for i:=1 to m do
 begin
 readln(ind[i]);
 go(ind[i],i);
 end;
for i:=1 to m do
readln(a[i]);
for i:=1 to n do
 begin
  readln(s);
   for j:=1 to m do
   begin
    x:=1;
    y:=1;
   repeat
    if (s[x]=ind[j,y])or(y=0) then
       begin
       x:=x+1;
       y:=y+1;
       end
    else y:=next[j,y];
    if y>length(ind[j]) then
      begin
      y:=next[j,y];
      ans:=ans+a[j]*(x-length(ind[j]));
      end;
   until x>length(s);
   end;
 end;
 writeln(ans);
 close(output);
end.


