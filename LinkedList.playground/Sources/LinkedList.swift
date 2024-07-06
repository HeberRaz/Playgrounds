import Foundation
/// `Linked List`. There are 3 ways to add values to a linked list, each having their own unique performance characteristics:
/// 1. push: Adds a value at the front of the list.
/// 2. append: Adds a value at the end of the list.
/// 3. insert(after:) Adds a value after a particular node of the list.
public struct LinkedList<Value> {
    public var head: Node<Value>?
    public var tail: Node<Value>?
    
    public init() {}
    
    public var isEmpty: Bool {
        head == nil
    }
    
    // MARK: - Add values to Linked List
    
    /// Description.
    /// Adds a value at the front of the Linked List
    /// - parameters:
    ///  - value: The value type you want to push to the LinkedList.
    public mutating func push(_ value: Value) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    /// Description.
    /// Adds a value at the end of the Linked list.
    /// If the list is empty, both head and tail are updated to the new node. Since append on an empty list is functionally identical
    /// to `push` we simply invoke `push` to do the work.
    /// - parameters:
    /// - value: The value type you want to append to the LinkedList.
    public mutating func append(_ value: Value) {
        guard isEmpty else {
            tail?.next = Node(value: value)
            tail = tail?.next
            return
        }
        push(value)
    }
    
    @discardableResult
    public mutating func insert(_ value: Value,
                                after node: Node<Value>) -> Node<Value> {
        guard tail !== node else {
            append(value)
            return tail ?? .init(value: value)
        }
        
        node.next = Node(value: value, next: node.next)
        return node.next ?? .init(value: value)
    }
    
    /// Description.
    /// This function wil try to retrieve a node in the list based on the given index. Since we can only access the nodes of the list from the head node, this function has to make iterative traversals.
    ///
    /// - parameters:
    /// - index: The index we want to retrieve the node from.
    ///
    public func node(at index: Int) -> Node<Value>? {
        // 5, 4, 3, 2, 1
        var currentNode = head
        var currentIndex = 0
        
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode?.next
            currentIndex += 1
        }
        return currentNode
    }
    
    // MARK: - Remove values from Linked List.
    
    /// `pop` returns the value that was removed from the list. This value is optional, since it's possible that the list is empty.
    @discardableResult
    public mutating func pop() -> Value? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    
    @discardableResult
    public mutating func removeLast() -> Value? {
        guard let head else { return nil }
        guard head.next != nil else {
            return pop()
        }
        
        var previous = head
        var current = head
        
        while let next = current.next {
            previous = current
            current = next
        }
        
        previous.next = nil
        tail = previous
        return current.value
    }
    
    @discardableResult
    public mutating func remove(after node: Node<Value>) -> Value? {
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        return node.next?.value
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        guard let head else {
            return "Empty list"
        }
        return String(describing: head)
    }
}
