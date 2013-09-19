program jsp;
var a:array[0..401]of integer;
    ind:Array[0..21,1..21]of integer;
    time:array[0..21,0..21]of longint;
    now:array[0..21]of integer;
    t:array[0..21,0..21,1..2]of longint;
    c:array[0..21]of longint;
    l:Array[0..21]of longint;
ans,i,j,k,n,m,nw,gx,jq,x,y:longint;
function max(a,b:longint):longint;
begin if a>b then max:=a else max:=b;end;
begin
assign(input,'jsp.in');reset(input);
assign(output,'jsp.out');rewrite(output);
readln(m,n);
for i:=1 to n*m do
 read(a[i]);
for i:=1 to n do
for j:=1 to m do
 begin
 read(ind[i,j]);
// if j=m then readln;
 end;
for i:=1 to n do
for j:=1 to m do
 begin
 read(time[i,j]);
// if j=m then readln;
 end;
for i:=1 to n*m do
 begin
 inc(now[a[i]]);
 gx:=now[a[i]];
 jq:=ind[a[i],gx];
 if c[jq]=0 then
   begin
   inc(c[jq]);
   t[jq,c[jq],1]:=l[a[i]];
   t[jq,c[jq],2]:=l[a[i]]+time[a[i],gx];
   l[a[i]]:=l[a[i]]+time[a[i],gx];
   end
 else
  begin
   for j:=1 to c[jq]  do
    begin
       nw:=max(l[a[i]],t[jq,j,2]);
       if t[jq,j,1]-max(l[a[i]],t[jq,j-1,2])>=time[a[i],gx]then
        begin
        nw:=max(l[a[i]],t[jq,j-1,2]);
        break;
        end;
    end;
   inc(c[jq]);
   t[jq,c[jq],1]:=nw;
   t[jq,c[jq],2]:=nw+time[a[i],gx];
   l[a[i]]:=nw+time[a[i],gx];
   for x:=1 to c[jq] do
   for y:=x+1 to c[jq] do
    if t[jq,x,1]>t[jq,y,1] then
       begin
       t[jq,0]:=t[jq,x];
       t[jq,x]:=t[jq,y];
       t[jq,y]:=t[jq,0];
       end;
      t[jq,0,1]:=0;
      t[jq,0,2]:=0;
  end;
 end;
 for i:=1 to n do
 if l[i]>ans then ans:=l[i];
 writeln(ans);
 close(output);
end.
