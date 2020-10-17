#!/usr/bin/env bash
##
## EPITECH PROJECT, 2020
## rush2
## File description:
## build the lib
##

set -e
gcc -c *.c -W -Wall -Wextra -Werror
ar rsc libmy.a *.o
rm *.o
