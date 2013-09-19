program  sequence;
var ind:array[0..50001]of longint;
     m,o:array[0..25001]of longint;
  t, ans,i,j,k,n:longint;
procedure merge(l,mi,r:longint);
var l1,l2,i,j,x:longint;
begin
 l1:=mi-l+1;
 l2:=r-mi;
 for i:=1 to l1 do m[i]:=ind[l+i-1];
 for i:=1 to l2 do o[i]:=ind[mi+i];
 m[l1+1]:=maxlongint;
 o[l2+1]:=maxlongint;
 i:=1;
 j:=1;
 for x:=l to r  do
  if m[i]<=o[j]then
        begin
        ind[x]:=m[i];
        i:=i+1;
        end
   else
       begin
       ind[x]:=o[j];
       j:=j+1;

       ans:=ans+l1-i+1;
       end;
end;
procedure mergesort(l,r:longint);
var mi:longint;
begin
if l<r then
   begin
   mi:=(l+r)shr 1;
   mergesort(l,mi);
   mergesort(mi+1,r);
   merge(l,mi,r);
   end;
end;
function count(x:longint):longint;
  var i,j:longint;
begin
if x=0 then exit(1)
else
if x=1 then exit(2)
else
  begin
    i:=count(x shr 1)mod 1991;
    j:=count(x mod 2)mod 1991;
    count:=(i*i*j)mod 1991;
  end;
end;
begin
assign(input, 'sequence.in');reset(input);
assign(output,'sequence.out');rewrite(output);
readln(n);
for i:=1 to n do
read(ind[i]);
mergesort(1,n);
writeln(count(ans));
close(output);
end.
