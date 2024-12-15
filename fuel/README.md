Oil refinery
------------
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

| Type of raw oil      | Required raw oil | Price [ $\text{€}$ /barrel ]     |
| :---                 |    :----:   |          ---:   |
| normal (A)           | at least 20% of type 2 <br> at most 30% of type 3      | 12             |
| super95 (B)          | at least 40% of type 3        | 18             |
| super98 (C)          | at most 50% of type 2         | 10             |

The oil refinery goal is to mix the different types of raw oil in such a way as to maximize its profit.

- Give a Linear Programming (LP) formulation for the problem.
- Write the model in AMPL and solve it using Gurobi.
