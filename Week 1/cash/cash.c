#include <stdio.h>

int main(void)
{
    int cents;
    int coins = 0;

    do
    {
        printf("Change owed: ");
        if (scanf("%d", &cents) != 1)
        {
            while (getchar() != '\n');
            cents = -1;
        }
    }
    while (cents < 0);


    while (cents > 0)
    {
        if (cents >= 25)
        {
            cents -= 25;
            coins++;
        }
        else if (cents >= 10)
        {
            cents -= 10;
            coins++;
        }
        else if (cents >= 5)
        {
            cents -= 5;
            coins++;
        }
        else
        {
            cents -= 1;
            coins++;
        }
    }

    printf("%d\n", coins);

    return 0;
}
