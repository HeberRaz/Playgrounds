
/// In the context of a Linked List, a `Node` is a fundamental block that holds the data and a reference (or link) to the next node in the sequence.
/// This can be any type of data, such as an integer, a string, or even a more complex data structure.
public class Node<Value> {
    public var value: Value
    public var next: Node?
    
    public init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    public var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> " + String(describing: next) + " "
    }
}
