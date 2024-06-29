import Foundation

let serialQueue = DispatchQueue(label: "swift.serial.queue")

serialQueue.async {
    print("Task 1 started")
    
    sleep(5)
    
    print("Task 1 finished")
}

serialQueue.sync {
    print("Task 2 started")
    
    sleep(2)
    
    print("Task 2 finished")
}

