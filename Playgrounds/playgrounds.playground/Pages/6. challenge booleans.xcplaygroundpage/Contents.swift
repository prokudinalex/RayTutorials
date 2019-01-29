//: [Previous](@previous)

import Foundation

let myAge = 29
let isTeen = myAge >= 13 && myAge <= 19

let leoAge = 14
let eitherAreTeens = isTeen || leoAge >= 13 && leoAge <= 19

let student = "Alex"
let author = "Matt"
let isStudent = student == author

let studentBefore = student < author
print(isTeen ? "Teen" : "Not a Teen")

let answer = !isTeen ? "not a teen" : "teen"
print(answer)

//: [Next](@next)
