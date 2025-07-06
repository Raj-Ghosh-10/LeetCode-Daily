
#define TABLE_SIZE 100003

typedef struct Node {
    int key;
    int val;
    struct Node* next;
} Node;

typedef struct {
    int* nums1;
    int nums1Size;
    int* nums2;
    int nums2Size;
    Node* table[TABLE_SIZE];
} FindSumPairs;

int hash(int key) {
    return ((key % TABLE_SIZE) + TABLE_SIZE) % TABLE_SIZE;
}

void insert(Node** table, int key, int delta) {
    int idx = hash(key);
    Node* curr = table[idx];
    while (curr) {
        if (curr->key == key) {
            curr->val += delta;
            if (curr->val == 0) {
                // remove node
                Node* temp = curr->next;
                free(curr);
                table[idx] = temp;
            }
            return;
        }
        curr = curr->next;
    }
    if (delta > 0) {
        Node* new_node = malloc(sizeof(Node));
        new_node->key = key;
        new_node->val = delta;
        new_node->next = table[idx];
        table[idx] = new_node;
    }
}

int get(Node** table, int key) {
    int idx = hash(key);
    Node* curr = table[idx];
    while (curr) {
        if (curr->key == key) return curr->val;
        curr = curr->next;
    }
    return 0;
}

FindSumPairs* findSumPairsCreate(int* nums1, int nums1Size, int* nums2, int nums2Size) {
    FindSumPairs* obj = malloc(sizeof(FindSumPairs));
    obj->nums1 = malloc(sizeof(int) * nums1Size);
    obj->nums2 = malloc(sizeof(int) * nums2Size);
    obj->nums1Size = nums1Size;
    obj->nums2Size = nums2Size;
    memcpy(obj->nums1, nums1, sizeof(int) * nums1Size);
    memcpy(obj->nums2, nums2, sizeof(int) * nums2Size);
    memset(obj->table, 0, sizeof(obj->table));
    for (int i = 0; i < nums2Size; ++i)
        insert(obj->table, nums2[i], 1);
    return obj;
}

void findSumPairsAdd(FindSumPairs* obj, int index, int val) {
    int oldVal = obj->nums2[index];
    insert(obj->table, oldVal, -1);
    obj->nums2[index] += val;
    insert(obj->table, obj->nums2[index], 1);
}

int findSumPairsCount(FindSumPairs* obj, int tot) {
    int count = 0;
    for (int i = 0; i < obj->nums1Size; ++i) {
        int complement = tot - obj->nums1[i];
        count += get(obj->table, complement);
    }
    return count;
}

void findSumPairsFree(FindSumPairs* obj) {
    for (int i = 0; i < TABLE_SIZE; ++i) {
        Node* curr = obj->table[i];
        while (curr) {
            Node* temp = curr;
            curr = curr->next;
            free(temp);
        }
    }
    free(obj->nums1);
    free(obj->nums2);
    free(obj);
}