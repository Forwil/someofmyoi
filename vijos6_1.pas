program vijos6_1;
var  ind,s1,s2,s3,s:ansistring;
     i,j,k,m,l:longint;
procedure dfs(s:ansistring;x:longint);
var i,k,l:longint;
    s1,s2:ansistring;
begin
for l:=1 to x do
 begin
 readln(s1);
 if pos('.',s1)<>0 then
  begin
  if s1=ind  then writeln(s+ind);
  end
 else
  begin
    begin
    s2:=copy(s1,1,pos(' ',s1)-1);
    delete(s1,1,pos(' ',s1));
    val(s1,i,j);
    dfs(s+s2+'\',i);
    end;
  end;
 end;
end;
begin
assign(input,'n1.in');reset(input);
 readln(ind);
while not(eof) do
 begin
  readln(s);
  if pos('.',s)<>0 then
    begin
    if s=ind then writeln(s);
    end
   else
    begin
    s1:=copy(s,1,pos(' ',s)-1);
    delete(s,1,pos(' ',s));
    val(s,i,j);
    dfs(s1+'\',i);
    end;
 end;
end.
