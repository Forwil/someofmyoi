program clear;
var A:ansistring;
    p:array[0..300]of longint;
    s:array[0..600000]of char;
    l,m,ww:array[0..600000]of longint;
  ans,i,j,k,n,o,w:longint;
begin
assign(input,'clear.in');reset(input);
assign(output,'clear.out');rewrite(output);
readln(a);
j:=0;
for i:=2 to length(a) do
 begin
 while (j>0)and(a[j+1]<>a[i]) do j:=p[j];
 if a[j+1]=a[i] then j:=j+1;
  p[i]:=j;
 end;
 i:=0;
while not eoln do
 begin
 i:=i+1;
 read(s[i]);
 l[i]:=i-1;
 end;
 n:=i;
j:=0;
i:=1;
while i<=n do
 begin
 while (j>0)and(a[j+1]<>s[i]) do j:=p[j];
 if a[j+1]=s[i] then j:=j+1;
 m[i]:=j;
 if j=1 then w:=i;
 ww[i]:=w;
 if j=length(a) then
  begin
  o:=l[w];
  l[i+1]:=o;
  ans:=ans+1;
  j:=m[o];
  w:=ww[o];
  end;
  i:=i+1;
 end;
writeln(ans);
close(output);
end.
