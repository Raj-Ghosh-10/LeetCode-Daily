# @param {String[]} folder
# @return {String[]}
def remove_subfolders(folder)
    folder.sort!
    if folder.length == 0
        return folder
    end

    stack = [folder[0]]
    for i in 1...folder.length
        if folder[i].index(stack[stack.length-1] + "/") == 0
            i += 1
        else
            stack.push(folder[i])
        end
    end
    return stack
end