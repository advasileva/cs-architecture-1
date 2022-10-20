#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int64_t timeDelta(struct timespec finish, struct timespec start)
{
    int64_t nsecStart, nsecFinish;

    nsecStart = start.tv_sec;
    nsecStart *= 1000000000;
    nsecStart += start.tv_nsec;


    nsecFinish = finish.tv_sec;
    nsecFinish *= 1000000000;
    nsecFinish += finish.tv_nsec;

    return nsecFinish - nsecStart;
}

extern void form_array(int n, int *A, int *B);

int main(int argc, char** argv) {
    int count = 10000;
    int n;
    int i;
    struct timespec start;
    struct timespec finish;
    int64_t time_delta;
    FILE *input, *output;

    if (atoi(argv[1]) == 0) {
        input = fopen(argv[2], "r");
        output = fopen(argv[3], "w");
        fscanf(input, "%d", &n);
    } else {
        input = fopen("input", "w");
        output = fopen("output", "w");
        n = atoi(argv[2]);
    }

    int *A = (int *)malloc(n * sizeof(int));
    int *B = (int *)malloc(n * sizeof(int));

    if (atoi(argv[1]) == 0) {
        for(i = 0; i < n; i++) {
            fscanf(input, "%d", &A[i]);
        }
    } else {
        for(i = 0; i < n; i++) {
            A[i] = rand() % 200 - 100;
            fprintf(input, "%d ", A[i]);
        }
    }

    clock_gettime(CLOCK_MONOTONIC, &start);

    for(i = 0; i < count; i++) {
        form_array(n, A, B);
    }

    clock_gettime(CLOCK_MONOTONIC, &finish);

    time_delta = timeDelta(finish, start);
    printf("Time delta: %ld ns\n", time_delta);

    for(i = 0; i < n; i++) {
        fprintf(output, "%d ", B[i]);
    } 
    return 0;
}

