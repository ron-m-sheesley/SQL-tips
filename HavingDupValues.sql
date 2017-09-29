
-- File having duplicate values
Select c1cst# from cams.cip010a where c1csfx=0 group By c1cst# Having count(c1cst#) > 1 ;