* Encoding: UTF-8.

CD "C:\Users\jaerikson\OneDrive - University of Arizona\Documents\analyses_SPSS\ALCANCE_reading_habits".
GET FILE = "TMD123_Master_Scored.sav".
DATASET NAME data.


title correlations.
subtitle correlations for all participants.

correlations
    /VARIABLES= T1MMOD T1DMOD T2READ T2RATTap T2RATTad T2RATTrp T2RATTrd
       /PRINT=TWOTAIL NOSIG
    /MISSING=listwise.

subtitle correlations by gender.

sort cases by TGENr.
split file layered by TGENr.

correlations
    /VARIABLES= T1AGE T1MMDL T1DMDL T1TATT T1ACIDM T1ACIDS
    /PRINT=TWOTAIL NOSIG
    /MISSING=listwise.

split file off.

 * subtitle Means and SDs for continuous variables, by gender.

 *   means tables= TGRDM1r TGRDS1r TGRDSS1r TGRDE1r T1GPA
  TGRDM2r TGRDS2r TGRDSS2r TGRDE2r T2GPA
   TGRDM3r TGRDS3r TGRDSS3r TGRDE3r T3GPA
 by TGEN2
    /cells=count mean stddev.
 * execute.

 * frequencies variables=  MSPED2 DSPED2 
    TGRDM1__2 TGRDM2 TGRDM3
    TGRDS1__2 TGRDS2 TGRDS3
    TGRDSS1__2 TGRDSS2 TGRDSS3
    TGRDE1__2 TGRDE2 TGRDE3
    TGRDM1r TGRDM2r TGRDM3r
    TGRDS1r TGRDS2r TGRDS3r
    TGRDSS1r TGRDSS2r TGRDSS3r
    TGRDE1r TGRDE2r TGRDE3r
    /statistics=default
    /order=analysis.
 * execute.




