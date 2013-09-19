program benben1;
var
    s,ss:ansistring;
   ans,i,k,n,m:longint;
zt:array[0..90000]of ansistring;
procedure out(t:longint);
var i,j:longint;

begin
 writeln('STEP    0',':',s);
for i:=1 to t do
 writeln('STEP',i:5,':',zt[i]);
 halt;
end;
procedure go(s:ansistring;z,wz:longint);
var i,j:longint;
   sSs:ansistring;
begin
if s=ss then out(z);
 for i:=-2 to 2 do
if  (i<>0)and(wz+i<=n+m+1)and(wz+i>=1) then
if (((s[wz+i]='W')and(i>0))or((s[wz+i]='B')and(i<0)))then
   begin
   sss:=s;
   s[wz]:=s[wz+i];
   s[wz+i]:='_';
   zt[z+1]:=s;
   go(s,z+1,wz+i);
   s:=sss;
   end;
end;

begin
readln(n,m);
assign(output,'b.out');rewrite(output);
s:='_';
ss:='_';
for i:=1 to n do
 begin
 s:='B'+s;
 ss:=ss+'B';
 end;
for i:=1 to m do
 begin
 s:=s+'W';
 ss:='W'+ss;
 end;
go(s,0,n+1);
end.