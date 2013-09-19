program car;
var t,v:Array[0..1000000]of real;
      fl:array[0..1000000]of integer;
     id:array[0..1000000]of longint;
x,i,j,k,n,m,t1,t2,out:longint;
z,min,y,ans:real;

procedure swap(x,y:longint);
begin
 t[0]:=t[x];id[0]:=id[x]; fl[0]:=fl[x];
 t[x]:=t[y];id[x]:=id[y]; fl[x]:=fl[y];
 t[y]:=t[0];id[y]:=id[0]; fl[y]:=fl[0];
end;

procedure dsort(i,m:longint);
begin

while i*2<=m do
 begin
 i:=i*2;
 if (i<m)and(t[i]>t[i+1])then inc(i);
 if t[i]<t[i div 2]then
     swap(i,i div 2)
     else break;
 end;

end;
begin
assign(input,'car.in');reset(input);
assign(output,'car.out');rewrite(output);
readln(n,m,k);
for i:=1 to n do
  begin
  readln(v[i],x,z);
  if x=-1 then t[i]:=z/v[i];
  if x=1 then t[i]:=(m-z)/v[i];
  fl[i]:=x;
  id[i]:=i;
  end;
for i:=n div 2 downto 1 do dsort(i,n);

for i:=1 to n+2*k do
begin
if out=n then break;
if t[1]>ans then ans:=t[1];
 if fl[1]=-1 then
  begin
  if t1<k then
    begin
    t1:=t1+1;
    t[1]:=t[1]+m/v[id[1]];
    fl[1]:=-fl[1];
    dsort(1,n);
    end
   else
    begin
    out:=out+1;
    t[1]:=1E38;
    dsort(1,n);
    end;
  end
 else
  begin
   if t2<k then
     begin
     t2:=t2+1;
     t[1]:=t[1]+m/v[id[1]];
     fl[1]:=-fl[1];
     dsort(1,n);
     end
   else
     begin
     out:=out+1;
     t[1]:=1e38;
     dsort(1,n);
     end;
  end;
end;
writeln(ans:0:2);
close(output);
end.