using System;
using System.Collections.Generic;

public class Solution
{
    public IList<string> RemoveSubfolders(string[] folder)
    {
        Array.Sort(folder, StringComparer.Ordinal);
        var res  = new List<string>(folder.Length);
        string prev = string.Empty;

        foreach (string path in folder)
        {
            if (prev.Length == 0 ||
                !path.StartsWith(prev, StringComparison.Ordinal) ||
                path.Length == prev.Length ||
                path[prev.Length] != '/')
            {
                res.Add(path);
                prev = path;
            }
        }

        return res;
    }
}