set F; 
set R; 

var x{F} >= 0; 
var y{R, F} >= 0;

param p{F}; # price
param c{R}; # cost

param b{R}; # barrels


maximize profit: sum{i in F} p[i]*x[i] - sum{i in F, j in R} c[j]*y[j,i];  

s.t. barrels{j in R}: sum{i in F} y[j,i] <= b[j]; 
s.t. oils{i in F}: sum{j in R} y[j,i] = x[i];

s.t. constraint1_A: y[2,'A'] >= 0.2*x['A'];
s.t. constraint2_A: y[3,'A'] <= 0.3*x['A'];

s.t. constraint1_B: y[3,'B'] >= 0.4*x['B'];

s.t. constraint1_C: y[2,'C'] <= 0.5*x['C'];
