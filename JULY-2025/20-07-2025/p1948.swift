import Foundation

class Node {
    var name: String
    var children: [String: Node] = [:]
    var parent: Node? = nil
    var shouldDelete = false
    
    init(_ name: String = "") {
        self.name = name
    }
}

class Solution {
    func deleteDuplicateFolder(_ paths: [[String]]) -> [[String]] {
        let root = Node()
        
        for path in paths {
            var curr = root
            for name in path {
                if curr.children[name] == nil {
                    let newNode = Node(name)
                    newNode.parent = curr
                    curr.children[name] = newNode
                }
                curr = curr.children[name]!
            }
        }

        var serialToNodes: [String: [Node]] = [:]

        @discardableResult
        func serialize(_ node: Node) -> String {
            if node.children.isEmpty { return "" }
            var result = [String]()
            for key in node.children.keys.sorted() {
                let child = node.children[key]!
                let serialized = serialize(child)
                result.append("(\(key)\(serialized))")
            }
            let final = result.joined()
            serialToNodes[final, default: []].append(node)
            return final
        }

        serialize(root)

        for nodes in serialToNodes.values where nodes.count > 1 {
            for node in nodes {
                markForDeletion(node)
            }
        }

        func markForDeletion(_ node: Node) {
            node.shouldDelete = true
            for child in node.children.values {
                markForDeletion(child)
            }
        }

        var result = [[String]]()

        func collect(_ node: Node, _ path: [String]) {
            if node !== root && node.shouldDelete { return }
            if node !== root {
                let newPath = path + [node.name]
                result.append(newPath)
                for child in node.children.values {
                    collect(child, newPath)
                }
            } else {
                for child in node.children.values {
                    collect(child, [])
                }
            }
        }

        collect(root, [])
        return result
    }
}