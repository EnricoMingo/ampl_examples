# Menu (Diet problem with logic constraints)
Consider the problem of determining the daily menu in a school canteen. The available types of food are described in the following table, each with its nutritional characteristic
(number of calories ci per hectogram) and the cost $p_i$ per hectogram.

| Food   | Spaghetti | Rice | Pork | Mackerel | Carrots | Lettuce | Apples |
| :---   |    :----:   | :----:  |    :----:   | :----:  |    :----:   | :----:  |     ---: |
| $c_i \ [calories/hg]$     | 300          | 250  | 200     | 180     | 70 | 60 | 100 |
| cost $p_i \ [\text{€}/hg]$     | 0.2          | 0.5       | 1.2     | 0.8 | 0.1 | 0.1 | 0.2 |

The diet must provide at least 700 calories, and at least 30% of the calories must be provided by vegetables and fruit. 
We want to add an additional constraint: the menu cannot contain both rice and pasta.

The problem consists in deciding the amount of each food contained in the daily menu, to provide the minimum cost diet. 
Formulate the problem as a Linear Programming problem. Write the model in AMPL and solve it using Gurobi.

## Solution
We define the set of the $F$ of the Food, the set $V$ of the Vegetables, and the set $C$ of the carbs (including Spaghetti and Rice).
Notice that $F$ contains $V$ and $C$.

We define the variable $x \ge 0. \in F$ as the hg of each type of food.

We also define the binary variable $y \in C$ to select if the menu contains spaghetti or rice.

We finally define the parameters $c \in F$ and $p \in F$ as the calories and cost of each food.

We can write the following LP problem:

$$\mathbf{x}^* , \mathbf{y}^* = \text{min} \ \sum_{i \in F} p_ix_i$$

$$\text{s.t.} \hspace{4cm}$$
$$\sum_{i\in F} c_i x_j  \geq  700 $$
$$ \sum_{i \in C} c_ix_i \leq \sum_{j \in F} 0.3c_jx_j $$
$$ x_i \leq My_i \ \forall i \in C \quad \quad \text{(\bf{Big-M constraint})}$$ 
$$ \sum_{i \in C} y_i \leq 1. $$

The **Big-M constraint** permits to associate each $y$ variable with the corresponding $x$ variable, allowing the $x$ variables to have 
arbitrary values. For this reason, $M$ is usually chosen big, for example $1e^4$.

Notice also that the second constraint can be written in terms of Vegetables:

$$ \sum_{i \in V} c_ix_i \geq \sum_{j \in F} 0.3c_jx_j $$

However, this will lead to finding another optimal solution.
