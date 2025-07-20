class Node {
    val: string | null;
    parent: Node | null;
    children: { [key: string]: Node };

    constructor(val: string | null, parent: Node | null) {
        this.val = val;
        this.parent = parent;
        this.children = {};
    }
}

/**
 * Deletes duplicate folders in the file system.
 * 
 * @param paths - The input array representing paths to folders.
 * @return The resulting paths after deleting duplicate folders.
 */
function deleteDuplicateFolder(paths: string[][]): string[][] {
    // Step 1: Construct the folder tree from the paths
    const root = new Node(null, null);
    for (const path of paths) {
        let current = root;
        for (const folder of path) {
            // Create child node if it doesn't exist
            if (!current.children[folder]) {
                current.children[folder] = new Node(folder, current);
            }
            current = current.children[folder];
        }
    }

    // Step 2: Identify duplicate folder structures
    const subTreeMap: { [key: string]: Node[] } = {};

    function serializeSubTree(node: Node): string {
        if (Object.keys(node.children).length === 0) {
            return node.val as string; // Leaf node
        }

        let serialized = `${node.val},`;
        // Sort children to ensure consistent traversal order
        Object.keys(node.children).sort().forEach((key) => {
            serialized += serializeSubTree(node.children[key]) + ",";
        });

        // Create a unique signature for the subtree, masking the current node's value
        const maskedSignature = serialized.replace(`${node.val},`, '*,');
        if (!subTreeMap[maskedSignature]) {
            subTreeMap[maskedSignature] = [];
        }
        subTreeMap[maskedSignature].push(node); // Store the node reference
        return serialized;
    }

    serializeSubTree(root);

    // Step 3: Remove duplicate folders
    for (const nodes of Object.values(subTreeMap)) {
        if (nodes.length > 1) {
            nodes.forEach(node => {
                if (node.parent) {
                    delete node.parent.children[node.val as string]; // Remove from parent
                }
            });
        }
    }

    // Step 4: Generate the final list of remaining folder paths
    const result: string[][] = [];

    function generatePaths(node: Node, path: string[]) {
        if (node.val) {
            path.push(node.val);
            result.push([...path]); // Store the current path
        }
        Object.keys(node.children).forEach(key => {
            generatePaths(node.children[key], path); // Recur for children
        });
        path.pop(); // Backtrack to explore other paths
    }

    generatePaths(root, []);
    return result;
}