# Cellular Network
In a cellular network, each client must be assigned to an antenna to be served. 
The set $C = \langle 1, . . . , n \rangle$ of clients and the set $S = \langle 1, . . . , m \rangle$ of candidate sites where an antenna 
can be located are known. 
If client $i \in C$ is assigned to the antenna located in $j \in S$, the antenna must emit at least a power $p_{i,j}$. 
Installing an antenna in candidate site $j$ costs $c_j$. 
A budget of $B$ for the antenna installation is given. We have to decide where to locate antennas, to provide service to each client, 
while minimizing the maximum emitted power. Formulate the problem as an Integer Linear Programming problem.
Write the model in AMPL and solve it using Gurobi.

## Solution
We define the binary variable $y_j \in S$ as:
- 1, if an antenna is installed in $j$;
- 0 otherwise,
  
and the variable $x_{i,j} \in C \times S$ as:
- 1, if client $i$ is assigned to an antenna in $j$;
- 0 otherwise.

We can define the following ILP where we want to minimize the maximum power:

$$\mathbf{x}^* , \mathbf{y}^* = \text{argmin} \ \text{max} \ p_{i,j} x_{i,j}$$
$$\text{s.t.} \hspace{4cm}$$
$$\sum_{j\in S} c_j y_j  \leq  B $$
$$\sum_{j\in S} x_{i,j}  =  1 \ \forall i \in C $$
$$ x_{i,j}  \leq  y_{j} \ \forall i \in C, \ \forall j \in S $$
$$ x_{i,j} \in \langle 0, 1 \rangle \ \forall i \in C, \ \forall j \in S$$
$$ y_{j} \in \langle 0, 1 \rangle \ \forall j \in S$$

Notice that the second constraint is used to impose that at most 1 antenna $j$ is given to a client $i$, while the third constraint associates
the antenna location to the client:

$$ \text{if} \ x_{i,a} = 1, \ \text{then} \ y_{a} = 1, \ \text{else} \ y_{a} = 0, \ \forall i \in C$$

for a certain antenna $j = a$. 

However, the problem written in this way is not linear, to make it linear we introduce the new variable $z$ and we rewrite the problem in the 
following form:

$$\mathbf{x}^* , \mathbf{y}^* = \text{argmin} \ z$$ 
$$\text{s.t.} \hspace{4cm}$$
$$z \geq p_{i,j} x_{i,j} \ \forall i\in C, \forall j\in S$$
$$\sum_{j\in S} c_j y_j  \leq  B $$
$$\sum_{j\in S} x_{i,j}  =  1 \ \forall i \in C $$
$$ x_{i,j}  \leq  y_{j} \ \forall i \in C, \ \forall j \in S $$
$$ x_{i,j} \in \langle 0, 1 \rangle \ \forall i \in C, \ \forall j \in S$$
$$ y_{j} \in \langle 0, 1 \rangle \ \forall j \in S$$
$$ z \geq 0$$
