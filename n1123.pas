program n1123;
var ind:array[0..101]of longint;
  i,j,k,n,m,avg,ans:longint;
begin
 readln(n);
 for i:=1 to n do
  begin
  read(ind[i]);
  inc(ind[0],ind[i]);
  end;
 k:=ind[0] div n;
 for i:=1 to n do
  if ind[i]<>k then
  begin
    if ind[i]<k then
     begin
     ind[i+1]:=ind[i+1]-(k-ind[i]);
     inc(ans);
     end
    else
     begin
     ind[i+1]:=ind[i+1]+(ind[i]-k);
     inc(ans);
     end;
 end;
   writeln(ans);
end.