import shutil
import sys
from tkinter import *
from turtle import st
from random import *
import random
import json
import os
import glob
import re

sys.path.insert(1, '../model_files/')

import cube
import encode_cube as en


def write_to_json(data,path):

    json_object = json.dumps(data,indent=4)

    # writing dictionary data into json file
    with open(path,"w") as out:
        out.write(json_object)

            
def check_not_optimal(face, last_face, second_to_last_face):
    # print(face, last_face, second_to_last_face)
    if face == last_face:
        return True
    if face == second_to_last_face:
        if ((face in ['F','B']) and (last_face in ['F', 'B'])) or ((face in ['L', 'R']) and (last_face in ['L', 'R'])) or ((face in ['U', 'D']) and (last_face in ['U', 'D'])):
            return True
    return False

def random_state(moves_to_shuffle):
    move_list = []

    for i in range(moves_to_shuffle):
        move = random.choice(actions_list)
        
        if i > 1:
            current_move = move
            last_move = move_list[-1]
            second_to_last_move = move_list[-2]
            while check_not_optimal(current_move[0].upper(), last_move[0].upper(), second_to_last_move[0].upper()):
                move = random.choice(actions_list)
                current_move = move
        if i > 0:
            last_move = move_list[-1]
            while move[0] == last_move[0]:
                move = random.choice(actions_list)
            
        move_list.append(move)
        if '2' not in move:
            func = actions_dict[move]
            func()
        else:
            func = actions_dict[move[0]]
            func()
            func()
    
    # for move in move_list:
    #     func = actions_dict[move]
    #     func()
    
    # while check_consecutive_status(move_list): # Checking <move> and <move'> consecutive moves
    #     move_list = remove_consecutive_moves(move_list)
    
    # while not triple_consecutive_status(move_list): # Checking <move>, <move>, <move> consecutive moves and replacing with <move'>
    #     move_list = remove_triple_consecutive_moves(move_list)
    
    return move_list


global path_pddl, problem_file_path, plan_file_path, actions_list, plan_actions, en_var

pddl_model_path = '../model_files/model_problem.pddl'
# path_pddl = 'model_files/sample_test.pddl'

actions_list = ['U', 'Urev','D','Drev','F','Frev','B','Brev','R','Rrev','L','Lrev', 'U2', 'D2', 'F2', 'B2', 'R2', 'L2']
actions_dict = { 'U': cube.U,'Urev': cube.Urev,'D': cube.D,'Drev': cube.Drev,'F': cube.F,'Frev': cube.Frev,
                'B': cube.B,'Brev': cube.Brev,'R': cube.R,'Rrev': cube.Rrev,'L': cube.L,'Lrev': cube.Lrev }


cube.AfficheGraphique3D()
cube.CubeResolue()


if len(sys.argv) == 3:
    moves_to_shuffle = int(sys.argv[1])
    loop_count = int(sys.argv[2])
else:
    print('enter number of moves to shuffle and number of files to generate')
    exit()
    
init_state_list = []
plan_list = []

if os.path.exists( '../problem_files' ) == False:
    os.makedirs( '../problem_files' ) 

if os.path.exists( '../problem_files/problems' ) == False:
    os.makedirs( '../problem_files/problems' )

if os.path.exists( '../problem_files/scramble_steps' ) == False:
    os.makedirs( '../problem_files/scramble_steps' )

problem_files = '../problem_files/problems/'
scramble_files = '../problem_files/scramble_steps/'

problem_file_names = [os.path.basename(x) for x in glob.glob(problem_files + '*.pddl')]

problem_dict = {}

count = 0
for item in problem_file_names:
    if 'problem_' + "{:02d}".format(moves_to_shuffle) in item:
        # extract number from file name
        numbers = re.findall(r'\d+', item)
        if count < int(numbers[-1]):
            count = int(numbers[-1])

print("Moves to shuffle: ", moves_to_shuffle, " -- Number of files: ", loop_count, "\n")
for t in range(loop_count):
    
    # print(t, 'Out of', loop_count, 'Loops', end='\r')

    if moves_to_shuffle == None:
        moves = random.randint(1,20)
    else:
        moves = moves_to_shuffle

    plan_actions = random_state(moves)
    # print(plan_actions)
    init_state = en.to_pddl()
    str_init_states = ' '.join([item.replace('\n','') for item in init_state])
    
    while str_init_states in problem_dict:
        plan_actions = random_state(moves)
        init_state = en.to_pddl()
        str_init_states = ' '.join([item.replace('\n','') for item in init_state])        

    problem_dict[str_init_states] = True
    
    # print('crossed')
    count += 1

    problem_name = 'problem_' + "{:02d}".format(moves) + '_' + "{:02d}".format(count) + '.pddl'
    problem_file_path = problem_files + problem_name
    scramble_file_path = scramble_files + problem_name.replace('.pddl', '.txt').replace('problem_', 'scramble_')

    shutil.copy(pddl_model_path, problem_file_path)
    
    # open problem_file_path and search for '(problem )' string index
    flag = 0
    with open(problem_file_path, 'r') as f:
        content = ''
        for i, line in enumerate(f):
            if '(problem )' in line:
                changes = line.replace('(problem )', '(problem problem_' + "{:02d}".format(moves) + '_' + "{:02d}".format(count) + ')')
                content += changes
            elif flag == 0:
                content += line
                
            if flag == 1:
                flag = 0
                changes = line.replace('\n', ''.join(init_state))
                content += changes
            
            if '(:init' in line:
                flag = 1
            
    f.close()
    
    with open(problem_file_path, 'w') as f:
        f.write(content)
    f.close()

    with open(scramble_file_path, 'w') as f:
        f.write('\n'.join(plan_actions))
    f.close()

    print(problem_name, ' -- scramble sequence ', ', '.join(plan_actions))

    cube.CubeResolue()



