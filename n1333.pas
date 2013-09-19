program cor;
var
  m,k:longint;
  begin
   readln(m);
  k:=1;
   while m-k>0 do
  begin
    dec(m,k);
    inc(k);
  end;
   if k mod 2=0 then writeln(m,'/',k-m+1) else
    writeln(k-m+1,'/',m);

end.