#include <stdio.h>

int main() {
    int height;

    do {
        printf("Height: ");
        if (scanf("%d", &height) != 1) {
            while (getchar() != '\n');
            height = -1;
        }
    } while (height < 1 || height > 8);

    for (int i = 1; i <= height; i++) {
        for (int j = height - i; j > 0; j--) {
            printf(" ");
        }
        for (int k = 0; k < i; k++) {
            printf("#");
        }
        printf("\n");
    }

    return 0;
}
