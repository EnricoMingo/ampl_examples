set C;
set S;

var x{C, S} binary;
var y{S} binary;

param budget;

param c{S};

param p{C, S};

var z;

minimize max_power: z;
s.t. max_value{i in C, j in S}: z >= p[i,j]*x[i,j];

s.t. cost: sum{j in S} y[j]*c[j] <= budget; 

s.t. antenna_per_client{i in C}: sum{j in S} x[i,j] = 1; 
s.t. site_selection{i in C, j in S}: x[i,j] <= y[j]; 
