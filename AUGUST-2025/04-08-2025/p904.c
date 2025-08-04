int totalFruit(int* fruits, int fruitsSize) {
    int maxTypes = fruitsSize;
    int* count = (int*)calloc(maxTypes, sizeof(int));
    int l = 0;
    int r = 0;
    int types = 0;
    int ans = 0;

    while (r < fruitsSize)
    {
        if (count[fruits[r]] == 0)
        {
            types += 1;
        }
        count[fruits[r]] += 1;
        r += 1;

        while (types > 2)
        {
            count[fruits[l]] -= 1;
            if (count[fruits[l]] == 0)
            {
                types -= 1;
            }
            l += 1;
        }

        if (r - l > ans)
        {
            ans = r - l;
        }
    }

    free(count);
    return ans;
}