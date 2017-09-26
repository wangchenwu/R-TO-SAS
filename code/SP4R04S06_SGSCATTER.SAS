DATA SP4R.sgscatter;
	CALL STREAMINIT(123);
	DO i=1 to 300;
	   x = rand("normal",0,1);
	   y1 = rand("normal",0,1)+x;
	   y2 = rand("normal",0,1)+5*x;
	   output;
	end;
run;

PROC sgscatter data=sp4r.sgscatter;
	title "Scatter Plot Matrix"
	matrix x y1 y2/diagonal=(kernel histogram);
run;

PROC sgscatter data=sp4r.sgscatter;
	PLOT y1*x y2*x/reg;
	title "Scatter Plots"
run;

PROC SGSCATTER DATA=sp4r.sgscatter;
	COMPARE Y=(y1 y2) x=x/reg;
	title "Scatter Plots"
run;
