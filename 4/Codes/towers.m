function[] = towers(n,frompeg,topeg,auxpeg);
if (n == 1)
fprintf('\t move disk 1 from peg %c to peg %c \n',frompeg,topeg);
else
towers(n-1,frompeg,auxpeg,topeg);
fprintf('\t move disk %d frompeg %c to peg %c \n',n,frompeg,topeg);
towers(n-1,auxpeg,topeg,frompeg);
end;