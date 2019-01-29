import UIKit

var string = "Hello, playground"
string = "Hi!"

var currentValue = 50
var targetValue = 55

var diff = currentValue - targetValue
if diff < 0 {
    diff *= -1
}
print(diff)
