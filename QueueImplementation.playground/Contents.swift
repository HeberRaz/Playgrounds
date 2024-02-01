import UIKit

/*
 Reference:
 https://www.freecodecamp.org/news/queue-data-structure-definition-and-java-example-code/#:~:text=Enqueue%3A%20Adds%20an%20item%20from,if%20the%20queue%20is%20full.
 */

class MyQueue {
    var queueLength = 3
    var items = [Int](repeating: .zero, count: 3)
    var front = -1
    var back = -1

    var empty: Bool {
        front == -1 && back == -1
    }

    var isFull: Bool {
        back == queueLength - 1
    }

    func enQueue(itemValue: Int) {
        if isFull {
            print("Queue is full")
        } else if empty {
            back = 0
            front = 0
            items[back] = itemValue
        } else {
            back += 1
            items[back] = itemValue
        }
    }

    func deQueue() {
        if empty {
            print("Queue is empty, nothing to dequeue")
        } else if front == back {
            front = -1
            back = -1
        } else {
            front += 1
        }
    }

    func display() {
        let i = 0
        
        if empty {
            print("Queue is empty")
        } else {
            for i in front..<back {
                print(items[i])
            }
        }
    }

    func peek() {
        print("Front value is \(items[front])")
    }
}

func main() {
    let myQueue = MyQueue()
    
    myQueue.enQueue(itemValue: 3)
    myQueue.enQueue(itemValue: 2)
    myQueue.enQueue(itemValue: 1)
    
    myQueue.display()
    
    myQueue.peek()
}

main()
