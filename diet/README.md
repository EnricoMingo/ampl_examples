# The diet problem
Consider the problem of determining the daily menu in a school canteen. The available types of food are described in the following table, 
each with its nutritional characteristics and the cost ci per hectogram.

|             | Calories | Protein  | Fat      | Calcium  | Iron   | Fiber | cost  |
| :---        |  :----:  | :----:   | :----:   | :----:   | :----: | :----:|  ---: |
| RedMeat     | 149      | 27.6     | 3.27     | 7.7      |  2.17  |   0   |  2.5  |
| WhiteMeat   | 121      | 26.2     | 1.76     | 13.6     |   0.4  |   0   |  1.5  |
| Fish        | 124      | 20       | 4.81     | 100      |  0.39  |   0   |  2.0  |
| Cheese      | 343      | 28.6     | 25.6     | 869      |   0    |   0   |  2.0  |
| Pasta       | 353      | 14.1     | 1.2      | 21       |   1.3  |   3   | 0.2   |
| Rice        | 358      |  6.5     | 0.52     |  3       |   4.32 |   2.8 |  0.25 |
| Beans       | 104      |  8.42    |  0.325   |  55.2    |   1.7  |   6.3 |  0.1  |
| Vegetables  |  25      |  2.7     |  0.4     |  21      |   0.79 |   1.5 |  0.1  |

Further, for each food, a maximum amount that can be served is given. For nutritional element (calories, proteins, vitamins, etc...) a minimum and a maximum quantity needed is
given.

|                | Calories [ kcal ]| Protein [ g ]  | Fat  [ mg ]    | Calcium  [ mg ]| Iron [ g ]   | Fiber [ g ] | 
| :---           |  :----:  | :----:   | :----:   | :----:   | :----: |   ---: |
| Minimum qt     | 1800      | 50     | 800     | 7      |  32  |   -   |
| Maximum qt     | 2000     | 92     | -     | -     |   -  |   450    |

We have to decide the amount of each food contained in the daily menu, to provide the minimum-cost diet that provides the correct amount 
of each nutrient. Formulate the problem as a Linear Programming problem. 
How does the solution change without the maximum amount of food limit?

Write the model in AMPL and solve it using Gurobi.

## Solution
We can define the sets F and N, respectively the type of Food and the Nutritional characteristics.

We define $A \in F \times N$ as the matrix containing the nutritional characteristics per food. 
We also define $m \in N$ and $M \in N$ as the minimum and maximum amount of nutritionals that the diet should have. 
Notice that $m$ default value is set to $0.0$, while for $M$ we consider as default value $1e^5$.

We can define the variable $x \in F$ as the amount for each food. We consider as well a maximum amount per food as $F_{max} \in F$.

We can then define the following LP problem:

$$\mathbf{x}^* = \text{argmin} \ \sum_{i\in F} A_{i, cost} x_i$$
$$\text{s.t.} \hspace{4cm}$$
$$\sum_{i\in F} A_{i,j} x_i  \le  M_{j} \quad \forall j \in N $$
$$\sum_{i\in F} A_{i,j} x_i  \ge  m_{j} \quad \forall j \in N $$
$$ x_i  \ge  0.0 \quad \forall i \in F $$
$$ x_i  \le  F_{max,i} \quad \forall i \in F $$
