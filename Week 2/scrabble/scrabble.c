#include <ctype.h>
#include <stdio.h>
#include <string.h>

#define MAX_WORD_LENGTH 100

int compute_score(const char *word);

int main(void) {
    char word1[MAX_WORD_LENGTH], word2[MAX_WORD_LENGTH];

    printf("Player 1: ");
    fgets(word1, sizeof(word1), stdin);
    word1[strcspn(word1, "\n")] = 0;

    printf("Player 2: ");
    fgets(word2, sizeof(word2), stdin);
    word2[strcspn(word2, "\n")] = 0;

    int score1 = compute_score(word1);
    int score2 = compute_score(word2);

    if (score1 > score2) {
        printf("Player 1 wins!\n");
    } else if (score2 > score1) {
        printf("Player 2 wins!\n");
    } else {
        printf("Tie!\n");
    }

    return 0;
}

int compute_score(const char *word) {
    int points[] = {1,3,3,2,1,4,2,4,1,8,5,1,3,1,1,3,10,1,1,1,1,4,4,8,4,10};
    int score = 0;

    for (int i = 0; word[i] != '\0'; i++) {
        if (isalpha(word[i])) {
            score += points[toupper(word[i]) - 'A'];
        }
    }

    return score;
}
