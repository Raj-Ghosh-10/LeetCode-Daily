function maxFreeTime(eventTime: number, startTime: number[], endTime: number[]): number {
    let res: number = 0;
    // storing the gaps
    let gaps: number[] = [];
    if (startTime[0] > 0) {
        gaps.push(startTime[0]);
    }
    if ((endTime.at(-1) || 0) < eventTime) {
        gaps.push(eventTime - (endTime.at(-1) || 0));
    }

    for (let i: number = 1; i < startTime.length; ++i) {
        const gap: number = startTime[i] - endTime[i-1];
        if (gap === 0) {
            continue;
        }

        gaps.push(gap);
    }
    gaps.sort((a, b) => a - b);


    for (let i: number = 0; i < startTime.length; ++i) {
        const leftGap: number = (i === 0)
            ? startTime[0]
            : startTime[i] - endTime[i-1];
        const rightGap: number = (i === startTime.length - 1)
            ? eventTime - endTime[i]
            : startTime[i+1] - endTime[i];

        const size: number = endTime[i] - startTime[i];
        // using the right and left gaps
        res = Math.max(res, leftGap + rightGap);

        // looking the space for the interval
        let id: number = gaps.length - 1;
        [leftGap, rightGap]
            .sort((a, b) => b-a)
            .forEach((gap) => {
                if (id > -1 && gaps[id] === gap) {
                    id -= 1;
                }
            });

        if (id === -1 || gaps[id] < size) {
            continue;
        }

        res = Math.max(leftGap + rightGap + size, res);

    }
    return res;
};