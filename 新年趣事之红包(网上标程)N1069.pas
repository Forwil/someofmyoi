program s1069;
var
i,j,k,n:longint;
x,y:array[0..5000] of real;
f:array[0..1800,0..1800,0..1] of real;
ans:real;
function dis(i,j:longint):real;
begin
  i:=i mod n; j:=j mod n;
  if i=0 then i:=n; if j=0 then j:=n;
  dis:=sqrt(sqr(x[i]-x[j])+sqr(y[i]-y[j]));
end;
function min(a,b:real):real;
begin
  if a=0 then exit(b); if b=0 then exit(a);
  if a>b then exit(b)
  else exit(a);
end;
begin
assign(input,'b.in');reset(input);
fillchar(f,sizeof(f),0);
  ans:=maxlongint;
  read(n);
  for i:=1 to n do
 read(x[i],y[i]);
  for k:=1 to n-1 do
  for i:=1 to 2*n-1-k do
    begin
     j:=i+k;
      f[i,j,0]:=min(f[i,j-1,1]+dis(i,j),f[i+1,j,0]+dis(i,i+1));
      f[i,j,1]:=min(f[i,j-1,1]+dis(j,j-1),f[i,j-1,0]+dis(i,j));
    end;
  for i:=1 to n do ans:=min(min(f[i,i+n-1,0],f[i,i+n-1,1]),ans);
  writeln(ans:0:3);
end.

//---------
   f[i,j,0]:=min(f[i,j-1,1]+dis(i,j),f[i+1,j,0]+dis(i,i+1));
   f[i,j,1]:=min(f[i,j-1,1]+dis(j,j-1),f[i,j-1,0]+dis(i,j));
//---------


