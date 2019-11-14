import UIKit

// practice
// 1.아래의 딕셔너리를 만들고, 스펠링에 e가 들어간 과일을 좋아하는 학생을 찾아 배열로 반환하는 함수

var favoriteFruits = ["철수" : "apple", "영희" : "banana", "진수" : "grape", "미히" : "strawberry"]
func arryFruits() -> [String] {
    var eFruits : [String] = []
    for (key, values) in favoriteFruits {
        if values.contains("e") {
            eFruits.append(key)
        }
    }
    return eFruits
}
print(arryFruits())

// 2. 임의의 정수 배열을 입력받았을 때 홀수는 배열의 앞부분, 짝수는 배열의 뒷부분에 위치하도록 구성된 새로운 배열을 반환하는 함수
func intArryRealignment (intArry : [Int]) -> [Int] {
    var realignedArry : [Int] = []
    var eNumArry : [Int] = []
    let arryCnt = intArry.count
    
    for arr in 0..<arryCnt {
        if intArry[arr] % 2 == 1 {
            realignedArry.append(intArry[arr])
        } else {
            eNumArry.append(intArry[arr])
        }
    }
    
    realignedArry.append(contentsOf: eNumArry)
    return realignedArry
}
print(intArryRealignment(intArry: [2, 8, 7, 1, 4, 3]))

// 3. 0 ~ 9 사이의 숫자가 들어있는 임의의 배열에서 각 숫자가 몇 개씩 있는지 출력하는 함수

//wcntIntNum(inputNum: [1, 3, 3, 3 ,8])

// --------------------------------

// 1. 자연수를 입력받아 원래 숫자를 반대 순서로 뒤집은 순자를 반환하는 함수
func reverseStr (inputNum : Int) -> Int {
    let transStr = String(inputNum)
    return Int(String(transStr.reversed()))!
}
reverseStr(inputNum: 87654321)

// 2. 100 ~ 900 사이의 숫자 중 하나를 입력받아 각 자리의 숫자가 모드 다른지 여부를 반환하는 함수
func compareNums (inputNum : Int) -> Bool {
    let inputStr = "\(inputNum)"
    var emptyArr = [Character]()
    
    for i in inputStr {
        emptyArr.append(i)
    }
        
    if emptyArr[1] == emptyArr[0] && emptyArr[1] == emptyArr[2] {
        return false
    } else if emptyArr[0] == emptyArr[2] {
        return false
    } else{
        return true
    }
}
print(compareNums(inputNum: 123))

var str = "1234"

for i in str {
    print(i)
}

