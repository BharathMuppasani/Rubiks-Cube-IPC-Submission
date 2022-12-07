#!/bin/bash

cd script
for i in {1..20}; do
    echo -n "$i "
    python problem_generator.py "$i" 1
done