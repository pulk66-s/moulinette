/*
** EPITECH PROJECT, 2020
** Day04
** File description:
** Function that return a pointer with a reverse string
*/

int my_strlen(char *str);

char *my_evil_str(char *str)
{
    int l = my_strlen(str);
    char c;

    for (int i = 0 ; i <= l / 2 ; i++) {
        c = str[l - 1 - i];
        str[l - 1 - i] = str[i];
        str[i] = c;
    }
    return (str);
}

char test()
{

}

char test()
{

}
