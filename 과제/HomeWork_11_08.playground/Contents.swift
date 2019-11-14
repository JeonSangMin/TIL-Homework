import UIKit

// 1. 이름과 나이를 입력받아 자신을 소개하는 글을 출력하는 함수
func introduceMyself(who name: String, howOld age:Int) -> String {
    return "제 이름은 \(name)입니다. 나이는 \(age)세 입니다."
}

print(introduceMyself(who: "상민", howOld: 30))

// 2. 정수를 하나 입력받아 2의 배수 여부를 반환하는 함수
func multiplyTwo (num: Int) -> String {
    if num % 2 == 0 {
        return "짝수가 맞습니다!"
    } else {
        return "홀수 입니다!"
    }
}
print(multiplyTwo(num: 42))

//3. 정수를 두개 입력받아 곱한 결과를 반환하는 함수 (하나는 기본값 10)
func mul(a:Int ,b:Int = 10) -> Int {
    return a * b
}

print(mul(a: 10, b: 15))
print(mul(a: 9))

// 4. 4과목의 시험 점수를 입력받아 평균 점수를 반환하는 함수
func avrScore(a: Int,b: Int,c: Int,d: Int) -> Float {
    return  Float((a + b + c + d) / 4)
}

print(avrScore(a: 23, b: 90, c: 80, d: 50))

//5. 점수를 입력받아 학점을 반환하는 함수 만들기
func earnCredits(score: Int) -> Character {
    switch score {
    case 90...100:
        return "A"
    case 80..<90:
        return "B"
    case 70..<80:
        return "C"
    default:
        return "D"
    }
}
print(earnCredits(score: 67))

//6. 가변인자파라미터 여러개~ 평균점수에 대한 학점반환 함수 만들기
func avrCredits(_ scores: Int...) -> Character {
    var total = 0
    
    for score in scores {
        total += score
    }
    let average = total / scores.count
    
    switch average {
    case 90...100:
        return "A"
    case 80..<90:
        return "B"
    case 70..<80:
        return "C"
    default:
        return "D"
    }
}

print(avrCredits(10, 15, 26, 37, 48, 59, 61, 72, 83, 94, 100))

    


