//: [Previous](@previous)

var count = 0
while count < 10 {
    print("Count is \(count)")
    count += 1
}


count = 0
var roll: Int = 0

repeat {
    roll = Int.random(in: 1...6)
    count += 1
    if count > 5 {
        print("Break")
        break
    }
    print("After \(count) rolls, rolls is \(roll)")
} while roll != 6
//: [Next](@next)
