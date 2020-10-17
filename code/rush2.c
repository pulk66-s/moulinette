/*
** EPITECH PROJECT, 2020
** rush2
** File description:
** task04
*/

#include <my.h>
#define ABS(x)(x >= 0 ? x : x * -1)

static void display_country(int l)
{
    switch (l) {
    case 0:
        my_putstr("French");
        break;
    case 1:
        my_putstr("English");
        break;
    case 2:
        my_putstr("German");
        break;
    case 3:
        my_putstr("Spanish");
        break;
    }
}

static void compare(int letter_f[4][26], int str_f[26])
{
    int l[4] = {0};
    int language = 0;
    int lower = 10000;
    int c_lower = -1;

    for (int i = 0 ; i < 26 ; i++) {
        for (int j = 0 ; j < 4 ; j++) {
            if (ABS((letter_f[j][i] - str_f[i])) < lower && str_f[i] != 0) {
                lower = ABS((letter_f[j][i] - str_f[i]));
                c_lower = j;
            }
        }
        if (c_lower >= 0)
            l[c_lower]++;
        lower = 10000;
        c_lower = -1;
    }
    for (int i = 0 ; i < 4 ; i++) {
        if (l[language] < l[i]) {
            language = i;
        }
    }
    display_country(language);
}

//Francais anglais allemand espagnol
static void know_lang(char *str)
{
    int str_f[26];
    int letter_f[4][26] = {{711, 114, 318, 367, 1210, 111, 123, 111, 659, 34,
                        29, 496, 262, 639, 502, 249, 65, 607, 651, 592, 449,
                        111, 17, 38, 46, 15},
                        {808, 167, 318, 399, 1256, 217, 180, 527, 724, 14, 63,
                        404, 260, 738, 747, 191, 9, 642, 659, 915, 279, 100,
                        189, 21, 165, 7},
                        {628, 199, 298, 504, 1692, 162, 312, 451, 742, 30, 146,
                        356, 254, 102, 287, 77, 2, 744, 662, 595, 439, 107,
                        152, 3, 10, 124},
                        {123, 103, 449, 504, 136, 77, 104, 65, 778, 28, 2,
                        584, 284, 741, 868, 263, 102, 644, 697, 482, 399, 104,
                        2, 16, 66, 34}};

    str = my_strlowcase(str);
    for (char i = 'a' ; i <= 'z' ; i++) {
        str_f[i - 97] = get_percent(str, i);
    }
    compare(letter_f, str_f);
}

int main(int argc, char **argv)
{
    if (argc < 3)
        return (-1);
    display_percent(argc, argv);
    my_putstr("=>");
    know_lang(argv[1]);
    my_putchar('\n');
}
