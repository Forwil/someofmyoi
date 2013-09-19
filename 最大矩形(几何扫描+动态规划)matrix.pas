program matrix;
var sum:Array[0..101,0..101]of longint;
    a,b,fa,fb:array[0..101,0..101]of longint;
  ss,ans,z,s,x,i,j,k,n,m:longint;
function max(a,b:longint):longint;
begin if a>b then max:=a else max:=b;end;
function min(a,b:longint):longint;
begin if a>b then min:=b else min:=a;end;
begin
assign(input,'matrix.in');reset(input);
assign(output,'matrix.out');rewrite(output);
readln(n,m);
for i:=1 to n do
for j:=1 to m do
 begin
 read(x);
 sum[i,j]:=sum[i-1,j]+x;
 if j=m then readln;
 end;
fillchar(a,sizeof(a),$f7);
fillchar(b,sizeof(b),$f7);
fillchar(fa,sizeof(fa),63);
fillchar(fb,sizeof(fb),63);
for i:=1 to n do
for j:=i to n do
begin
 s:=0;
 ss:=0;
 for z:=1 to m do
  begin
if s>0 then s:=s+sum[j,z]-sum[i-1,z]
else s:=sum[j,z]-sum[i-1,z];
if ss<0 then ss:=ss+sum[j,z]-sum[i-1,z]
else ss:=sum[j,z]-sum[i-1,z];
  a[j,z]:=max(a[j,z],a[j,z-1]);
  a[j,z]:=max(a[j,z],a[j-1,z]);
  a[j,z]:=max(a[j,z],s);
  fa[j,z]:=min(fa[j,z],fa[j,z-1]);
  fa[j,z]:=min(fa[j,z],fa[j-1,z]);
  fa[j,z]:=min(fa[j,z],ss);
  end;
end;

for i:=n downto 1 do
for j:=i downto 1 do
begin
s:=0;
ss:=0;
 for z:=m downto 1 do
  begin
 if s>0 then  s:=s+sum[i,z]-sum[j-1,z]
 else s:=sum[i,z]-sum[j-1,z];

 if ss<0 then ss:=ss+sum[i,z]-sum[j-1,z]
 else ss:=sum[i,z]-sum[j-1,z];
  b[j,z]:=max(b[j,z],b[j+1,z]);
  b[j,z]:=max(b[j,z],b[j,z+1]);
  b[j,z]:=max(b[j,z],s);
  fb[j,z]:=min(fb[j,z],fb[j+1,z]);
  fb[j,z]:=min(fb[j,z],fb[j,z+1]);
  fb[j,z]:=min(fb[j,z],ss);
  end;
end;

ans:=-maxlongint;
for i:=1 to n-1 do
 begin
 ans:=max(ans,a[i,m]*b[i+1,1]);
 ans:=max(ans,fa[i,m]*fb[i+1,1]);
 end;

for i:=1 to m-1 do
 begin
 ans:=max(ans,a[n,i]*b[1,i+1]);
 ans:=max(ans,fa[n,i]*fb[1,i+1]);
 end;
writeln(ans);
close(output);
end.
