/*
** EPITECH PROJECT, 2020
** Day06
** File description:
** function that transform uppercase in lowercase
*/

char *my_strlowcase(char *str)
{
    for (int i = 0 ; str[i] != '\0' ; i++) {
        if (str[i] >= 'A' && str[i] <= 'Z') {
            str[i] += 32;
        }
    }
    return (str);
}
