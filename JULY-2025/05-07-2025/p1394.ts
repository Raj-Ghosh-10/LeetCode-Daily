function findLucky(arr: number[]): number {
    let counter = new Map<number, number>();

    for(let i = 0; i < arr.length; i++) {
        counter.set(arr[i], (counter.get(arr[i]) ?? 0) + 1);
    }

    let lucky = -1;

    counter.forEach((value, key) => {
        if (key > lucky && value == key) {
            lucky = key;
        }
    });

    return lucky;
};