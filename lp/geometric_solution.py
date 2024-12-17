import numpy as np
import matplotlib.pyplot as plt

# Define x1 range
x1 = np.linspace(-10, 10, 400)  # Adjust range as needed

A = np.array([[10, 3], [4, 9], [1, 0], [0, 1]])
b = np.array([19, 31, 0, 0])
print(f"A: {A}")
print(f"b: {b}")

# Calculate x2 from the inequality
x2_1 = (-A[0,0] * x1 + b[0]) / A[0,1]
x2_2 = (-A[1,0] * x1 + b[1]) / A[1,1]
x2_3 = 0. * x1
x2_4 = x1


# Plot boundary lines
plt.figure(figsize=(8, 6))
plt.plot(x1, x2_1, label='10x1 + 3x2 - 19 = 0')
plt.plot(x1, x2_2, label='4x1 + 9x2 - 31 = 0')
plt.plot(x1, x2_3, label='x2 = 0')
plt.plot(x2_3, x2_4, label='x1 = 0')

# Plot feasible area
X1, X2 = np.meshgrid(x1, np.linspace(-10, 10, 400))

condition1 = A[0,0]*X1 + A[0,1]*X2 <= b[0]
condition2 = A[1,0]*X1 + A[1,1]*X2 <= b[1]
condition3 = A[2,0]*X1 + A[2,1]*X2 >= b[2]
condition4 = A[3,0]*X1 + A[3,1]*X2 >= b[3]

common_region = condition1 & condition2 & condition3 & condition4

plt.contourf(X1, X2, common_region, levels=[0.5, 1], colors=['lightgreen'], alpha=0.5)

# Computes solutions:
x = np.zeros((2, 6))

x[:,0] = np.linalg.solve(A[0:2, :], b[0:2])
x[:,1] = np.linalg.solve(A[[0,2], :], b[[0,2]])
x[:,2] = np.linalg.solve(A[[1,3], :], b[[1,3]])
x[:,3] = np.linalg.solve(A[[2,3], :], b[[2,3]])
x[:,4] = np.linalg.solve(A[[1,2], :], b[[1,2]])
x[:,5] = np.linalg.solve(A[[0,3], :], b[[0,3]])

# Compute feasible solutions
feasible_solutions = []
unfeasible_solutions = []

for i in range(0, 6):
    condition1 = A[0,:]@x[:,i] <= b[0]
    condition2 = A[1,:]@x[:,i] <= b[1]
    condition3 = A[2,:]@x[:,i] >= b[2]
    condition4 = A[3,:]@x[:,i] >= b[3]

    if condition1 and condition2 and condition3 and condition4:
        feasible_solutions.append(x[:,i])
    else:
        unfeasible_solutions.append(x[:,i])

print(f"Feasible solutions: {feasible_solutions}")
print(f"Unfeasible solutions: {unfeasible_solutions}")

# Compute optimal solution
optimal_solution = np.zeros((2,1))
for sol in feasible_solutions:
    if sum(sol) > sum(optimal_solution):
        optimal_solution = sol
        feasible_solutions.remove(sol)

i = 0
for x in unfeasible_solutions:
    color = 'red'
    if i == 0:
        plt.scatter(x[0], x[1], color=color, s=50, label='Unfeasible solutions')
        i+=1
    else:
        plt.scatter(x[0], x[1], color=color, s=50)
    plt.text(x[0] + 0.3, x[1], f'({x[0]}, {x[1]})', fontsize=10, color=color)  # Add the label near the point

i = 0
for x in feasible_solutions:
    color = 'black'
    if i == 0:
        plt.scatter(x[0], x[1], color=color, s=50, label='Feasible solutions')
        i+=1
    else:
        plt.scatter(x[0], x[1], color=color, s=50)
    plt.text(x[0] + 0.3, x[1], f'({x[0]}, {x[1]})', fontsize=10, color=color)  # Add the label near the point

plt.scatter(optimal_solution[0], optimal_solution[1], color='green', s=50, label='Optimal solution')
plt.text(optimal_solution[0] + 0.3, optimal_solution[1], f'({optimal_solution[0]}, {optimal_solution[1]})', fontsize=10, color='green')


# Label the axes
plt.xlabel('$x_1$')
plt.ylabel('$x_2$')
plt.title('Region satisfying $Constraints$ and $Solutions$')

# Add grid and legend
plt.grid(True)
plt.legend()
plt.xlim(-1, 10)
plt.ylim(-1, 10)


# Show the plot
plt.show()
