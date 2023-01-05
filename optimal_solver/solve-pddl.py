#! /usr/bin/env python
# -*- coding: utf-8 -*-

import os
import subprocess
import sys


def get_pddl_file():
    if len(sys.argv) != 2:
        print("Program takes exactly 1 argument, namely the path to",
              "the PDDL file of the Rubik's Cube instance to be",
              "solved optimally.")
        sys.exit(1)

    filename = sys.argv[1]
    if not os.path.exists(filename):
        print(f"File {filename} does not exist.")
        sys.exit(2)
    elif not filename.endswith(".pddl"):
        print(f"File {filename} is not a PDDL file.")
        sys.exit(3)

    return filename


def translate_color_to_position(color):
    if color == 'W':
        return 'F'  # front
    elif color == 'R':
        return 'L'  # left
    elif color == 'G':
        return 'U'  # up
    elif color == 'B':
        return 'D'  # down
    elif color == 'O':
        return 'R'  # right
    else:
        assert(color == 'Y')
        return 'B'  # back


def parse_cube(cube):
    assert('(' in cube)
    assert(')' in cube)

    start = cube.index('(')
    end = cube.index(')')

    cube = cube[start + 1 : end]
    split = cube.split(' ')
    assert(len(split) == 4)
    assert(split[0].startswith("cube"))
    cube_id = split[0][4:]

    return cube_id, split[1:]


def parse_edge(edge):
    assert('(' in edge)
    assert(')' in edge)

    start = edge.index('(')
    end = edge.index(')')

    edge = edge[start + 1 : end]
    split = edge.split(' ')
    assert(len(split) == 3)
    assert(split[0].startswith("edge"))
    edge_id = split[0][4:]

    return edge_id, split[1:]


def parse_pddl(filename):
    print("Parsing PDDL file...")

    with open(filename) as f:
        content = f.read().splitlines()

    assert(len(content) > 25)
    assert("define" in content[0])
    assert("problem" in content[1])
    assert(":domain cube3" in content[2])
    assert(":objects Y W B G O R" in content[3])

    init = parse_init(content)
    goal = parse_goal(content)

    print("Done.\n")

    return generate_sequence(init, goal)


def parse_init(content):
    assert(":init" in content[4])
    cubies = {}

    for line in range(5, 13):
        cube_id, colors = parse_cube(content[line])
        cubies[cube_id] = colors

    for line in range(13, 25):
        edge_id, colors = parse_edge(content[line])
        cubies[edge_id] = colors

    return cubies


def parse_goal(content):
    assert(":goal" in content[27])
    assert("(and" in content[28])
    cubies = {}

    for line in range(29, 37):
        cube_id, colors = parse_cube(content[line])
        cubies[cube_id] = colors

    for line in range(38, 52):
        if line in [42, 47]:
            assert(not content[line].strip())  # string empty
            continue
        edge_id, colors = parse_edge(content[line])
        cubies[edge_id] = colors

    return cubies


SOLVED_CUBE = [
    "UF", "UR", "UB", "UL",
    "DF", "DR", "DB", "DL",
    "FR", "FL", "BR", "BL",
    "UFR", "URB", "UBL", "ULF",
    "DRF", "DFL", "DLB", "DBR",
]


def find_matching_cubie(cubie, goal):
    for cubie_id in goal:
        colors = goal[cubie_id]
        if len(cubie) != len(colors):
            continue  # comparing corner to edge

        match = True
        for color in colors:
            pos = translate_color_to_position(color)
            if not pos in cubie:
                match = False
                break
        if match:
            return cubie_id

    assert(False)


def construct_init_pos(cubie, init, goal):
    assert(len(cubie) == len(init))
    assert(len(init) == len(goal))

    init_pos = ""
    for pos in cubie:
        for i in range(len(goal)):
            translated_color = translate_color_to_position(goal[i])
            if translated_color == pos:
                init_pos += translate_color_to_position(init[i])
                break

    assert(len(init_pos) == len(cubie))
    return init_pos


def generate_sequence(init, goal):
    print("Generating input for solver...")
    seq = []
    for cubie in SOLVED_CUBE:
        cubie_id = find_matching_cubie(cubie, goal)
        init_colors = init[cubie_id]
        goal_colors = goal[cubie_id]
        init_pos = construct_init_pos(cubie, init_colors, goal_colors)
        seq.append(init_pos)

    print("Done:")
    print(" ".join(seq))
    print()

    return seq


SOLVER_SOURCE = "optimal.c"
SOLVER_PATH = "solver.out"


def compile_solver():
    assert(os.path.exists(SOLVER_SOURCE))

    print("Compiling solver...")

    cmd = ["gcc", "-Wall", "-O2", "-o", SOLVER_PATH, SOLVER_SOURCE]
    subprocess.run(cmd)

    print("Done.\n")


def solve(seq):
    if not os.path.exists(SOLVER_PATH):
        compile_solver()

    print("Starting solver...\n")

    cmd = [f"./{SOLVER_PATH}"]
    init_config = " ".join(seq)
    process = subprocess.run(cmd, input=init_config, text=True)

    print("\nQuitting solver...\n")


if __name__ == "__main__":
    filename = get_pddl_file()
    seq = parse_pddl(filename)
    solve(seq)

