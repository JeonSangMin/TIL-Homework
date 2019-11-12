# TIL-Homework

## 19.11.11

#### if statement

조건문이 true이면 출력, else는 false일 때 출력, else if는 다른 조건이 true일 때 출력



```swift
// Logical And Operator
if (temperatureInFahrenheit > 0) && (temperatureInFahrenheit % 2 == 0) {
}

// Logical And Operator
if temperatureInFahrenheit > 0, temperatureInFahrenheit % 2 == 0 {
}

// Logical Or Operator
if temperatureInFahrenheit > 0 || temperatureInFahrenheit % 2 == 0 {
}    
```



&& 연산자는 자주 사용하니 , 로 대체 가능하다

#### Q. if ~ else if  / if 문을 2개 하는 것과 차이점?

```swift
var number = 9

if number < 10 {
  print("10보다 작다")
}
if number < 20 {
  print("20보다 작다")
}
// if 문을 두번 사용 하면 위와 같은 경우 두 개 다 실행된다.
```

#### if ~ else if 만 있을 때 else 없이 동일하게 처리하려면?

```swift
var = 25

if number < 10 {
  print("10보다 작다")
} else if number < 20 {
  print("20보다 작다")
} else if number >= 20 {
  print("20과 같거나 크다")
}
// else if에 해당하지 않는 모든 경우를 else가 들어갈 자리에 조건을 걸어줘야한다.
```



------



### Switch statement



```swift
/*
 switch <#value#> {
 case <#value 1#>:
     <#respond to value 1#>
 case <#value 2#>,
      <#value 3#>:
     <#respond to value 2 or 3#>
 default:
     <#otherwise, do something else#>
 }
 
 - switch 문은 가능한 모든 사례를 반드시 다루어야 함 (Switch must be exhaustive) 
 */
```



#### Q. 아래의 if - else if - else 문을 switch 문으로 바꿔보세요.

```swift
if temperatureInFahrenheit <= 32 {
 print("It's very cold. Consider wearing a scarf.")
 } else if temperatureInFahrenheit >= 86 {
 print("It's really warm. Don't forget to wear sunscreen.")
 } else {
 print("It's not that cold. Wear a t-shirt.")
 }
```

```swift
var temp = 44

switch temp {
case ...32 :
    print("It's very cold. Consider wearing a scarf.")
case 33...86 :
    print("It's really warm. Don't forget to wear sunscreen.")
default:
    print("It's not that cold. Wear a t-shirt.")
}
```





------



### Compound case

- if문은 콤마(,)가 And(&&)연산인 것과 반대로 switch문은 콤마(,)가 Or(||) 연산

```swift
let somePoint = (9, 0)

switch somePoint {
case (let distance, 0), (0, let distance):
  print("On an axis, \(distance) from the origin")
default:
  print("Not on an axis")
}
// x나 y 둘중 하나가 0이면 On an axis가 출력됨
```



------

### where clause

```swift
let anotherPoint = (1, -1)

switch anotherPoint {
case let (x, y) where x == y:
  print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
  print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
  print("(\(x), \(y)) is just some arbitrary point")
}
```



#### Q. 어떤 숫자가 주어졌을 때 짝수인지 홀수인지 출력 (switch의 where 절 이용)

```swift
var num = 89

switch num {
case num where num % 2 == 0:
    print("짝수입니다.")
default:
    print("홀수입니다.")
}
```

------



### Fallthrough

- 다른 언어들은 swith문이 계속 break를 써주어야 한다. 안쓰면 그 다음 구문도 실행됨
- 그런데 swift는 안넣어도 되는게 기본임
- 반대로 fallthrough를 넣어주어야 다음 구문도 실행 됨

```swift
let integerToDescribe = 5

var description = "The number \(integerToDescribe) is"

switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
  description += " a prime number, and also"
  fallthrough
default:
  description += " an integer."
}

print(description)
// 위 코드에서 fallthrough를 빼면 default 부분은 실행이 안됨
```

------

### Guard statement

- 조건에 맞지 않으면 바로 종료

```swift
func update(age: Int) {
  if 1...100 ~= age {
    print("Update")
  }
}
```



```swift
func update(age: Int) {
  guard 1...100 ~= age else { return }
  print("Update")
}
```



------



### Tuple

```swift
let numbers = threeNumbers
numbers
numbers.0
numbers.1

// 위와 같이 매번 인덱스로 접근하고 싶지 않으면 아래와 같이 각각의 변수에 저장하는 것도 가능하다. 
let (first, second, third) = threeNumbers
first
second

// wildcard pattern
let (_, second1, third1) = threeNumbers
second1
third1
```



###  Named Tuple

```swift
let iOS = (language: "Swift", version: "4")

//let iOS: (language: String, version: String) = (language: "Swift", version: "4")
//let iOS: (language: String, version: String) = ("Swift", "4")
//let iOS = (language: "Swift", version: "4")

iOS.0
iOS.1

iOS.language
iOS.version

```

------

### Comparison Operators

- Tuple 은 7개 미만 요소에 대한 비교 연산자가 포함되어 있음
- 7개 이상의 요소를 비교하기 위해서는 비교 연산자를 직접 구현해야 함



#### Q. 다음의 비교 결과는?

```swift
(1, "zebra") < (2, "apple")   // true
(3, "apple") > (3, "bird")    // false
("3.14", 99) > ("1.99", 1)    // true
("blue", 1) > ("bluesky", -1) // false
(4, "dog") == (4, "dog")      // true

("일", 1) > ("이", 2.0)
(1, "zebra") < ("2", "apple") // 에러남 비교하는 값들의 타입이 다르기 때문
("blue", false) < ("purple", true) // 에러남 불 값은 크기비교를 할 수 없어서
```

------

### Loops

- for 문
- while



### for문

#### Q. for 문을 이용하여 3 의 10 제곱에 대한 결과값을 표현하는 코드 구현

```
let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print(answer)
```



#### Q. for 문을 이용하여 10부터 1까지 내림차순으로 출력하는 코드 구현

```

```



### While 문

- 조건이 거짓이 될 때까지 일련의 명령문 수행
- 첫 번째 반복이 시작되기 전에 반복 횟수를 알지 못할 때 많이 사용
- while / repeat-while



#### Q. 자연수 하나를 입력받아 1부터 해당 숫자 사이의 모든 숫자의 합을 구해 그 합을 반환하는 함수

```swift
func sumNumbers(max: Int) -> Int {
  var num = 1
  var sum = 0
  repeat {
    sum += num //
    num += 1
  } while num <= max
  
  return sum
}

func totalNum(max: Int) -> Int {
    var num = 1
    var sum = 0
    while num <= max {
        sum += num
        num += 1
    }
    return sum
}

print(totalNum(max: 3))
print(sumNumbers(max: 10))
```



------



### Control Transfer Statement

- continue - 현재 반복문의 작업을 중단하고 다음 반복 아이템에 대한 작업 수행
-  break - break가 포함된 해당 제어문의 흐름을 즉각 중단 (반복문, switch 문)
-  fallthrough - switch 문에서 매칭된 case 의 실행이 종료된 후 그 다음의 case 까지 실행
-  return - 함수를 즉시 종료하고, return type에 해당하는 자료를 반환



## Practice

```swift

// - 학점을 입력받아 각각의 등급을 반환해주는 함수 (4.5 = A+,  4.0 = A, 3.5 = B+ ...)
func returnGrade (score : Float) -> String {
    if score >= 4.5 {
        return "A+"
    } else if score >= 4.0 {
        return "A"
    } else if score >= 3.5 {
        return "B+"
    } else if score >= 3.0 {
        return "B"
    } else if score >= 2.5 {
        return "C+"
    } else if score >= 2.0 {
        return "C"
    } else {
        return "F"
    }
}

returnGrade(score: 4.3)

// - 특정 달을 숫자로 입력 받아서 문자열로 반환하는 함수 (1 = "Jan" , 2 = "Feb", ...)
func transMonth (month: Int) -> String {
    switch month {
    case month where month == 1:
        return "Jan"
    case month where month == 2:
        return "Feb"
    case month where month == 3:
        return "Mar"
    case month where month == 4:
        return "Apr"
    case month where month == 5:
        return "May"
    case month where month == 6:
           return "Jun"
    case month where month == 7:
           return "Jul"
    case month where month == 8:
           return "Aug"
    case month where month == 9:
           return "Sep"
    case month where month == 10:
           return "Oct"
    case month where month == 11:
           return "Nov"
    case month where month == 12:
           return "Dec"
    default :
        return "not month"
    }
}

transMonth(month: 12)

// - 세 수를 입력받아 세 수의 곱이 양수이면 true, 그렇지 않으면 false 를 반환하는 함수
//   (switch where clause 를 이용해 풀어볼 수 있으면 해보기)

func num (a: Int, b: Int, c: Int) -> Bool {
    let mul = a * b * c
    switch mul {
    case mul where mul > 0:
        return true
    case mul where mul == 0:
        return false
    default :
        return false
    
    }
}

num(a: 2, b: 92, c: 0)
/*:
 ---
 ## Loops
 ---
 */

// 반복문(for , while , repeat - while)을 이용해 아래 문제들을 구현해보세요.
// - 자연수 하나를 입력받아 그 수의 Factorial 을 구하는 함수
//   (Factorial 참고: 어떤 수가 주어졌을 때 그 수를 포함해 그 수보다 작은 모든 수를 곱한 것)
//   ex) 5! = 5 x 4 x 3 x 2 x 1
 func factorial (a: Int) -> Int {
     var mul = 1
     var num = 1
     while num <= a {
         mul *= num
         num += 1
     }
     return mul
 }

factorial(a:10)

// - 자연수 두 개를 입력받아 첫 번째 수를 두 번째 수만큼 제곱하여 반환하는 함수
//   (2, 5 를 입력한 경우 결과는 2의 5제곱)
func squard (a: Int, b: Int) -> Int {
    var squ = 1
    for _ in 0..<b {
        squ *= a
    }
    return squ
}

squard(a: 2, b: 3)

// - 자연수 하나를 입력받아 각 자리수 숫자들의 합을 반환해주는 함수
//   (1234 인 경우 각 자리 숫자를 합치면 10)
func sumSeat (a: Int) -> Int {
    let str = String(a)
    var sum: [Character] = []
    var total = 0
    for char in str {
        sum.append(char)
    }
    for i in 1...sum.count {
        total += i
    }
    return total
}
print(sumSeat(a: 21347))
/*:
 ---
 ## Control Transfer
 ---
 */

// - 자연수 하나를 입력받아 1부터 해당 숫자 사이의 모든 숫자의 합을 구해 반환하는 함수를 만들되,
//   그 합이 2000 을 넘는 순간 더하기를 멈추고 바로 반환하는 함수
    func sum (a: Int) -> Int {
        var sum = 0
        var num = 1
            while num <= a {
                if sum <= 2000 {
                    sum += num
                    num += 1
                } else {
                    break
                }
            }
        return sum
    }

sum(a: 67)


// - 1 ~ 50 사이의 숫자 중에서 20 ~ 30 사이의 숫자만 제외하고 그 나머지를 모두 더해 출력하는 함수
func remainSum() -> Int {
    var sum = 0
    for i in 1...50 {
        if i >= 20 && i <= 30 {
            continue
        } else {
            sum += i
        }
    }
    return sum
}
print(remainSum())

```
