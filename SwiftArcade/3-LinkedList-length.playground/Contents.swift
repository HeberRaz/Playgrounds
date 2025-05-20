import UIKit

class Node {
    var data: Int
    var next: Node?

    init(_ data: Int, _ next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

func length(_ head: Node?) -> Int {
    if head == nil {
        return 0
    }
    var count = 1
    var node = head

    while node?.next != nil {
        node = node?.next
        count += 1
    }
    return count
}

func evaluate() {
    let node6 = Node(6)
    let node5 = Node(5, node6)
    let node4 = Node(4, node5)
    let node3 = Node(3, node4)
    let node2 = Node(2, node3)
    let node1 = Node(1, node2)

    print(length(node1))
}

evaluate()
