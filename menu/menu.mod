set F; #Food set
set V; #Vegetable set 
set C; #Carbo


var x{F} >= 0.;
var y{C} binary;

param c{F};
param p{F};

minimize cost: sum{i in F} p[i]*x[i] + sum{i in F} 0.0*x[i]*x[i];

s.t. calories: sum{i in F} c[i]*x[i] >= 700.;
s.t. veg: sum{i in C} c[i]*x[i] <= sum{j in F} 0.3*c[j]*x[j];

s.t. big_M{i in C}: x[i] <= 1e4*y[i]; 
s.t. one_carb: sum{i in C} y[i] <= 1.; 