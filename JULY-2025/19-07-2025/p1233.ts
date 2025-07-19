function removeSubfolders(folder: string[]): string[] {
    folder.sort();
    const results: string[] = [];

    for (let path of folder) {
        if (results.length === 0 || !path.startsWith(results[results.length - 1] + "/")) {
            results.push(path);
        }
    }

    return results;
};