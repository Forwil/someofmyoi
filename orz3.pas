program orz3;
var d:Array[0..1210001]of byte;
    ind:array[0..1101,0..1101]of longint;
    z,i,j,k,n,m,ans,l:longint;
begin
readln(n,m);
for i:=1 to n do
begin
k:=0;
if i mod 2=1 then l:=0
else l:=3;
 for j:=1 to m do
   begin
    read(ind[i,j]);
    if j=m then readln;
    for z:=1 to i do
     if not(d[ind[z,j]] in [1+l,2+l]) then
      begin
      k:=k+1;
      d[ind[z,j]]:=1+l;
      end
      else
     if d[ind[z,j]]=1+l then
      begin
      k:=k-1;
      d[ind[z,j]]:=2+l;
      end;
     ans:=(ans+k)mod 19900907;
    end;
  end;
  writeln(ans);
end.
