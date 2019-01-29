//: [Previous](@previous)

let range = 1...10
for i in range {
    print(i * i)
}


var sum = 0
for row in 0..<8 where row % 2 == 1 {
    for column in 0..<8 {
        sum += row * column
    }
}
sum

//: [Next](@next)
