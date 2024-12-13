set M;

var x{M} >= 0;

param p{M};
param f{M};
param c{M};

minimize cost: sum{i in M} c[i]*x[i];

s.t. fat: sum{i in M} f[i]*x[i] >= 5.;
s.t. protein: sum{i in M} p[i]*x[i] >= 5.;
s.t. hg: sum{i in M} x[i] = 1.;