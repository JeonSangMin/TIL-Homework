import UIKit

// 1. 옵셔널 타입의 문자열 파라미터 3개를 받은 뒤, 옵셔널을 추출하여 Unwrapping 된 하나의 문자열로 합쳐서 반환하는 함수
print("----과제 1----")
func combineStr(a: String?, b: String?, c: String?) -> String {
    var combinedStr = ""
    
    let aStr = a != nil ? a! : " "
    let bStr = b != nil ? b! : " "
    let cStr = c != nil ? c! : " "

    combinedStr = aStr + bStr + cStr
    return combinedStr
}
print(combineStr(a: "너를 사랑하는 것은", b: nil, c: "놀라워"))
print(" ")
print("----과제 2----")



// 2. 사칙 연산을 가진 enum 타입 Arithmetic 과 2개의 자연수를 입력 파라미터로 받아 해당 연산의 결과를 반환하는 함수 구현
enum Arithmetic {
    case addition, subtraction, multiplication, division
   
}

func executingArithmetic(a: Int, b: Int, oper: Arithmetic) -> Int {
    var result = 0
    switch oper {
       case .addition:
           result = a + b
       case .subtraction:
           result = a - b
       case .multiplication:
           result = a * b
       case .division:
           result = a / b
       }
    return result
}

print("가 : " + "\(executingArithmetic(a: 5, b: 10, oper: .addition))")
print("감 : " + "\(executingArithmetic(a: 5, b: 10, oper: .subtraction))")
print("승 : " + "\(executingArithmetic(a: 5, b: 10, oper: .multiplication))")
print("제 : " + "\(executingArithmetic(a: 10, b: 5, oper: .division))")

