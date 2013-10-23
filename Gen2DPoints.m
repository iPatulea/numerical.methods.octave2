function [x,y]=Gen2DPoints(N,a,b,c,d)


Na=N;
i=0;

while Na!=1
	if mod(Na,2)!=0
		break;
	endif
	Na/=2;
	i++;
endwhile

if Na==1
	%daca numarul de puncte e o puetere a lui 2 atunci se poate imparti bine aria in patratele mici
	n=i;
	k=1;
	k1=1;
	k2=1;
	if mod(n,2)==0
		dtx=(b-a)/(2^(n/2));
		dty=(d-c)/(2^(n/2));
		for i=a:dtx:b-dtx
			for j=c:dty:d-dty
				x(k1)=rand()*dtx+i;
				y(k2)=rand()*dty+j;
				k1++;
				k2++;
			endfor
		endfor
	else
		dtx=(b-a)/(2^((n-1)/2));
		dty=(d-c)/(2^((n-1)/2));
		for i=a:dtx:b-dtx
			for j=c:dty:d-dty
				x(k)=rand()*dtx+i;
				x(k+1)=rand()*dtx+i;
				y(k)=rand()*dty+j;
				y(k+1)=rand()*dty+j;
				k+=2;
			endfor
		endfor
	endif

else
	%daca nu este rand 100%
	x=(b-a).*rand(N,1)+a;
	y=(d-c).*rand(N,1)+c;

endif

endfunction
