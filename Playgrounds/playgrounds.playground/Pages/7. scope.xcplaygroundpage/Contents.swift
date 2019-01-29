//: [Previous](@previous)

let maxHours = 40
let stdRate = 25
let overtimeRate = 50

let hours = 45
var price: Int = 0

if hours > maxHours {
    price = (hours - maxHours) * overtimeRate + maxHours * stdRate
} else {
    price = hours * stdRate
}

print(price)

//: [Next](@next)
