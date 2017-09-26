DATA SP4R.CHISQUARE (drop=i);
	CALL STREAMINIT(123);
	DO i=1 to 1000;
	chi = rand("Chisquare",20);
	output;
	end;
run;

proc sgplot data= sp4r.chisquare;
	histogram chi/binwidth=1 scale= count;
	density chi/type=normal;
	density chi/type=kernel;
	title "My Random Chi-Square Distribution";
	xaxis label="Random Chi-Square Deviates" min=5 max=40;
run;

DATA SP4R.reg_data;
	CALL STREAMINIT(123);
	do x = 1 to 30;
	   beta0 = 25;
	   beta1 = 1;
	   y = beta0 + beta1*x+rand("normal",0,5);
	   output;
	end;
run;
/*reg scatter plot*/
proc sgplot data=sp4r.reg_data;
	reg x=x y=y/lineattrs=(color=red pattern=dot) 
		legendlabel="Line of Best Fit";
	scatter x=x y=y/ markerattrs=(color=blue symbol=STARFILLED)
		legendlabel="Scatter";
	title "My Scatter Plot";
	xaxis label="X Values" min=0 max=31;
	yaxis label="Y Values" min=15 max= 65;
run;
/*needle plot*/
proc sgplot data=sp4r.reg_data;
	PBSPLINE x=x y=y/lineattrs=(color=red pattern=dot) 
		legendlabel="Line of Best Fit";
	NEEDLE x=x y=y/ markerattrs=(color=blue symbol=STARFILLED)
		legendlabel="Needle";
	title "My Scatter Plot";
	xaxis label="X Values" min=0 max=31;
	yaxis label="Y Values" min=15 max= 65;
run;



	