program campus;
const p=250103;
var hash:array[0..p]of int64;
      id:array[0..p]of longint;
i,j,k,n,m:longint;
x,y:int64;
procedure ha(x:int64);
var i,j,k:longint;
begin
 k:=x mod p;
 i:=0;
 while (hash[(i+k)mod p]<>0)and(hash[(i+k)mod p]<>X) do inc(i);
 if k+i>m then m:=k+i;
if hash[(i+k)mod p]=0 then
      begin
      hash[k+i]:=x;
      id[k+i]:=1;
      exit;
      end;
if hash[(i+k)mod p]=x then
       begin
       id[k+i]:=id[k+i]+1;
       exit;
       end;
end;
begin
assign(input,'campus.in');
reset(input);
assign(output,'campus.out');rewrite(output);
readln(n);
fillchar(hash,sizeof(hash),0);
for i:=1 to n do
 begin
 readln(k);
 ha(k);
 end;
 x:=0;
 y:=0;
for i:=0 to m do
 begin
 if id[i]*2>n then
  x:=hash[i] else
 if id[i] mod 2=1 then
  y:=hash[i];
  if (x<>0)and(y<>0) then break;
 end;
 writeln(x,' ',y);
 close(output);
end.
