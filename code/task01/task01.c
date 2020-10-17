/*
** EPITECH PROJECT, 2020
** Rush2
** File description:
** task01 find nb of occurences
*/

#include <my.h>

int get_occur(char *str, char c)
{
    int nb_occurence = 0;

    if (c >= 'A' && c <= 'Z')
        c += 32;
    for (int i = 0 ; str[i] != '\0' ; i++) {
        if (str[i] == c || str[i] + 32 == c)
            nb_occurence++;
    }
    return (nb_occurence);
}

int main(int argc, char **argv)
{
    if (argc < 3)
        return (-1);
    my_putchar(argv[2][0]);
    my_putchar(':');
    my_put_nbr(get_occur(argv[1], argv[2][0]));
    my_putchar('\n');
    return (0);
}
