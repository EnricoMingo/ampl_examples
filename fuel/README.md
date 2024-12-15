# Oil refinery
An oil refinery mixes 4 types of raw oil in order to produce 3 kinds of fuel: ”normal”, ”super95”, ”super98”. 
The following table shows the maximum quantity available for each type of raw oil and the corresponding cost per barrel:

| Type of raw oil      | Barrels available | Cost [ $\text{€}$ /hg ]     |
| :---        |    :----:   |          ---: |
| 1           | 5000        | 9             |
| 2           | 2400        | 7             |
| 3           | 4000        | 12            |
| 4           | 1500        | 6             |

The technical requirements of each type of fuel constraints the quantity of raw oil to be used to produce each type of fuel. 
The following table shows this ”blending” constraint along with the cost per barrel of the fuels:

| Type of fuel      | Required raw oil | Price [ $\text{€}$ /barrel ]     |
| :---                 |    :----:   |          ---:   |
| normal (A)           | at least 20% of type 2 <br> at most 30% of type 3      | 12             |
| super95 (B)          | at least 40% of type 3        | 18             |
| super98 (C)          | at most 50% of type 2         | 10             |

The oil refinery goal is to mix the different types of raw oil in such a way as to maximize its profit.

- Give a Linear Programming (LP) formulation for the problem.
- Write the model in AMPL and solve it using Gurobi.

## Solution
We define the 2 sets F and R, respectively, the type of Fuel and the type of Raw oil. 

We define the variables  $x_i \in F$ as the barrels of fuel and $y_{j,i} \in R \times F$ as the barrels of raw oil per fuel.

We define the price of the fuel $p \in F$, the cost of the raw oil $c \in R$, and the number of barrels available of raw oil as $b \in R$. 

We can write a generic LP problem in the form:

$$ \mathbf{x}^* , \mathbf{y}^* = \text{argmax} \sum_{i \in F} p_i x_i - \sum_{i\in F} \sum_{j \in R} c_{j} y_{j,i}$$

$$\text{s.t.} \hspace{4cm}$$
$$  \sum_{i \in F} y_{j,i} \leq b_{j} \quad \forall j \in R  $$
$$  \sum_{j \in R} y_{j,i} \leq x_{i} \quad \forall i \in F  $$
$$  y_{2,A} \geq 0.2x_{A} $$
$$  y_{3,A} \leq 0.3x_{A} $$
$$  y_{3,B} \geq 0.4x_{B} $$
$$  y_{2,C} \leq 0.5x_{C} $$
