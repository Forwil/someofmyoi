program info;
type link=^dfdf;
     dfdf=record
       id:longint;
     next:link;
        end;
var   ln:array[0..10001]of link;
     f,c:Array[0..10001]of longint;
    pass:array[0..10001]of boolean;
    name:array[0..10001]of longint;
 y,x,s,t,ans,i,j,k,n,m,time:longint;
 q:link;
 find:boolean;
 ss:ansistring;
procedure go(x,cost,len:longint);
var q:link;
begin
if pass[x] then exit;
pass[x]:=true;
q:=ln[x];
while q<>nil do
 begin
 if q^.id=t then
  begin
  find:=true;
  ans:=len+name[q^.id];
  time:=cost;
  if f[x]=q^.id then  time:=time+c[q^.id];
  exit;
  end;
 go(q^.id,cost+c[Q^.id],len+name[q^.id]);
 if find then exit;
 q:=q^.next;
 end
end;
begin
assign(input,'info.in');reset(input);
assign(output,'info.out');rewrite(output);
readln(n,s,t);
find:=false;
for i:=1 to n do
begin
 read(x,y);
 f[x]:=y;
 readln(ss);
 name[x]:=length(ss)-1;
 inc(c[y]);
 new(q);
 q^.id:=x;q^.next:=ln[y];ln[y]:=q;
 new(q);
 q^.id:=y;q^.nexT:=ln[x];ln[x]:=q;
end;
name[0]:=0;
if s=t then
 begin
 writeln(name[s]);
 writeln(0);
 close(output);
 halt;
 end;
go(s,0,name[s]);
writeln(ans);
writeln(time);
close(output);
end.
