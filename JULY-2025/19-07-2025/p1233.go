import (
	"strings"
)

type Node struct {
	end      bool
	children map[string]*Node
}
func removeSubfolders(folder []string) []string {
	root := &Node{children: map[string]*Node{}}

	for _, path := range folder {
		cur := root
		parts := strings.Split(path, "/")[1:] 
		skip := false
		for _, name := range parts {
			if cur.end {          
				skip = true
				break
			}
			if cur.children == nil {
				cur.children = map[string]*Node{}
			}
			if _, ok := cur.children[name]; !ok {
				cur.children[name] = &Node{}
			}
			cur = cur.children[name]
		}
		if !skip {               
			cur.end = true
			cur.children = nil    
		}
	}

	var res []string
	var dfs func(*Node, []string)
	dfs = func(n *Node, path []string) {
		if n.end {
			res = append(res, "/"+strings.Join(path, "/"))
			return 
		}
		for name, child := range n.children {
			dfs(child, append(path, name))
		}
	}
	for name, child := range root.children {
		dfs(child, []string{name})
	}
	return res
}