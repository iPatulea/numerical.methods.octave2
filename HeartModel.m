%Patulea Ionut
%CA313


function HeartModel(path)

	v=ls(path);
	v=sort(v);
	deblank(v);
	cd(path);
	[n,m]=size(v);

	for i=1:n
		%prelucrare fiecare fisier de intare 
		data = dlmread(v(i,:));
		x = data(:,1);
		y = data(:,2);
		cd ../;
		AT(i) = Trapez(x,y);
		AM(i) = MonteCarlo(x,y,1);
		cd(path);
		h(i) = data(1,3);

	endfor

	cd ../
	VT1 = 0;
	VM1 = 0;
	%calculare volum
	for i=1:n-1
		VT1+=( AT(i+1) + AT(i) ) * ( h(i+1) - h(i) )/2;
		VM1+=( AM(i+1) + AM(i) ) * ( h(i+1) - h(i) )/2;
	endfor
	%afisare
	printf("%.3f ",AT(:));
	printf("\n");
	printf("%.3f ",AM(:));
	printf("\n");
	printf("%.3f %.3f\n",VT1,VM1);
endfunction
