function TrieNode() {
  this.next = new Map();
  this.marked = false;
}

function trieInsert(node, path) {
  let cur = node;
  for (let i = 0; i < path.length; i++) {
    const name = path[i];
    if (!cur.next.has(name))
      cur.next.set(name, new TrieNode());

    cur = cur.next.get(name);
  }
}

const A = 29;  // constant for string hashing
const B = 257;  // constant for path hashing
function hash(str) {
  let res = 0;
  for (let i = 0; i < str.length; i++)
    res = (res * A + str.charCodeAt(i)) >>> 0;
  return res;
}

var deleteDuplicateFolder = function(paths) {
  const root = new TrieNode();
  for (let i = 0; i < paths.length; i++)
    trieInsert(root, paths[i]);

  const mapHashNode = new Map();
  function dfs(node) {
    if (!node.next.size)
      return 0;

    let h = 0;  // for hash accumulation
    const entries = Array.from(node.next.entries());
    entries.sort((a, b) => a[0].localeCompare(b[0]));
    for (let i = 0; i < entries.length; i++) {
      h = (h * B ^ hash(entries[i][0])) >>> 0;
      h = (h * B ^ 666) >>> 0;  // opening gap
      h = (h * B ^ (dfs(entries[i][1]))) >>> 0;
      h = (h * B ^ 999) >>> 0;  // closing gap
    }

    if (h && mapHashNode.has(h)) {
      node.marked = true;
      mapHashNode.get(h).marked = true;
    } else if (h) {
      mapHashNode.set(h, node);
    }

    return h;
  }
  dfs(root);
  
  const res = [], curPath = [];
  function collectPaths(node) {
    for (const [name, nextNode] of node.next.entries()) {
      if (nextNode.marked)
        continue;

      curPath.push(name);
      res.push(curPath.slice());
      
      collectPaths(nextNode);
      
      curPath.pop();
    }
  }
  collectPaths(root);

  return res;
};