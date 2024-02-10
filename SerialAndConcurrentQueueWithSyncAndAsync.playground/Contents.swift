import UIKit

/*
 How can we execute a serial queue with the async function and a concurrent queue with the sync funciton?. Let's dive into this:

 SERIAL QUEUE WITH SYNCHRONOUS EXECUTION
 If we create a serial queue and execute it with the sync funtion then the code inside the queue and outside the queue will execute in a synchronized way on a single thread.

 Example:
 */
class SerialQueue {
    static func synchronousCall() {
        print("\n=================\nSERIAL SYNC CALL\n=================\n")
        let serialQueue = DispatchQueue(label: "serialQueue")
        print("Task on the outsider queue has started \(Thread.current) \n")
        serialQueue.sync {
            print("Task on queue 1 has started")
            print("Current Thread:", Thread.current)
            for _ in 0...10_000_000 {}
            print("Task on queue 1 has finished \n")
        }
        print("Outsider task doing something")
        print("Current Thread:", Thread.current)
        print("Task on the outsider queue has finished \n")

        serialQueue.sync {
            print("Task on queue 2 has started")
            print("Current Thread:", Thread.current)
            print("Task on queue 2 has finished \n")
        }
    }
}

// SerialQueue.synchronousCall()

/*
 SERIAL QUEUE WITH ASYNCHRONOUS EXECUTION
 If we create a serial queue and execute it with the async function then the code that is outside the queue and inside the queue will execute asynchronously, but the code added to the queue will execute synchronously because the queue is serial.

 Code in our queue, `serialQueue`, is executing in one thread and the code that is outside our queue, `serialQueue`, is executing in another thread. Code that's inside the first queue and the code that is after the first and second queues will execute asynchronously.
 Example:
 */

extension SerialQueue {
    static func asynchronousCall() {
        print("\n=================\nSERIAL ASYNC CALL\n=================\n")
        let serialQueue = DispatchQueue(label: "serialQueue")
        print("Task on the outsider queue has started \(Thread.current) \n")
        serialQueue.async {
            print("Task on queue 1 has started")
            print("Current Thread inside queue 1 \(Thread.current)")
            for _ in 0...10_000_000 {}
            print("Task on queue 1 has finished \n")
        }
        print("Outsider task doing something")
        print("Current Thread outsider task \(Thread.current)")
        print("Task on the outsider queue has finished \n")
        serialQueue.async {
            print("Task on queue 2 has started")
            print("Current Thread inside queue 2\(Thread.current)")
            print("Task on queue 2 has finished \n")
        }
        print("Task 2 on the outsider queue has started \(Thread.current)")
        print("Outsider task 2 doing something")
        print("Current Thread outsider task 2 \(Thread.current)")
        print("Task 2 on the outsider queue has finished \n")
    }
}

// SerialQueue.asynchronousCall()


/*
 CONCURRENT QUEUE WITH SYNCHRONOUS EXECUTION
 If we create a concurrent queue and execute it with the sync function then the code that is outside and inside the queue will execute synchronously because we are executing the queue as synchronous.
 */

class ConcurrentQueue {
    static func synchronousCall() {
        print("\n====================\nCONCURRENT SYNC CALL\n====================\n")
        let concurrentQueue = DispatchQueue(label: "concurrentQueue", attributes: .concurrent)
        print("Task on the outsider queue has started \(Thread.current)")
        concurrentQueue.sync {
            print("Task on queue 1 has started")
            print("Current Thread inside queue 1 \(Thread.current)")
            for _ in 0...10_000_000 {}
            print("Task on queue 1 has finished \n")
        }
        print("Outsider task doing something")
        print("Current Thread outsider task \(Thread.current)")
        print("Task on the outsider queue has finished \n")
        concurrentQueue.sync {
            print("Task on queue 2 has started")
            print("Current Thread inside queue 2 \(Thread.current)")
            print("Taks on queue 2 has finished \n")
        }
    }
}

// ConcurrentQueue.synchronousCall()

/*
 CONCURRENT QUEUE WITH ASYNCHRONOUS EXECUTION
 If we create a concurrent queue and execute it with the async function then the code that is outside and inside the queue will execute asynchronously because we are executing the queue as asynchronous and our queue is also a concurrent queue.
 */

extension ConcurrentQueue {
    static func asynchronousCall() {
        print("\n=====================\nCONCURRENT ASYNC CALL\n=====================\n")
        let concurrentQueue = DispatchQueue(label: "concurrentQueue", attributes: .concurrent)
        print("Task on the outsider queue has started \(Thread.current) \n")
        concurrentQueue.async {
            print("Task on queue 1 has started")
            print("Current Thread inside queue 1 \(Thread.current)")
            for _ in 0...10_000_000 {}
            print("Task on queue 1 has finished \n")
        }
        print("Outsider task doing something")
        print("Current Thread outsider task \(Thread.current)")
        print("Task on the outsider queue has finished \n")
        concurrentQueue.async {
            print("Task on queue 2 has started")
            print("Current Thread inside queue 2 \(Thread.current)")
            print("Task on queue 2 has finished \n")
        }
    }
}

ConcurrentQueue.asynchronousCall()
