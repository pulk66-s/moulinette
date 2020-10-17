/*
** EPITECH PROJECT, 2020
** rush2
** File description:
** function that get percentage
*/

int my_strlen(char *str);
int get_occur(char *str, char c);

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

int get_percent(char *str, char c)
{
    int nb_occ = get_occur(str, c) * 10000;
    int size = my_strlen(str) - get_unalpha(str);

    return (nb_occ / size);
}
