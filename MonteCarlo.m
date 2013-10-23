function AN = MonteCarlo(x, y, tol)

n=length(x);
xmin=min(x);
xmax=max(x);
ymin=min(y);
ymax=max(y);

AD = (xmax-xmin)*(ymax-ymin);
% N-ul initial este 512 pentru ca este  putere a lui 2 
% ce poate genera puncte bine uniform aleatorii si este
% destul de mare pentru o aproximatie buna
N = 256;
AN = A2N = 0;

x(n+1) = x(1);
y(n+1) = y(1);

while abs(A2N-AN)>tol || A2N==0

	AN = A2N;
	N*=2;
	[Gx,Gy] = Gen2DPoints(N,xmin,xmax,ymin,ymax);
	Nint = 0;
	%vad daca punctele sunt in poligon

	for k=1:N
		%verific ce drepte au coordonatele y ce inconjoara y-ul punctului
 
		A1 = y(1:n) > Gy(k);
		A1(n+1) = A1(1);
		[r c] = find( A1(1:n) != A1(2:n+1) );
		%verific daca dreapta se afla dreapta punctului
 
		T= Gx(k) < ((( x( r(:) ) - x( r(:)+1 ) ) .* ( Gy(k) - y( r(:) ) )) ./ ( y( r(:)+1 ) - y( r(:) ) ) + x( r(:) ) );
		%daca este numar impar se afla in poligon
		if mod(sum(T),2)==1
			Nint++;
		endif

	endfor

	A2N = (Nint/N)*AD;

endwhile

endfunction
	
