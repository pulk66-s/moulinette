/*
** EPITECH PROJECT, 2020
** rush2
** File description:
** task03
*/

int my_putchar(char c);
int my_putstr(char *str);
int my_strlen(char *str);
int get_occur(char *str, char c);
int my_put_nbr(int nb);

static int is_c_alpha(char c)
{
    if ((c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z')) {
        return (1);
    }
    return (0);
}

static int get_unalpha(char *str)
{
    int unalpha = 0;

    for (int i = 0 ; str[i] != '\0' ; i++) {
        if (is_c_alpha(str[i]) == 0)
            unalpha++;
    }
    return (unalpha);
}

static int get_percent(char *str, char c)
{
    int nb_occ = get_occur(str, c) * 10000;
    int size = my_strlen(str) - get_unalpha(str);

    return (nb_occ / size);
}

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

void display_percent(int argc, char **argv)
{
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
