# Radiation Therapy
Toy example from “Introduction to Operations Research, Hillier and Lieberman” Real-case paper “A new linear programming approach to radiation therapy treatment planning problems”, 
H. Edwin Romeijn, Ravindra K. Ahuja, James F. Dempsey and Arvind Kumar, Operations Research (2006).

Radiation therapy involves using an external beam treatment machine. Radiation aims to kill cancerous cells, nevertheless, even if cancerous cells are more radiosentity, is impossible to radiate only cancerous cells.
Cancerous cells are normally distributed among healthy cells. The intensity of the beam (and therefore its effect) changes along the path, therefore the quantity of radiation is higher at 
the entrance of the beam in the body and smaller at its exit. 
To attack target (cancerous) cells, several beams are used, with different orientation to better cover the target, and at the same time, minimize the killing of healthy cells. 
The goal of the problem is to select the combination of beams used and their intensity to administrate the best dose, balancing the positive effect of killing of cancerous cells with 
the negative one of damaging the healthy tissue. This problem is an example of **cost-benefit-trade-off** problem.

After analyzing the size and location of the tumor, and considering the machine available, some information on the absorption of radiation of important body area can be extracted.
Data are reported in Table 4.1. In the first column the body areas that receive radiation during the treatment are indicated. The second and third columns report the fraction of
radion that will arrive at the target if a beam of one kilorad is sent by beam 1 and beam 2, respectively. 
In the fourth column, the restrictions to obtain the best balance between positive and negative effects are given. Critical tissues, that represent more delicate parts of the body, 
must not receive more then 2.7 kilorad. The tumor region must receive 6 kilorad, 29 the center of the tumor at least 6 kilorad. 
We want to minimize the radiation absorbed by the healthy anatomy.


| Area   | Beam 1 | Beam 2 | Restriction |
| :---   |    :----:   | :----:  |                 ---: |
| Healty Anatomy    | 0.4          | 0.5       | Minimize                 |
| Critical Tissue   | 0.3          | 0.1       | $\leq 0.27$                 |
| Tumor Region      | 0.5          | 0.5       | $= 6$               |
| Center of Tumor   | 0.6          | 0.4       | $\geq 6$                |

## Solution
We define the following sets: $B$ is the Beam set, $HC$ is the Healthy Cells set, $TC$ is the Tumor Cells set, $CeC$ is the Center Cells set, and $CrC$ is the Critical Cells set.
We also define the set $C$ of the cells as the union: $C = HC \cup TC \cup CeC \cup CrC$.

We define the variables $x \geq 0 \in B$ as the kilorad per beam. 

We define the absorption matrix as $rad \in C \times B$ and the associated constraints as $minr \in CrC$, $r \in TC$, and $maxr \in CeC$.
We can define the following LP problem:

$$\mathbf{x}^* = \text{argmin} \ \sum_{i\in HC} \sum_{j \in B} rad_{i,j} x_j$$
$$\text{s.t.} \hspace{4cm}$$
$$\sum_{j\in B} rad_{i,j}x_j \leq minr_i \quad \forall i \in CrC $$
$$\sum_{j\in B} rad_{i,j}x_j = r_i \quad \forall i \in TC $$
$$\sum_{j\in B} rad_{i,j}x_j \leq maxr_i \quad \forall i \in CeC $$
$$ x_j \geq 0 \quad \forall j \in B$$

The solution of this LP is:
- $x_1 = 7.5 \ [krad]$ for Beam 1,
- $x_2 = 4.5 \ [krad]$ for Beam 2.

with the objective function $5.25 \ [krad]$, which correspond to the total radiation on the $HC$.

The radiation on the other cells is:
- $2.7 \ [krad]$ for the $CrC$,
- $6 \ [krad]$ for the $TC$ (equality constraint),
- $6.3 \ [krad]$ for the $CeC$. 






