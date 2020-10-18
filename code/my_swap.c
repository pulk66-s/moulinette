/*
** EPITECH PROJECT, 2020
** Day04
** File description:
** function that swap two int
*/

void my_swap(int *a, int *b)
{
    int c = *b;
    *b = *a;
    *a = c;
}
