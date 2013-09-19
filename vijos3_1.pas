program vijos3_1;
var ind:array[0..100005]of longint;
   i,j,k,n,m:longint;
   ans:int64;
function max(a,b:longint):longint;
begin if a>b then max:=a else max:=b;end;
function min(a,b:longint):longint;
begin if a>b then min:=b else min:=a;end;
begin
readln(n);
for i:=1 to n do
 read(ind[i]);
 ans:=0;
for i:=1 to n-2 do
 begin
  if (ind[i+1]>ind[i])and(ind[i+1]>ind[i+2]) then
    begin
      ans:=ans+(ind[i+1]-max(ind[i],ind[i+2]));
      ind[i+1]:=max(ind[i],ind[i+2]);
      ans:=ans+abs(ind[i+1]-ind[i])
    end
   else
  if (ind[i+1]<ind[i])and(ind[i+1]<ind[i+2]) then
    begin
     ans:=ans+(min(ind[i],ind[i+2])-ind[i+1]);
     ind[i+1]:=min(ind[i],ind[i+2]);
      ans:=ans+abs(ind[i+1]-ind[i]);
    end
   else
      ans:=ans+abs(ind[i+1]-ind[i]);
 end;
 ans:=ans+abs(ind[n]-ind[n-1]);
writeln(ans);
end.
