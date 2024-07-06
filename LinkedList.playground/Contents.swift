import UIKit
var list = LinkedList<Int>()

list.push(3)
list.push(2)
list.push(1)

print("Before inserting: \(list)")
var middleNode = list.node(at: 1)
for _ in 1...4 {
    guard var middleNode else { continue }
    middleNode = list.insert(-1, after: middleNode)
}
print("After inserting: \(list)")
