program dt2;
var i,j,k,n,m,t:longint;
   s:array[0..10001]of ansistring;
procedure doit(t,w,c:longint;init:boolean);
var i,j,tt:longint;
begin
if t=w then
 begin
 writeln(copy(s[t],c-1,length(s[t])-c+2));
 exit;
 end;
tt:=t;
for i:=t to w do
if  not((s[i,c]='#')and(s[i+1,c]='#')
      or(s[i,c]='*')and(s[i+1,c]='*'))or(i=w) then
 begin
  if init then writeln('<li>');
  if (s[i][c]='*')and(i<>tt) then writeln('<ul>');
  if (s[i][c]='#')and(i<>tt) then writeln('<ol>');
  doit(tt,i,c+1,true);
  if (s[i][c]='*')and(i<>tt) then writeln('</ul>');
  if (s[i][c]='#')and(i<>tt) then writeln('</ol>');
  if init then writeln('</li>');
  tt:=i+1;
 end;
end;

begin
assign(input,'wiki.in');reset(input);
assign(output,'wiki.out');rewrite(output);
i:=0;
while not(eof)do
 begin
 i:=i+1;
 readln(s[i]);
 end;
n:=i;
s[n+1]:='00000000000';
s[n+1]:=s[n+1]+s[n+1]+s[n+1];
doit(1,n,1,false);
close(output);
end.
