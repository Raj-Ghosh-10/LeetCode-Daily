int maxKDivisibleComponents(int n, int** edges, int edgesSize, int* edgesColSize, int* values, int valuesSize, int k) {
    int* head = (int*)malloc(n * sizeof(int));
    int* next = (int*)malloc(2 * edgesSize * sizeof(int));
    int* to   = (int*)malloc(2 * edgesSize * sizeof(int));

    for (int i = 0; i < n; i++) head[i] = -1;

    int idx = 0;
    for (int i = 0; i < edgesSize; i++) {
        int a = edges[i][0], b = edges[i][1];

        to[idx] = b; next[idx] = head[a]; head[a] = idx++;
        to[idx] = a; next[idx] = head[b]; head[b] = idx++;
    }

    int ans = 0;

    long long dfs(int u, int p) {
        long long sum = values[u];
        for (int e = head[u]; e != -1; e = next[e]) {
            int v = to[e];
            if (v == p) continue;
            sum += dfs(v, u);
        }
        if (sum % k == 0) {
            ans++;
            return 0;
        }
        return sum;
    }

    dfs(0, -1);

    free(head);
    free(next);
    free(to);

    return ans;
}