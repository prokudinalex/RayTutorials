//: [Previous](@previous)

let number = 2
var desc: String = ""

switch number {
case 0:
    desc = "zero"
case 1...9:
    desc = "between 1 and 9"
case let negative where negative < 0:
    desc = "negative"
case _ where number > .max / 2:
    desc = "too large"
default:
    desc = "No descr"
}


let numberIsEven: Bool
switch number % 2 {
case 0:
    numberIsEven = true
default:
    numberIsEven = false
}

let coordinates = (2.0, 4.0)
let pointCategory: String
switch coordinates {
case (0,0):
    pointCategory = "Origin"
case (let x, 0):
    pointCategory = "on the x axis at \(x)"
case (0, let y):
    pointCategory = "on the y axis at \(y)"
case _ where coordinates.0 == coordinates.1:
    pointCategory = "on y = x"
case (let x, let y) where y == x * x:
    pointCategory = "on y = x ^ 2"
case (let x, let y):
    pointCategory = "at \(x), \(y)"
}

//: [Next](@next)
