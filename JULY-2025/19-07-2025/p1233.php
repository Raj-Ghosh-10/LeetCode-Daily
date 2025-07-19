class Solution {

    /**
     * @param String[] $folder
     * @return String[]
     */
    function removeSubfolders($folder) {
        asort($folder);
        $folder = array_values($folder);
        $folderList=[$folder[0]];
        $i=1;
        $k=0;
        while($folder[$i]){
            if(strlen($folder[$i]) > $folderList[$k] && strpos($folder[$i],$folderList[$k].'/') === 0){
                $i++;
                continue;
            }
            $folderList[]=$folder[$i];
            $i++;
            $k++;
        }
        return $folderList;
        
    }
}