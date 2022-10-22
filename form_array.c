void form_array(int n, int *A, int *B){
    int i;
    for(i = 0; i < n; i++) {
        if (A[i] > 0) {
            B[i] = 2;
        } else if (A[i] < 0) {
            B[i] = A[i] + 5;
        } else {
            B[i] = A[i];
        }
    }
}