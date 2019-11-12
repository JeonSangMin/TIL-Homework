import UIKit

// MARK: -과제

// 두개의 자연수를 입력받아 두 수를 하나의 숫자로 이어서 합친 결과를 정수로 반환하는 함수
func sumNaturalNum(a: Int, b: Int) -> Int {
    return Int("\(a)" + "\(b)")!
}
print(sumNaturalNum(a: 23, b: 45))

print("----------")

// 문자열 두개를 입력받아 두 문자열이 같은지 여부를 판단해 주는 함수
func judgeStr(a: String, b: String) -> Bool {
    if a == b {
       return true
    } else {
        return false
    }
}
print(judgeStr(a: "상민", b: "상민"))

print("----------")

// 자연수를 입력받아 그 수의 약수를 모두 출력하는 함수
func printAliquot(a: Int) {
    var aliquot: [Int] = []
    for i in 1...a {
        if a % i == 0 {
            aliquot.append(i)
        }
    }
    for j in aliquot {
        print(j)
    }
}
printAliquot(a: 8)

print("----------")

// 100 이하의 자연수 중 3과 5의 공배수를 모두 출력하는 함수
func printCommonMul() {
    var commonMultiple : [Int] = []
    for i in 1...100 {
        if i % 3 == 0 && i % 5 == 0 {
            commonMultiple.append(i)
        }
    }
    for j in commonMultiple {
        print(j)
    }
}
printCommonMul()
