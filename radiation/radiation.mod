set B; #Beam set

set HC; #Healty Cells set
set TC; # Tumore Cells set
set CeC ; # Center Cells set
set CrC; # Critical Cells set

set C = HC union TC union CeC union CrC; 

var x{i in B} >= 0;

param rad{C,B}; #constraints

param minr{CeC};
param r{TC};
param maxr{CrC};

minimize cost: sum{i in HC, j in B} rad[i,j]*x[j];

s.t. upper{i in CrC}: sum{j in B} rad[i,j]*x[j] <= maxr[i];
s.t. equality{i in TC}: sum{j in B} rad[i,j]*x[j] = r[i];
s.t. lower{i in CeC}: sum{j in B} rad[i,j]*x[j] >= minr[i];


