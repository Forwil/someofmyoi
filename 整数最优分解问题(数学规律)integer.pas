program integer;
const p=10000000;
var n,i,j,k,t3,t2,t4:longint;
    ans,t:array[0..1000]of longint;
begin
assign(input,'input.txt'); reset(input);
assign(output,'output.txt');rewrite(output);
readln(n);
if n=1 then
 begin
 writeln('1');
 close(output);
 halt;
 end;
ans[0]:=1;
ans[1]:=1;
if n mod 3=0 then
 begin
 t3:=n div 3;
 t2:=0;
 t4:=0;
 end;
if n mod 3=1 then
 begin
 t4:=1;
 t3:=(n-4) div 3 ;
 t2:=0;
 end;
if n mod 3=2 then
 begin
 t4:=0;
 t2:=1;
 t3:=(n-2) div 3;
 end;

  for i:=1 to t3 do
   begin
    t:=ans;
    for j:=1 to ans[0] do
     ans[j]:=t[j]*3;
    for j:=1 to ans[0] do
     begin
     ans[j+1]:=ans[j+1]+ans[j] div p;
     ans[j]:=ans[j] mod p;
     end;
    while ans[ans[0]+1]<>0 do
     begin
     ans[0]:=ans[0]+1;
     ans[ans[0]+1]:=ans[ans[0]+1]+ans[ans[0]] div p;
     ans[ans[0]]:=ans[ans[0]] mod p;
     end;
   end;

 for i:=1 to t2 do
  begin
    t:=ans;
    for j:=1 to ans[0] do
     ans[j]:=t[j]*2;
    for j:=1 to ans[0] do
     begin
     ans[j+1]:=ans[j+1]+ans[j] div p;
     ans[j]:=ans[j] mod p;
     end;
    while ans[ans[0]+1]<>0 do
     begin
     ans[0]:=ans[0]+1;
     ans[ans[0]+1]:=ans[ans[0]+1]+ans[ans[0]] div p;
     ans[ans[0]]:=ans[ans[0]] mod p;
     end;
  end;

 for i:=1 to t4 do
 begin
  t:=ans;
    for j:=1 to ans[0] do
     ans[j]:=t[j]*4;
    for j:=1 to ans[0] do
     begin
     ans[j+1]:=ans[j+1]+ans[j] div p;
     ans[j]:=ans[j] mod p;
     end;
    while ans[ans[0]+1]<>0 do
     begin
     ans[0]:=ans[0]+1;
     ans[ans[0]+1]:=ans[ans[0]+1]+ans[ans[0]] div p;
     ans[ans[0]]:=ans[ans[0]] mod p;
     end;
 end;

write(ans[ans[0]]);
for i:=ans[0]-1 downto 1 do
 begin
 if ans[i]<10 then write('0');
 if ans[i]<100 then write('0');
 if ans[i]<1000 then write('0');
 if ans[i]<10000 then write('0');
 if ans[i]<100000 then write('0');
 if ans[i]<1000000 then write('0');
 write(ans[i]);
 end;
 writeln;
 close(output);
end.
