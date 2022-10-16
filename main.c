#include <stdio.h>

int main(int argc, char** argv) {
    int n, el, i;
    scanf("%d", &n);
    int B[n];
    for(i = 0; i < n; i++) {
        scanf("%d", &el);
        if (el > 0) {
            B[i] = 2;
        } else if (el < 0) {
            B[i] = el + 5;
        } else {
            B[i] = el;
        }
        printf("%d ", B[i]);
    }
}

