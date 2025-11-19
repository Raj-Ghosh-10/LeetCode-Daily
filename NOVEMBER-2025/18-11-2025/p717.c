bool isOneBitCharacter(int* bits, int bitsSize) {
    int i = 0;
    int last = *bits + bitsSize -1;
    while( i < bitsSize-1)

        if (bits[i] == 1){
            i+=2;
        }
        else if (bits[i] == 0 ){
            i++;
        }

    return i == bitsSize -1;
}