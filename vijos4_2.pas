program vijos4_2;
var   sum:Array[0..1001,0..1001]of longint;
      mm:array[0..1001,0..1001]of longint;
      ind:array[0..1001,0..1001]of longint;
   l,s1,s2,i,j,k,n,m,x,y:longint;  ans:longint;
function max(a,b:longint):longint;
begin if a>b then max:=a else max:=b;end;
begin
readln(n,k);
for i:=1 to n do
begin
 for j:=1 to n do
  begin
    read(ind[i,j]);
    sum[i,j]:=sum[i-1,j]+sum[i,j-1]-sum[i-1,j-1]+ind[i,j];
    if (i>=k)and(j>=k) then
     begin
     mm[i,j]:=max(mm[i-1,j],mm[i,j-1]);
     mm[i,j]:=max(sum[i,j]-sum[i-k,j]-sum[i,j-k]+sum[i-k,j-k],mm[i,j]);
     m:=sum[i,j]-sum[i-k,j]-sum[i,j-k]+sum[i-k,j-k];
  if m+max(mm[i-k,j],mm[i,j-k])>ans then
     ans:=m+max(mm[i-k,j],mm[i,j-k]);
     end;
  end;
  readln;
end;
fillchar(mm,sizeof(mm),0);
fillchar(sum,sizeof(sum),0);
for i:=1 to n do
begin
 for j:=n downto 1 do
  begin
    sum[i,j]:=sum[i-1,j]+sum[i,j+1]-sum[i-1,j+1]+ind[i,j];
    if (i>=k)and(j<=(n-k+1)) then
     begin
     mm[i,j]:=max(mm[i-1,j],mm[i,j+1]);
     mm[i,j]:=max(sum[i,j]-sum[i-k,j]-sum[i,j+k]+sum[i-k,j+k],mm[i,j]);
     m:=sum[i,j]-sum[i-k,j]-sum[i,j+k]+sum[i-k,j+k];
     if m+max(mm[i-k,j],mm[i,j+k])>ans then
     ans:=m+max(mm[i-k,j],mm[i,j+k]);
     end;
  end;
end;
writeln(ans);
end.
