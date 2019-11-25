import UIKit


// MARK: 1. 정수 하나를 입력 받은 뒤, 해당 숫자와 숫자 1 사이에 있는 모든 정수의 합계 구하기
func sumToOne(a: Int) -> Int {
    var total = 0
    var num = a
    if a > 0 {
        while num >= 1 {
            total += num
            num -= 1
        }
    } else {
        while num <= 1 {
            total += num
            num += 1
        }
    }
    return total
}
sumToOne(a: 7)
sumToOne(a: -4)


// MARK: 2. 숫자를 입력받아 1부터 해당 숫자까지 출력하되 3, 6, 9가 하나라도 포함되어 있는 숫자는 *로 표시
func replaceStar(a: Int) {
    var strArry: [String] = []
    
    // 1~a 까지 숫자 문자열 배열로 바꿈
    for i in 1...a {
        strArry.append("\(i)")
    }
    
    // 조건 검사
    for j in 0..<a {
        if strArry[j].contains("3") {
            strArry[j] = "*"
        } else if strArry[j].contains("6") {
            strArry[j] = "*"
        } else if strArry[j].contains("9") {
            strArry[j] = "*"
        }
    }
    
    // 출력
    for k in strArry {
        print("\(k)")
    }
}
replaceStar(a: 34)

// MARK: 3. 2개의 정수를 입력했을 때 그에 대한 최소공배수와 최대공약수 구하기
func getCommons(a: Int, b: Int) {
    var temp = 0
    var big = a
    var small = b
    
    
    // 큰수 작은수 가르기
    if a < b {
        temp = big
        big = small
        small = temp
    }
    
    // 최대공약수 구하기
    while small != 0 {
        let n = big % small
        if n != 0 {
            big = small
            small = n
        } else {
            break
        }
    }
    let lcm = (a * b) / small
    print("최소공배수: \(lcm), 최대공약수: \(small)")
    
}

getCommons(a: 6, b: 9)







