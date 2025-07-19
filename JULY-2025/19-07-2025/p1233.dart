class Solution {
  List<String> removeSubfolders(List<String> folder) {
    folder.sort();
    List<String> ans = [folder.first];

    for (int i = 1; i < folder.length; i++) {
      if (!folder[i].startsWith('${ans.last}/')) {
        ans.add(folder[i]);
      }
    }
    return ans;
  }
}