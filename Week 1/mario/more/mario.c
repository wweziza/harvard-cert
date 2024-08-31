#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>

#define MAX_INPUT 100

int main() {
    char input[MAX_INPUT];
    int height;
    char *endptr;

    while (1) {
        printf("Height: ");
        if (fgets(input, MAX_INPUT, stdin) == NULL) {
            printf("Error reading input.\n");
            return 1;
        }


        input[strcspn(input, "\n")] = 0;


        if (strlen(input) == 0) {
            printf("Invalid input. Please enter a positive integer.\n");
            continue;
        }


        int is_numeric = 1;
        for (int i = 0; input[i] != '\0'; i++) {
            if (!isdigit((unsigned char)input[i])) {
                is_numeric = 0;
                break;
            }
        }

        if (!is_numeric) {
            printf("Invalid input. Please enter a positive integer.\n");
            continue;
        }

        height = strtol(input, &endptr, 10);

        if (*endptr != '\0') {
            printf("Invalid input. Please enter a positive integer.\n");
            continue;
        }

        if (height < 1 || height > 8) {
            printf("Height must be between 1 and 8, inclusive.\n");
            continue;
        }

        break;
    }

    for (int i = 1; i <= height; i++) {
        for (int j = height - i; j > 0; j--) {
            printf(" ");
        }
        for (int k = 0; k < i; k++) {
            printf("#");
        }
        printf("  ");
        for (int k = 0; k < i; k++) {
            printf("#");
        }
        printf("\n");
    }

    return 0;
}
