class Solution {

    /**
     * @param String[][] $paths
     * @return String[][]
     */
    function deleteDuplicateFolder($paths) {
        // Initialize the folder tree
        $folderTree = array();
        
        // Build the folder tree from the paths
        foreach ($paths as $path) {
            $currentNode = &$folderTree;
            foreach ($path as $folder) {
                if (!isset($currentNode[$folder])) {
                    $currentNode[$folder] = array();
                }
                $currentNode = &$currentNode[$folder];
            }
        }
        
        // Dictionary to track serialized structures and their corresponding nodes
        $duplicates = array();
        
        // Serialize the folder tree
        $this->serialize($folderTree, $duplicates);
        
        // Mark duplicate folders for deletion
        foreach ($duplicates as $nodes) {
            if (count($nodes) > 1) { // If there are duplicates
                foreach ($nodes as &$node) {
                    // Mark the node as deleted
                    $node['#'] = true;
                }
            }
        }
        
        // List to hold the remaining folder paths
        $res = array();
        
        // Collect paths that are not marked for deletion
        $this->collect($folderTree, array(), $res);
        
        return $res;
    }
    
    function serialize(&$node, &$duplicates) {
        if (empty($node)) {
            return "()";
        }
        
        $childSerialization = array();
        // Sort the keys to ensure consistent serialization
        ksort($node);
        foreach ($node as $child => &$childNode) {
            $childSerialization[] = $child . $this->serialize($childNode, $duplicates);
        }
        
        $serial = "(" . implode("", $childSerialization) . ")";
        // Store the node in duplicates based on its serialization
        if (!isset($duplicates[$serial])) {
            $duplicates[$serial] = array();
        }
        $duplicates[$serial][] = &$node;
        
        return $serial;
    }
    
    function collect($node, $path, &$res) {
        foreach ($node as $child => $childNode) {
            // Skip marked nodes
            if (isset($childNode['#'])) {
                continue;
            }
            
            // Build the new path
            $newPath = $path;
            $newPath[] = $child;
            // Add the new path to the result
            $res[] = $newPath;
            // Recursively collect paths from child nodes
            $this->collect($childNode, $newPath, $res);
        }
    }
}