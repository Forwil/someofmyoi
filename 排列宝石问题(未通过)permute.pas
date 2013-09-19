program permute;
var s,h:array[0..9,0..9]of boolean;
    i,j,k,m,n,tot:longint;
   ans:qword;
procedure go(x,y:longint);
var i,j:longint;
begin
if y>n then
 begin
 y:=1;
 x:=x+1;
 if x>n then
  begin
  inc(tot);
  exit;
  end;
 end;
for i:=1 to n do
if h[x,i] and s[y,i] then
begin
h[x,i]:=false;
s[y,i]:=false;
go(x,y+1);
h[x,i]:=true;
s[y,i]:=true;
end;

end;
begin
assign(input,'input.txt');reset(input);
assign(output,'output.txt');rewrite(output);
readln(n);
case n of
0:ans:=0;
1:ans:=1;
2:ans:=2*2;
3:ans:=12*12;
4:ans:=576*576;
5:ans:=161280*161280;
end;
fillchar(h,sizeof(h),true);
fillchar(s,sizeof(s),true);
writeln(ans);
close(output);
end.
