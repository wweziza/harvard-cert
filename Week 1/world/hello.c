#include <stdio.h>

int main() {
    char name[100];

    printf("What is your name? ");
    fgets(name, sizeof(name), stdin);

    printf("Hello, %s", name);

    return 0;
}
