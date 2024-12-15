# Feed for animals
A company produces animal feed with the following raw materials: barley, oats, sugar beet pulp, and peanut meal; 
1 hg (= 100 g) of feed should contain at least 20 g of protein and 5 g of fat. 
Protein and fat contained in 1 hg of each raw material and their unitary costs are summarized in the following table:

|        | Protein [ g ] | Fat [ g ] | Cost [ $\text{€}$ /hg ] |
| :---   |    :----:   | :----:  |                 ---: |
| barley | 12          | 2       | 0.24                 |
| oats   | 12          | 6       | 0.30                 |
| sugar  | 40          | 12      | 0.40                 |
| peanut | 60          | 20      | 0.50                 |

The company has to produce feed to minimize the total cost.

- Formulate the problem as a Linear Programming problem.
- Write the model in AMPL and solve it using Gurobi.

## Solution:
Given $x_i > 0.0$ the hg of each raw material in 1 hg of feed: 

$$ \mathbf{x} = \begin{bmatrix} x_0 \\ 
x_1 \\ 
x_2 \\ 
x_3 
\end{bmatrix}$$

we can write an LP problem in the following way:

$$\mathbf{x}^* = \text{argmin} \ 0.24x_0 + 0.3x_1 + 0.4x_2 + 0.5x_3$$
$$\text{s.t.} \hspace{4cm}$$
$$12x_0 + 12x_1 + 40x_2 + 60x_3  \ge  20 $$
$$2x_0 + 6x_1 + 12x_2 + 20x_3  \ge  5  $$
$$x_0 + x_1 + x_2 + x_3  =  1 $$
$$x_i  \ge  0  \quad \forall i $$

Important: the third constraint imposes that 1 hg of feed is made mixing the 4 raw materials.


In a more generic formalization, we can define the set $\mathcal{M}$ of the raw food, and given $p \in \mathcal{M}$, $f \in \mathcal{M}$, and $c \in \mathcal{M}$, the protein, fat, and cost respectively, per raw material, we can write the following  generic LP:

$$\mathbf{x}^* = \text{argmin} \ \sum_{i\in M} c_i x_i$$
$$\text{s.t.} \hspace{4cm}$$
$$\sum_{i\in M} p_i x_i  \ge  20 $$
$$\sum_{i\in M} f_i x_i  \ge  5  $$
$$\sum_{i\in M} x_i  =  1  $$
$$x_i  \ge  0 \quad \forall i $$



