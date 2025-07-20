from collections import defaultdict

class TrieNode:
    def __init__(self):
        self.children = dict()
        self.name = ""
        self.serial = ""
        self.is_deleted = False

class Solution:
    def deleteDuplicateFolder(self, paths):
        root = TrieNode()
        
        # Build trie
        for path in paths:
            node = root
            for folder in path:
                if folder not in node.children:
                    child = TrieNode()
                    child.name = folder
                    node.children[folder] = child
                node = node.children[folder]

        # Map serialized subtree → list of nodes
        serial_map = defaultdict(list)

        def serialize(node):
            if not node.children:
                node.serial = ""
                return ""
            items = []
            for child in sorted(node.children.values(), key=lambda x: x.name):
                items.append(f"{child.name}({serialize(child)})")
            node.serial = "".join(items)
            serial_map[node.serial].append(node)
            return node.serial

        serialize(root)

        # Mark duplicates
        for nodes in serial_map.values():
            if len(nodes) > 1:
                for node in nodes:
                    node.is_deleted = True

        # Collect surviving paths
        ans = []

        def collect(node, path):
            for child in node.children.values():
                if not child.is_deleted:
                    new_path = path + [child.name]
                    ans.append(new_path)
                    collect(child, new_path)

        collect(root, [])
        return ans