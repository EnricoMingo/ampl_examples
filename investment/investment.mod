set I;

#var x{I};
#var x{I} integer;
var x{I} binary;

param w{I};

param p{I};

maximize return: sum{i in I} p[i]*x[i];

s.t. budget_constraint: sum{i in I} w[i]*x[i] <= 137;
s.t. positive{i in I}: x[i] >= 0. 