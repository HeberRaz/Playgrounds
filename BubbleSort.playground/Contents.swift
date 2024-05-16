import UIKit


extension Array where Element: Comparable {

    func bubbleSort(_ areInIncreasingOrder: ((Element, Element) -> Bool) = (<)) -> [Element] {
        var data = self

        for i in 0..<(data.count-1) { // 1
            print("--> i", i)
            for j in 0..<(data.count - i - 1) where areInIncreasingOrder(data[j+1], data[j]) {
                print("\ni", i)
                print("j", j)
                data.swapAt(j, j + 1)
                print("--> data", data)
                // i = 0
                // 2, 4, 0, 1
                // 2, 0, 4, 1
                // 2, 0, 1, 4
                //________________________________
                // i = 1
                // 0, 2, 1, 4
                // 0, 1, 2, 4
                // _______________________________
                // i = 2
            }
        }
        return data
    }
}


let array = [4, 2, 0, 1]
let sorted = array.bubbleSort()
let ascendingSorted = array.bubbleSort(<)
let descendingSorted = array.bubbleSort(>)
