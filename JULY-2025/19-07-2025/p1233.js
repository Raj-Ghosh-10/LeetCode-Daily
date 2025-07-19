/**
 * @param {string[]} folder
 * @return {string[]}
 */
var removeSubfolders = function(folder) {
    folder.sort();
    let filtered = [];

    for (const x of folder) {
        let y = filtered[filtered.length - 1]
        if (filtered.length === 0 || !x.startsWith(y + '/')) {
            filtered.push(x);
        }
    }
    
    return filtered;
};