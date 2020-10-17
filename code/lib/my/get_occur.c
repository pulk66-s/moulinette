/*
** EPITECH PROJECT, 2020
** rush2
** File description:
** function that return the nb of occurence
*/

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
