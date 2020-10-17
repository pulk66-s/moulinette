/*
** EPITECH PROJECT, 2020
** rush2
** File description:
** task02
*/

#include <my.h>

int main(int argc, char **argv)
{
    if (argc < 3)
        return (-1);
    int i = 2;

    while (i < argc) {
        my_putchar(argv[i][0]);
        my_putchar(':');
        my_put_nbr(get_occur(argv[1], argv[i][0]));
        my_putchar('\n');
        i++;
    }
    return(0);
}
