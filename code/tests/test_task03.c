/*
** EPITECH PROJECT, 2020
** rush2
** File description:
** file that test task03
*/

#include <criterion/criterion.h>

int get_percent(char *str, char c);
int get_occur(char *str, char c);
int my_strlen(char *str);


Test(get_percent, is_define)
{
    get_percent("Hello World", 'H');
}

Test(get_percent, working1)
{
    int r = get_percent("abcd", 'a');

    cr_assert_eq(r, 2500);
}

Test(get_percent, working2)
{
    float r = get_percent("abc", 'a');

    cr_assert_eq(r, 3333);
}


Test(get_occur, working)
{
    float r = get_occur("Good things do not end with ‘ium'. They end with ‘mania’ or ‘teria’", 'a');

    cr_assert_eq(r, 3);
}

Test(my_strlen, len)
{
    float r = my_strlen("ABCDEF");

    cr_assert_eq(r, 6);
}

Test(get_percent, working3)
{
    float r = get_percent("Good things do not end with ‘ium'. They end with ‘mania’ or ‘teria’", 'a');
    cr_assert_eq(r, 625);
}

Test(get_percent, working4)
{
    float r = get_percent("Good things do not end with ‘ium'. They end with ‘mania’ or ‘teria’", 'q'\
);
    cr_assert_eq(r, 0);
}

Test(get_percent, working5)
{
    float r = get_percent("Good things do not end with ‘ium'. They end with ‘mania’ or ‘teria’", 'e'\
);
    cr_assert_eq(r, 833);
}

Test(get_percent, working6)
{
    float r = get_percent("Good things do not end with ‘ium'. They end with ‘mania’ or ‘teria’", 'i'\
);
    cr_assert_eq(r, 1250);
}
