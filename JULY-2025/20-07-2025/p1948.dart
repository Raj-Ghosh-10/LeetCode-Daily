class Solution {
  List<List<String>> deleteDuplicateFolder(List<List<String>> paths) {
    Node root = Node();

    // Build the tree structure
    for (List<String> path in paths) {
      Node curr = root;
      for (String name in path) {
        curr.children.putIfAbsent(name, () => Node());
        curr = curr.children[name]!;
      }
    }

    // Encode each subtree and group nodes with identical structures
    Map<String, List<Node>> map = {};
    _encode(root, map);

    // Mark duplicate subtrees for deletion
    for (List<Node> group in map.values) {
      if (group.length > 1) {
        for (Node n in group) {
          n.deleted = true;
        }
      }
    }

    // Collect all non-deleted paths
    List<List<String>> result = [];
    _collect(root, [], result);
    return result;
  }

  String _encode(Node node, Map<String, List<Node>> map) {
    if (node.children.isEmpty) return "()";

    List<String> parts = [];
    for (MapEntry<String, Node> entry in node.children.entries) {
      String sub = _encode(entry.value, map);
      parts.add(entry.key + sub);
    }
    parts.sort();
    String sign = "(" + parts.join("") + ")";
    map.putIfAbsent(sign, () => []).add(node);
    return sign;
  }

  void _collect(Node node, List<String> path, List<List<String>> res) {
    for (MapEntry<String, Node> entry in node.children.entries) {
      if (entry.value.deleted) continue;
      path.add(entry.key);
      res.add(List<String>.from(path));
      _collect(entry.value, path, res);
      path.removeLast();
    }
  }
}

class Node {
  Map<String, Node> children = <String, Node>{};
  bool deleted = false;
}