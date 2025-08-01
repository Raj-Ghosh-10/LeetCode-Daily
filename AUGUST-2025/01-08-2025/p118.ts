function generate(numRows: number): number[][] {
    const triangle: number[][] = [];

    triangle.push([1]);

    for (let rowNum = 1; rowNum < numRows; rowNum++) {
        const row: number[] = [];
        const prevRow: number[] = triangle[rowNum - 1];

        row.push(1);

        for (let j = 1; j < rowNum; j++) {
            row.push(prevRow[j - 1] + prevRow[j]);
        }

        row.push(1);

        triangle.push(row);
    }

    return triangle;
};