//: [Previous](@previous)

let age = 61
var stageForAge: String = ""

switch ("Jessy", 35) {
case (let name, 0...2):
    stageForAge = "\(name) Infant."
case (let name, 3...12):
    stageForAge = "\(name) Child."
case (let name, 13...19):
    stageForAge = "\(name) Teenager."
case (let name, 20...39):
    stageForAge = "\(name) Adult."
case (let name, 40...60):
    stageForAge = "\(name) Middle aged."
case (let name, 61...):
    stageForAge = "\(name) Elderly."
default:
    stageForAge = "Wrong"
}
stageForAge

//: [Next](@next)
