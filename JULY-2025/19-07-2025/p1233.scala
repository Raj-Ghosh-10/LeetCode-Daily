object Solution {
    def removeSubfolders(folders: Array[String]): List[String] = {
        folders
            .sorted
            .foldLeft(List.empty[String]) { (acc, folder) =>
                if (acc.nonEmpty && folder.startsWith(acc.last + "/")) acc
                else acc :+ folder
            }
    }
}