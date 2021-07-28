import UIKit

var greeting = "Hello, playground"

let numbers = [1, 2, 3, 4, 5, 6]
var sum = 0

for n in numbers {
    sum += n
}

print(numbers)
print(sum)

func countDown(number: Int) {

  // display the number
  print(number)

  // condition to break recursion
  if number == 0 {
  print("Countdown Stops")
  }

  // condition for recursion call
  else {
  
    // decrease the number value
    countDown(number: number - 1)
  }
}


print("Countdown:")
countDown(number:5)

func sum(_ numbers: [Int]) -> Int
{
    guard !numbers.isEmpty else {
        return 0
    }

    return numbers.first! + sum(Array(numbers.dropFirst()))
}

let result = sum([1, 2, 3])
print("Our rec result is \(result)")

func fibonacci(_ i: Int) -> Int
{
    if i <= 2 {
        return 1
    }
    
    return fibonacci(i - 1) + fibonacci(i - 2)
}

print("Sum of Fibinacci \(fibonacci(7))")
