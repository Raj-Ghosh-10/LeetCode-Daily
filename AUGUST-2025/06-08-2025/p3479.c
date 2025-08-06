static int *seg = NULL;
static int segN = 0;

static void build_tree(int node, int l, int r, int *arr)
{
    if (l == r)
    {
        seg[node] = arr[l];
        return;
    }
    int mid = (l + r) / 2;
    build_tree(node * 2, l, mid, arr);
    build_tree(node * 2 + 1, mid + 1, r, arr);
    seg[node] = seg[node * 2] > seg[node * 2 + 1] ? seg[node * 2] : seg[node * 2 + 1];
}

static void update_point(int node, int l, int r, int idx, int value)
{
    if (l == r)
    {
        seg[node] = value;
        return;
    }
    int mid = (l + r) / 2;
    if (idx <= mid)
    {
        update_point(node * 2, l, mid, idx, value);
    }
    else
    {
        update_point(node * 2 + 1, mid + 1, r, idx, value);
    }
    seg[node] = seg[node * 2] > seg[node * 2 + 1] ? seg[node * 2] : seg[node * 2 + 1];
}

static int find_first_ge(int node, int l, int r, int target)
{
    if (seg[node] < target)
    {
        return -1;
    }
    if (l == r)
    {
        return l;
    }
    int mid = (l + r) / 2;
    if (seg[node * 2] >= target)
    {
        return find_first_ge(node * 2, l, mid, target);
    }
    return find_first_ge(node * 2 + 1, mid + 1, r, target);
}

int numOfUnplacedFruits(int* fruits, int fruitsSize, int* baskets, int basketsSize)
{
    int retval = 0;
    if (fruitsSize <= 0 || basketsSize <= 0)
    {
        return fruitsSize; 
    }
    int n = fruitsSize; 
    segN = 4 * n + 5;
    seg = (int *)malloc(sizeof(int) * segN);
    if (seg == NULL)
    {
        return fruitsSize;
    }
    /* build */
    build_tree(1, 0, n - 1, baskets);
    for (int i = 0; i < fruitsSize; i++)
    {
        int f = fruits[i];
        int idx = find_first_ge(1, 0, n - 1, f);
        if (idx == -1)
        {
            retval += 1;
        }
        else
        {
            update_point(1, 0, n - 1, idx, INT_MIN);
        }
    }
    free(seg);
    seg = NULL;
    return retval;
}