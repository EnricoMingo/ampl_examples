Investments
-----------
Consider the problem of deciding how to invest a capital $C = 137000 \ \text{€}$. 
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
