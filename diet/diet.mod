set F;
set N;

param Fmax{F};

var x{i in F} >= 0, <= Fmax[i];

param A{F, N}; 

param m{N}, default 0;
param M{N}, default 10000;

minimize final_cost : sum{i in F} A[i, 'cost']*x[i];

s.t. Calories_max: sum{i in F} A[i, 'Calories']*x[i] <= M['Calories'];
s.t. Calories_min: sum{i in F} A[i, 'Calories']*x[i] >= m['Calories'];

s.t. Protein_max: sum{i in F} A[i, 'Protein']*x[i] <= M['Protein'];
s.t. Protein_min: sum{i in F} A[i, 'Protein']*x[i] >= m['Protein'];

s.t. Calcium_min: sum{i in F} A[i, 'Calcium']*x[i] >= m['Calcium'];

s.t. Iron_min: sum{i in F} A[i, 'Iron']*x[i] >= m['Iron'];

s.t. Fiber_min: sum{i in F} A[i, 'Fiber']*x[i] >= m['Fiber'];

s.t. Fat_max: sum{i in F} A[i, 'Fat']*x[i] <= M['Fat'];
