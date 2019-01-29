//: [Previous](@previous)

let const = 5
let closedRange = 0...const
let halfOpenRange = 0..<const

var sum = 0
let count = 10
for i in 1...count {
    sum += i
    print("Sum is \(sum)")
}

for _ in 0...count where count > 100 {
    print("Hodor")
}

for i in 0...count where i % 2 == 1 {
    print("\(i) is odd number")
}

for i in 10...15 {
    if i == 13 {
        print("👻")
        continue
    }
    print("floor \(i)")
}

floors: for floor in 12...16 {
    rooms: for room in 11...15 {
        if room == 13 {
            print("👻")
            continue floors
        }
        print("floor \(floor) and room \(room)")
    }
}
//: [Next](@next)
