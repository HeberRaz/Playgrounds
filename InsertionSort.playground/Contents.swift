import UIKit

extension Array where Element: Comparable {
    func insertionSort(_ areInIncreasingOrder: ((Element, Element) -> Bool) = (<)) -> [Element] {
        var data = self
        // 1...3
        // i = 1
        // i = 2
        // i = 3
        for i in 1..<data.count {
            // key = 2
            // key = 0
            // key = 1
            let key = data[i]
            // j = 1 - 1 = 0
            // j = 2 - 1 = 1
            // j = 3 - 1 = 2
            var j = i - 1

            while j >= 0 && areInIncreasingOrder(key, data[j]) {
                // data[0+1] = data[0] --> [4,4,0,1]*
                // data[1+1] = data[1] --> [2,4,4,1]*
                    // data[0+1] = data[0] --> [2,2,4,1]*
                // data[2+1] = data[2] --> [0,2,4,4]*
                    // data[1+1] = data[1] --> [0,2,2,4]*
                data[j + 1] = data[j]
                // j = 0 - 1 = -1
                // j = 1 - 1 = 0
                    // j = 0 - 1 = -1
                // j = 2 - 1 = 1
                    // j = 1 - 1 = 0
                j -= 1
            }
            // data[-1+1] = 2 --> [2,4,0,1]
            // data[0+1] = 0 --> [2,0,4,1]
                // data[-1+1] = 0 --> [0,2,4,1]
            // data[1+1] = 1 --> [0,2,1,4]
                // data[0+1] = 1 --> [0,1,2,4]
            data[j + 1] = key
            print(data)
        }
        // [2,4,0,1]
        // [2,0,4,1]
            // [0,2,4,1]
        // [0,2,1,4]
            // [0,1,2,4]

        return data
    }
}

let array = [4, 2, 0, 1]

// by default the sort is ascending
let sort = array.insertionSort()

// ascending
let ascendingSort = array.insertionSort(<)

// descending
let descendingSort = array.insertionSort(>)

