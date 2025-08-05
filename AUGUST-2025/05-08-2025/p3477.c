int numOfUnplacedFruits(int* fruits, int fruitsSize, int* baskets, int basketsSize) {
    int count = 0;
    for(int i = 0; i < fruitsSize; i++)
    {
        int unset = 1;
        for(int j = 0; j < basketsSize; j++)
        {
            if(fruits[i] <= baskets[j])
            {
                baskets[j] = 0;
                unset = 0;
                break;
            }
        }
        count += unset;
    }
    return count;
}