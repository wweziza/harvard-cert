#include <stdio.h>
#include <string.h>
#include <stdbool.h>

#define MAX_DIGITS 16

bool is_valid(long long number);
void determine_card_type(long long number);

int main(void)
{
    long long number;
    printf("Number: ");
    if (scanf("%lld", &number) != 1)
    {
        printf("INVALID\n");
        return 0;
    }

    if (is_valid(number))
    {
        determine_card_type(number);
    }
    else
    {
        printf("INVALID\n");
    }

    return 0;
}

bool is_valid(long long number)
{
    int digits[MAX_DIGITS] = {0};
    int length = 0;
    int sum = 0;


    while (number > 0 && length < MAX_DIGITS)
    {
        digits[length] = number % 10;
        number /= 10;
        length++;
    }

    for (int i = 0; i < length; i++)
    {
        if (i % 2 == 1)
        {
            int doubled = digits[i] * 2;
            sum += (doubled / 10) + (doubled % 10);
        }
        else
        {
            sum += digits[i];
        }
    }

    return (sum % 10 == 0);
}

void determine_card_type(long long number)
{
    int first_two_digits = number / 1000000000000000;
    int first_digit = number / 1000000000000000;

    if ((number >= 340000000000000 && number < 350000000000000) ||
        (number >= 370000000000000 && number < 380000000000000))
    {
        printf("AMEX\n");
    }
    else if (number >= 5100000000000000 && number < 5600000000000000)
    {
        printf("MASTERCARD\n");
    }
    else if ((number >= 4000000000000 && number < 5000000000000) ||
             (number >= 4000000000000000 && number < 5000000000000000))
    {
        printf("VISA\n");
    }
    else
    {
        printf("INVALID\n");
    }
}
