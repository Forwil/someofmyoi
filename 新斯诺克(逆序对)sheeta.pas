program sheeta;
var a,ll,rr:array[0..100001]of longint;
    sum,i,j,k,n,m:longint;
    ans:int64;
procedure merge(l,mi,r:longint);
var i,j,k,l1,l2:longint;
begin
l1:=mi-l+1;
l2:=r-mi;
for i:=1 to l1 do ll[i]:=a[i+l-1];
for i:=1 to l2 do rr[i]:=a[i+mi];
 ll[l1+1]:=maxlongint;
 rr[l2+1]:=maxlongint;
 i:=1;
 j:=1;
 for k:=l to r do
  if ll[i]<rr[j] then
           begin
           a[k]:=ll[i];
           i:=i+1;
           ans:=ans+l2-j+1;
           end
       else
          begin
          a[k]:=rr[j];
          j:=j+1;
          end;
end;
procedure sort(l,r:longint);
var mi:longint;
begin
if l<r then
  begin
  mi:=(l+r)shr 1;
  sort(l,mi);
  sort(mi+1,r);
  merge(l,mi,r);
  end;
end;
begin
assign(input,'sheeta.in');
reset(input);
assign(output,'sheeta.out');rewrite(output);
readln(n,m);
ans:=0;
for i:=1 to n do
 begin
 read(k);
 sum:=sum+k;
 a[i]:=sum-i*m;
 end;
 sort(0,n);
 writeln(ans);
 close(output);
end.
