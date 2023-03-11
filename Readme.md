## Repositor with required files for IPC 2023 Submission

#### Domain File: domain.pddl
#### Problem Generator:
1. The _script_ folder contains _problem\_generator.py_ which generates the problem files in PDDL format
    > python problem_generator.py <\moves-to-shuffle> <\number-of-files-to-generate>
2. The generated problem files are stored in _problem\_files/problems_ folder. The action steps taken to scramble the rubik's cube are stored in _problem\_files/scramble\_steps_ folder.


#### Plan Validator:
1. The _script_ folder contains _plan\_validator.py_ which take in 2 arguments: _problem-file-path_ and _plan-file-path_ and prints out if the plan is valid or not
    > python plan_validator.py <\problem-file-path> <\plan-file-path>

#### Optimal Plan Generator:
1. The _script_ folder contains _optimal\_solver_ which has an optimal solver[1] and a python code to execute it. _solve-pddl.py_ file takes 1 argument: _problem-file-path_ and generates a optimal plan which is stored in _script/optimal\_solver/optimal\_plans_
    > python solve-pddl.py <\problem-file-path>
    
[1] https://www.cflmath.com/~reid/Rubik/optimal_solver.html
