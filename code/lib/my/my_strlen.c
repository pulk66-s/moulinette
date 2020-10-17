/*
** EPITECH PROJECT, 2020
** rush2
** File description:
** function that return the size of str
*/

int my_strlen(char *str)
{
    int len = 0;
    
    for (int i = 0 ; str[i] != '\0' ; i++) {
        len++;
    }
    return (len);
}
