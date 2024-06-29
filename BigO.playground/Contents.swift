import UIKit

struct Column {
    var pins: [Pin]
    var height: Int
}

struct Pin: Hashable {
    let id: Int
    let height: Int
}

let pins: [Pin] = [
    Pin(id: 1, height: 200),
    Pin(id: 2, height: 200),
    Pin(id: 3, height: 150),
    Pin(id: 4, height: 300),
    Pin(id: 5, height: 300)
]


func filledColumns(_ numberOfColumns: Int, with pins: [Pin]) -> [Int: Column] {
    var filledColumns = [Int: Column]()
    var initialHeight = 0
    var shortestColumnIndex = 0
    
    for column in 0..<numberOfColumns {
        filledColumns[column] = Column(pins: [], height: .zero)
    }
    for pin in pins {
        print("-- returns here")
        let minHeightColumn = filledColumns.min(by: { $0.value.height < $1.value.height })
        if let minIndex = minHeightColumn?.key {
            filledColumns[minIndex]?.pins.append(pin)
            filledColumns[minIndex]?.height += pin.height
            print("\(minIndex) \n")
        }
        
    }
    return filledColumns
}

dump(filledColumns(2, with: pins))
