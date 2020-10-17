/*
** EPITECH PROJECT, 2020
** Day03
** File description:
** Function that print any numbers
*/

int my_putchar(char c);

static int get_length_n(int n)
{
    int nb_d = 0;

    while (n >= 10) {
        nb_d++;
        n /= 10;
    }
    nb_d++;
    return (nb_d);
}

static int get_pow(int n, int p)
{
    int get_powered_n = n;

    if (p == 0) {
        return (1);
    } else if (p == 1) {
        return (n);
    } else {
        for (int i = 2 ; i <= p ; i++) {
            get_powered_n *= n;
        }
        return (get_powered_n);
    }
    return (-1);
}

static int my_print_d(int n, int nb_d)
{
    int first_digit = n;

    if (nb_d == 1) {
        my_putchar(n + 48);
    } else {
        if (nb_d != get_length_n(n)) {
            my_putchar(48);
            my_print_d(n, nb_d - 1);
        } else {
            while (first_digit >= 10) {
                first_digit /= 10;
            }
            my_putchar(first_digit + 48);
            my_print_d(n - first_digit * get_pow(10, get_length_n(n) - 1), nb_d
                       - 1);
        }
    }
    return (-1);
}

int my_put_nbr(int nb)
{
    int max = nb;

    if (nb == -2147483648) {
        my_putchar('-');
        my_putchar('2');
        max += 2000000000;
        max *= -1;
        my_put_nbr(max);
        return (0);
    }
    if (nb < 0) {
        my_putchar('-');
        my_print_d(nb * -1, get_length_n(nb * -1));
    } else {
        my_print_d(nb, get_length_n(nb));
    }
    return (-1);
}

