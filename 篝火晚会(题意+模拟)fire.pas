program fire;
var ind:array[0..50001]of longint;
      c:array[0..50001,1..2]of longint;
      p:array[0..50001]of longint;
 t,i,j,l,k,n,m,ans:longint;
begin
assign(input,'fire.in');reset(input);
assign(output,'fire.out');rewrite(output);
readln(n);
for i:=1 to n do
readln(c[i,1],c[i,2]);
ind[1]:=1;
ind[2]:=c[1,1];
for i:=2 to n do
 begin
 k:=0;
 if ind[(i-2+n) mod n+1]=c[ind[i],1] then  k:=2;
 if ind[(i-2+n) mod n+1]=c[ind[i],2] then  k:=1;
 if k=0 then break;
 ind[i mod n+1]:=c[ind[i],k];
 end;
if k=0 then
  begin
  writeln(-1);
  close(output);
  end;
for i:=1 to n do
 begin
 k:=i-ind[i];
 if k<0 then k:=n+k;
 inc(p[k]);
 if p[k]>m then m:=p[k];
 end;
for i:=1 to n do
p[i]:=ind[n-i+1];
ind:=p;
fillchar(p,sizeof(p),0);
for i:=n downto 1 do
 begin
 k:=i-ind[i];
 if k<0 then k:=n+k;
 inc(p[k]);
 if p[k]>m then m:=p[k];
 end;
writeln(n-m);
close(output);
end.
