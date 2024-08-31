#include <ctype.h>
#include <stdio.h>
#include <string.h>

#define MAX_TEXT_LENGTH 1000
#define ALPHABET_LENGTH 26

int validate_key(const char *key);
void encrypt(const char *plaintext, const char *key, char *ciphertext);

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: ./substitution key\n");
        return 1;
    }

    if (!validate_key(argv[1])) {
        printf("Key must contain 26 unique alphabetic characters.\n");
        return 1;
    }

    char plaintext[MAX_TEXT_LENGTH];
    char ciphertext[MAX_TEXT_LENGTH];

    printf("plaintext: ");
    fgets(plaintext, sizeof(plaintext), stdin);
    plaintext[strcspn(plaintext, "\n")] = 0;

    encrypt(plaintext, argv[1], ciphertext);

    printf("ciphertext: %s\n", ciphertext);

    return 0;
}

int validate_key(const char *key) {
    if (strlen(key) != ALPHABET_LENGTH) {
        return 0;
    }

    int used[ALPHABET_LENGTH] = {0};

    for (int i = 0; key[i]; i++) {
        if (!isalpha(key[i])) {
            return 0;
        }
        int index = tolower(key[i]) - 'a';
        if (used[index]) {
            return 0;
        }
        used[index] = 1;
    }

    return 1;
}

void encrypt(const char *plaintext, const char *key, char *ciphertext) {
    for (int i = 0; plaintext[i]; i++) {
        if (isalpha(plaintext[i])) {
            char base = isupper(plaintext[i]) ? 'A' : 'a';
            int index = tolower(plaintext[i]) - 'a';
            ciphertext[i] = isupper(plaintext[i]) ? toupper(key[index]) : tolower(key[index]);
        } else {
            ciphertext[i] = plaintext[i];
        }
    }
    ciphertext[strlen(plaintext)] = '\0';
}
