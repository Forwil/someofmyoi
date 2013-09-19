program abbr;
var ss,s,s1,s2,s3,s4:ansistring;
   ans,out:array[0..10000]of string;
   b:array[0..10000]of boolean;
   id:array[0..10000]of integer;
   i,j,k,n,m,tot,l:longint;
procedure sort(i,j:longint);
var x,y:longint;
  s:string;
begin
x:=i;
y:=j;
s:=ans[(x+y)shr 1];
repeat
while s<ans[y] do dec(y);
while s>ans[x] do inc(x);
if x<=y then
begin
ans[0]:=ans[x];
ans[x]:=ans[y];
ans[y]:=ans[0];
id[0]:=id[x];
id[x]:=id[y];
id[y]:=id[0];
inc(x);dec(y);
end;
until x>y;
if x<j then sort(x,j);
if i<y then sort(i,y);
end;
begin
assign(input,'abbr.in');
reset(input);
assign(output,'abbr.out');rewrite(output);
tot:=0;
 while not(eof) do
  begin
  s:='';s1:='';s2:='';s3:='';
  if not(eoln) then read(s);
   readln;
   while (length(s)>0)and(s[1]=' ') do delete(s,1,1);
   while (length(s)>0)and(s[length(s)]=' ') do delete(s,length(s),1);
   if s<>'' then
      begin
         k:=pos(' ',s);
         if k<>0 then
         begin
         s1:=copy(s,1,k-1);
         delete(s,1,k);
         end;
        while (s[1]=' ')and(length(s[1])>0) do delete(s,1,1) ;
         if k=0 then
           begin
           tot:=tot+1;
           ans[tot]:=upcase(s[1]+s[2]+s[3]);
           end
             else
               begin
                 k:=pos(' ',s);
                   if k<>0 then
                   begin
                   s2:=copy(s,1,k-1);
                   delete(s,1,k);
                   end;
                 while (s[1]=' ')and(length(s[1])>0) do delete(s,1,1);
                if k=0 then
                  begin
                  inc(tot);
                  ans[tot]:=upcase(s1[1]+s[1]+s[2]);
                  end
                 else
                 begin
                 k:=pos(' ',s);
                  if k<>0 then s3:=copy(s,1,k-1);
                 if k=0 then
                  begin
                  tot:=tot+1;
                  ans[tot]:=upcase(s1[1]+s2[1]+s[1]);
                  end
                 else
                 begin
                 tot:=tot+1;
                 ans[tot]:=upcase(s1[1]+s2[1]+s3[1]);
                 end;
                end;
                end;
       end;
  end;
  for i:=1 to tot do
  id[i]:=i;
  out:=ans;
  sort(1,tot);
  ans[0]:='';
  for i:=1 to tot do
  if (ans[i]=ans[i+1])or(ans[i]=ans[i-1]) then b[id[i]]:=true;
for i:=1 to tot do
 begin
 if b[i] then writeln(out[i],'#')
 ELSE WRITELN(out[i]);
 end;
 close(output);
end.
