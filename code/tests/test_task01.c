/*
** EPITECH PROJECT, 2020
** rush2
** File description:
** function that test task01
*/

#include <criterion/criterion.h>

int get_occur(char *str, char c);

Test(get_occur, is_def)
{
    get_occur("Hello World", 'o');
}

Test(get_occur, is_working)
{
    int r = get_occur("Hello World", 'o');

    cr_assert_eq(r, 2);
}

Test(get_occur, is_working2)
{
    int r = get_occur("Just because I don't care doesn't mean I don't understand", 'a');

    cr_assert_eq(r, 4);
}

Test(get_occur, uppercase1)
{
    int r = get_occur("Just because I don't care doesn't mean I don't understand", 'A');

    cr_assert_eq(r, 4);
}

Test(get_occur, is_working3)
{
    int	r = get_occur("Just because I don't care doesn't mean I don't understand", 'j');

    cr_assert_eq(r, 1);
}

Test(get_occur, is_working4)
{
    int	r = get_occur("Just because I don't care doesn't mean I don't understand", '\'');

    cr_assert_eq(r, 3);
}
