import shutil
import sys
from tkinter import *
from turtle import st
from random import *
import random
import json
import os

sys.path.insert(1, '../model_files/')

import cube
import encode_cube as en



def write_to_json(data,path):

    json_object = json.dumps(data,indent=4)

    # writing dictionary data into json file
    with open(path,"w") as out:
        out.write(json_object)

def triple_consecutive_status(move_list):
    prev_move = '0'
    count = 0
    for i in range(len(move_list)):
        if move_list[i] != prev_move:
            prev_move = move_list[i]
            count = 0
        else:
            count += 1
            if count == 2:
                return False
    return True

def remove_triple_consecutive_moves(move_list):
    new_move_list = []
    prev_move = '0'
    count = 0
    for i in range(len(move_list)):
        if move_list[i] != prev_move:
            new_move_list.append(move_list[i])
            prev_move = move_list[i]
            count = 0
        else:
            if count == 0:
                new_move_list.pop()
            count += 1
            if count == 2:
                if 'rev' not in move_list[i]:
                    new_move_list.append(move_list[i] + 'rev')
                    prev_move = move_list[i] + 'rev'
                else:
                    new_move_list.append(move_list[i][:-3])
                    prev_move = move_list[i][:-3]
                    
    return new_move_list

def consecutive_status(a,b):
    if 'rev' in a:
        a = a[:-3]
        if a == b:
            return True
        
    elif 'rev' in b:
        b = b[:-3]
        if a == b:
            return True
    return False

def check_consecutive_status(move_list):
    
    for i in range(len(move_list) - 1):
        if consecutive_status(move_list[i],move_list[i+1]):
            return True
    return False

def remove_consecutive_moves(move_list):
    
    new_move_list = []
    flag = 0
    for i in range(len(move_list) - 1):
        if consecutive_status(move_list[i],move_list[i+1]) and flag == 0:
            flag = 1
            continue
        
        if flag == 1:
            flag = 0
            continue
        
        if flag == 0:
            new_move_list.append(move_list[i])
    
    if consecutive_status(move_list[-1],move_list[-2]) == False:
        new_move_list.append(move_list[-1])
    
    return new_move_list
            
    

def random_state(moves_to_shuffle):
    move_list = []
    recent_move = '0'
    count = 0
    for i in range(moves_to_shuffle):
        count += 1
        print(count, 'moves out of', moves_to_shuffle, end='\r')
        move = random.choice(actions_list)
        
        while move[0] == recent_move[0]:
            move = random.choice(actions_list)
            
        move_list.append(move)
        recent_move = move
        func = actions_dict[move]
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

actions_list = ['U', 'Urev','D','Drev','F','Frev','B','Brev','R','Rrev','L','Lrev']
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

problem_dict = {}
count = 0
print("Moves to shuffle: ", moves_to_shuffle, " -- Number of files: ", loop_count, "\n")
for t in range(loop_count):
    
    print(t, 'Out of', loop_count, 'Loops', end='\r')

    if moves_to_shuffle == None:
        moves = random.randint(1,20)
    else:
        moves = moves_to_shuffle

    plan_actions = random_state(moves)
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
        f.write(' '.join(plan_actions))
    f.close()

    cube.CubeResolue()



