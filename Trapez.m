function I = Trapez(x, y)

n = length(x);
I = 0;
%doar adun ariile si iese

for i=1:(n-1)
	I+=( ( y(i) + y(i+1) ) * ( x(i+1) - x(i) )/2 );
endfor

I+=( ( y(n) + y(1) ) * ( x(1) - x(n) )/2 );

if I < 0
	I*=( -1 );
endif

endfunction
