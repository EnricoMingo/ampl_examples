# Investments
Consider the problem of deciding how to invest a capital $C = 137 \ k\text{€}$. 
The set of possible financial investments is reported in the following table. 
Each investment $i$ is described by the amount which can be bought $w_i$ and by the return $p_i$ which is gained if it is bought. 
Notice that each investment can be either bought in a while or not bought at all. 
The aim is to select the investments to maximize the profit. 
Formulate the problem as an Integer Linear Programming problem.

| investment $i$ | 1 | 2 | 3 | 4 | 5|
| :--- | :----: | :----: | :----: | :----: | ---: |
| amount $w_i \ [ k\text{€} ]$ | 40 | 12 | 130 | 5 | 400 |
| return $p_i \ [ k\text{€} ]$ | 3.2 | 1.5 | 4.2 | 0.7 | 1.7 |

Write the model in AMPL and solve it using Gurobi.

## Solution
We define the set $I$ of the Investments. The amount of investments $w \in I$ and the return $p \in I$.

We consider the binary variable $x \in I$ meaning:
- 1 if the investment is bought
- 0 otherwise.

We can define the following BLP (Binary Linear Program):
  
$$\mathbf{x}^* = \text{argmax} \ \sum_{i\in I} p_i x_i$$
$$\text{s.t.} \hspace{4cm}$$
$$\sum_{i\in I} w_i x_i  \leq  C $$
$$ x_i \in \langle 0, 1 \rangle \quad \forall i \in I$$

Notice: if $x_i \geq 0.0$ is Real we are permitted to buy partial parts of the investments, while if $x_i \geq 0.0$ is Integer we are considering the investments to be boughtable more times. In the first case the BLP turns into a classical LP, in t he second case turns into a MILP (Mixed Integer Linear Program). 
