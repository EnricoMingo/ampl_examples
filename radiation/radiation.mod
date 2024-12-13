set B; #Beam set

set HC; #Healty Cells set
set TC; # Tumore Cells set
set CeC ; # Center Cells set
set CrC; # Critical Cells set

set C = HC union TC union CeC union CrC; 

var x{i in B} >= 0;

param rad{C,B}; #constraints

param minr{CrC};
param r{TC};
param maxr{CeC};

minimize cost: sum{i in HC, j in B} rad[i,j]*x[j];

s.t. lineq{i in CrC}: sum{j in B} rad[i,j]*x[j] <= minr[i];
s.t. equality{i in TC}: sum{j in B} rad[i,j]*x[j] = r[i];
s.t. uineq{i in CeC}: sum{j in B} rad[i,j]*x[j] >= maxr[i];


