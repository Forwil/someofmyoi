var n,k,i,j:longint;
  f:array[0..500,0..500]of longint;
  begin
   read(n,k);
    f[0,0]:=1;
     for i:=1 to n do
     for j:=1 to k do
       if i-j>=0 then
       f[i,j]:=f[i-1,j-1]+f[i-j,j];
      writeln(f[n,k]);
      end.