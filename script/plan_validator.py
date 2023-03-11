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
        if (face in ['F','B'] and last_face in ['F', 'B']) or (face == ['L', 'R'] and last_face == ['L', 'R']) or (face == ['U', 'D'] and last_face == ['U', 'D']):
            return True
    return False

def search_file(file_path,string):
    with open(file_path, 'r') as f:
        line_number = 0
        for line in f:
            if string in line:
                return line_number
            line_number += 1

def get_state_string(state_list):
    temp_list = []
    for item in state_list:
        temp_list.append(item.replace('(','').replace(')','').replace('\n','').strip())
    
    return ', '.join(temp_list)

def get_states(problem_file):
    line_to_start = search_file(problem_file,'(:init')
    with open(problem_file, 'r') as f:
        lines = f.readlines()

    cube_lis = []
    edge_lis = []
    for line in lines[ line_to_start + 1: ]:
        if 'goal' in line:
            break
        
        if line.strip():
            string_strip = line.strip(' ').strip(')\n').strip('(')
            
            if 'cube' in string_strip:
                cube_lis.append(string_strip)
            elif 'edge' in string_strip:
                edge_lis.append(string_strip)
    
    init_state = ', '.join(cube_lis) + ', ' + ', '.join(edge_lis)

    line_to_start = search_file(problem_file,'(:goal')
    with open(problem_file, 'r') as f:
        lines = f.readlines()
    
    cube_lis = []
    edge_lis = []
    for line in lines[ line_to_start + 1: ]:
        if line.strip():
            string_strip = line.strip(' ').strip(')\n').strip('(')
            
            if 'cube' in string_strip:
                cube_lis.append(string_strip)
            elif 'edge' in string_strip:
                edge_lis.append(string_strip)
    
    goal_state = ', '.join(cube_lis) + ', ' + ', '.join(edge_lis)

    return init_state, goal_state


global path_pddl, problem_file_path, plan_file_path, actions_list, plan_actions, en_var

pddl_model_path = '../model_files/model_problem.pddl'
# path_pddl = 'model_files/sample_test.pddl'

actions_list = ['U', 'Urev','D','Drev','F','Frev','B','Brev','R','Rrev','L','Lrev', 'U2', 'D2', 'F2', 'B2', 'R2', 'L2']
actions_dict = { 'U': cube.U,'Urev': cube.Urev,'D': cube.D,'Drev': cube.Drev,'F': cube.F,'Frev': cube.Frev,
                'B': cube.B,'Brev': cube.Brev,'R': cube.R,'Rrev': cube.Rrev,'L': cube.L,'Lrev': cube.Lrev }


cube.AfficheGraphique3D()
cube.CubeResolue()


if len(sys.argv) == 3:
    problem_file = sys.argv[1]
    plan_file = sys.argv[2]
else:
    print('enter number of moves to shuffle and number of files to generate')
    exit()

init_state, goal_state = get_states(problem_file)
en.pddl_to_viz(problem_file)

plan = [item for item in open(plan_file, 'r').read().split('\n') if (';' not in item) and item.strip()]


for action in plan:
    if action in actions_list:
        if '2' not in action:
            func = actions_dict[action.capitalize()]
            # print(action.capitalize())
            func()
        else:
            func = actions_dict[action[0].upper()]
            func()
            func()

if goal_state == get_state_string(en.to_pddl()):
    print('Plan is valid')
else:
    print('Plan is invalid')

cube.CubeResolue()
        

