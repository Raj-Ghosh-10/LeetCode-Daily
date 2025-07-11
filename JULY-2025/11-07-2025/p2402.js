/**
 * @param {number} n
 * @param {number[][]} meetings
 * @return {number}
 */
var mostBooked = function(n, meetings) {
  meetings.sort((a, b) => a[0] - b[0]);

  const idle = new MinHeap();
  const busy = new MinHeap((a, b) => {
    if (a[0] !== b[0]) return a[0] - b[0];
    return a[1] - b[1];
  });
  for (let i = 0; i < n; i++) idle.push(i);

  const count = Array(n).fill(0);

  for (const [s, e] of meetings) {
    while (!busy.isEmpty() && busy.peek()[0] <= s) {
      const [, room] = busy.pop();
      idle.push(room);
    }

    if (!idle.isEmpty()) {
      const room = idle.pop();
      count[room]++;
      busy.push([e, room]);
    } else {
      const [endTime, room] = busy.pop();
      const dur = e - s;
      const newEnd = endTime + dur;
      count[room]++;
      busy.push([newEnd, room]);
    }
  }

  let ans = 0;
  for (let i = 1; i < n; i++) {
    if (count[i] > count[ans]) ans = i;
  }
  return ans;
};

class MinHeap {
  constructor(cmp) {
    this.data = [];
    this.cmp = cmp || ((a, b) => a - b);
  }
  push(val) {
    this.data.push(val);
    this._siftUp(this.data.length - 1);
  }
  pop() {
    const top = this.data[0];
    const last = this.data.pop();
    if (this.data.length > 0) {
      this.data[0] = last;
      this._siftDown(0);
    }
    return top;
  }
  peek() {
    return this.data[0];
  }
  isEmpty() {
    return this.data.length === 0;
  }
  _siftUp(i) {
    const data = this.data, cmp = this.cmp;
    while (i > 0) {
      const p = (i - 1) >> 1;
      if (cmp(data[i], data[p]) < 0) {
        [data[i], data[p]] = [data[p], data[i]];
        i = p;
      } else break;
    }
  }
  _siftDown(i) {
    const data = this.data, cmp = this.cmp;
    const n = data.length;
    while (true) {
      let l = (i << 1) + 1, r = l + 1, c = i;
      if (l < n && cmp(data[l], data[c]) < 0) c = l;
      if (r < n && cmp(data[r], data[c]) < 0) c = r;
      if (c !== i) {
        [data[i], data[c]] = [data[c], data[i]];
        i = c;
      } else break;
    }
  }
}