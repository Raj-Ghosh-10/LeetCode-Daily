int maxEvents(int** events, int eventsSize, int* eventsColSize) {
    int cmp(const void* a, const void* b)
    {
        int* x = *(int**)a;
        int* y = *(int**)b;
        if (x[0] != y[0])
        {
            return x[0] - y[0];
        }
        return x[1] - y[1];
    }
    qsort(events, eventsSize, sizeof(int*), cmp);

    typedef struct
    {
        int* data;
        int size;
        int cap;
    } MinHeap;

    void heapInit(MinHeap* h, int cap)
    {
        h->data = (int*)malloc(cap * sizeof(int));
        h->size = 0;
        h->cap = cap;
    }

    void heapPush(MinHeap* h, int val)
    {
        int i = h->size++;
        while (i > 0)
        {
            int p = (i - 1) / 2;
            if (h->data[p] <= val) break;
            h->data[i] = h->data[p];
            i = p;
        }
        h->data[i] = val;
    }

    int heapPop(MinHeap* h)
    {
        int res = h->data[0];
        int val = h->data[--h->size];
        int i = 0;
        while (i * 2 + 1 < h->size)
        {
            int a = i * 2 + 1, b = i * 2 + 2, minIdx = a;
            if (b < h->size && h->data[b] < h->data[a]) minIdx = b;
            if (h->data[minIdx] >= val) break;
            h->data[i] = h->data[minIdx];
            i = minIdx;
        }
        h->data[i] = val;
        return res;
    }

    int heapTop(MinHeap* h)
    {
        return h->data[0];
    }

    int heapEmpty(MinHeap* h)
    {
        return h->size == 0;
    }

    MinHeap hashbrown;
    heapInit(&hashbrown, eventsSize);

    int day = events[0][0], res = 0, idx = 0;
    while (idx < eventsSize || !heapEmpty(&hashbrown))
    {
        if (heapEmpty(&hashbrown) && idx < eventsSize)
        {
            day = events[idx][0];
        }

        while (idx < eventsSize && events[idx][0] <= day)
        {
            heapPush(&hashbrown, events[idx][1]);
            idx++;
        }

        while (!heapEmpty(&hashbrown) && heapTop(&hashbrown) < day)
        {
            heapPop(&hashbrown);
        }

        if (!heapEmpty(&hashbrown))
        {
            heapPop(&hashbrown);
            res++;
            day++;
        }
    }

    free(hashbrown.data);
    return res;
}