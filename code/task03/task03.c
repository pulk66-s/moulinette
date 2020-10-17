/*
** EPITECH PROJECT, 2020
** rush2
** File description:
** task03
*/

#include <my.h>

static void display(int nb)
{
    int t[5];
    t[0] = nb / 10000;
    t[1] = nb / 1000 - t[0] * 10;
    t[2] = nb / 100 - t[0] * 100 - t[1] * 10; 
    t[3] = nb / 10 - t[0] * 1000 - t[1] * 100 - t[2] * 10;
    t[4] = nb - t[0] * 10000 - t[1] * 1000 - t[2] * 100 - t[3] * 10;

    for (int i = 0 ; i < 5 ; i++) {
        if (i == 3)
            my_putchar('.');
        if (t[0] != 0 && i == 0)
            my_put_nbr(t[i]);
        if ((i == 1 && t[0] != 0) || (i == 1 && t[1] != 0))
            my_put_nbr(t[i]);
        if (i > 1)
            my_put_nbr(t[i]);
    }
}

int main(int argc, char **argv)
{
    if (argc < 3)
        return (-1);
    for (int i = 2 ; i < argc ; i++) {
        my_putchar(argv[i][0]);
        my_putchar(':');
        my_put_nbr(get_occur(argv[1], argv[i][0]));
        my_putstr(" (");
        display(get_percent(argv[1], argv[i][0]));
        my_putstr("%)");
        my_putchar('\n');
    }
}
