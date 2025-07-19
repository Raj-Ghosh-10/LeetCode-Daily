use std::path::Path;

impl Solution {
    pub fn remove_subfolders(folder: Vec<String>) -> Vec<String> {
        let mut result: Vec<String> = Vec::new();
        let mut folder = folder;
        folder.sort();

        let mut curr = &folder[0];
        result.push(curr.clone());

        for f in folder.iter() {
            let path_curr = Path::new(curr);
            let path_f = Path::new(f);
            if path_f.starts_with(path_curr) {
                continue;
            } else {
                curr = &f;
                result.push(f.clone());
            }
        }

        result
    }
}