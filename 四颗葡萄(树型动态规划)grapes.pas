program grapes;
type link=^sf;
 sf=record
id:longint;
next:link;
end;
var
   ln:array[0..70000]of link;
    b:array[0..70000]of boolean;
    dp:array[0..70000,0..1]of integer;
   ans,max,tot,x,y,i,j,k,n,m,t,out:longint;
   q:link;   can:boolean;
procedure dfs(x:longint);
var q:link;  k,yy,y:longint; find:boolean;
begin
 q:=ln[x];
 b[x]:=false;
 dp[x,0]:=0;
 dp[x,1]:=1;
 find:=false;
 yy:=0;
 y:=0;
 while q<>nil do
   begin
   if b[q^.id] then
     begin
     dfs(q^.id);
     dp[x,0]:=dp[x,0]+dp[q^.id,0];
      if dp[q^.id,1]>yy then
             begin
             y:=yy;
             yy:=dp[q^.id,1];
             end
       else
      if dp[q^.id,1]>y then y:=dp[q^.id,1];
     end;
   q:=q^.next;
   end;
if yy+y+1>=4 then
 begin
 dp[x,0]:=dp[x,0]+1;
 dp[x,1]:=0;
 end
else
 dp[x,1]:=yy+1;
end;
begin
assign(input,'grapes.in');
reset(input);
assign(output,'grapes.out');rewrite(output);
readln(n);
for i:=1 to n-1 do
begin
 readln(x,y);
 new(q);
 q^.id:=x;
 q^.nexT:=ln[y];
 ln[y]:=q;
 new(q);
 q^.id:=y;
 q^.next:=ln[x];
 ln[x]:=q;
end;
 fillchar(b,sizeof(b),true);
 b[1]:=false;
 dfs(1);
 writeln(dp[1,0]);
 close(output);
end.
