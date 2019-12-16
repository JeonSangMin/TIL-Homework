import UIKit

// 타입 캐스팅
// 1. 위와 같이 정의된 변수 task1이 있을 때 다음의 더하기 연산이 제대로 동작하도록 할 것 (task1(Any) + task1(Any))

func addTwoValues(a: Int, b: Int) -> Int {
  return a + b
}

let task1: Any = addTwoValues(a: 2, b: 3)

func sumTask1() {
    guard let ts = task1 as? Int else {return}
    ts + ts
}
sumTask1()

/*****************************************
도전 과제 1. 과제 1번에 이어 이번에는 위와 같이 정의된 task2 변수에 대해 두 변수의 더하기 연산이 제대로 동작하도록 할 것 (addTwoValues의 각 파라미터에는 원하는 값 입력)
task2 + task2
 *************************************************/

let task2: Any = addTwoValues

func sumTask2(a: Int, b: Int) {
    guard let ts = task2 as? (Int, Int) -> Int else {return}
    ts(a,b) + ts(a,b)
}

sumTask2(a: 4, b: 9)


 // 도전 과제 2.
 class Phone {}
 let values: [Any] = [0, 0.0, (2.0, Double.pi),Phone(), { (str: String) -> Int in str.count }]
 
 //위 values 변수의 각 값을 switch 문과 타입캐스팅을 이용해 출력하기
for value in values {
    switch value {
    case let x where (value as? Int) != nil :
        print("\(x) is Int type")
    case is Double :
        print("\(value) is Double")
    case let x where (value as? (Double,Double)) != nil :
        print("\(x) is Tuple")
    case let x where (value as? Phone) != nil :
        print("\(x) is Phone")
    case let x where (value as? (String) -> Int) != nil :
        print("\(x) is Closure")
    default :
        print("\(value) is Any")
    }
}
if let x = 3 as? Int  {
   
    
}
/*
1. 생성자 구현
- Vehicle 클래스에 지정 이니셜라이져(Designated Initializer) 추가
- Car 클래스에 modelYear 또는 numberOfSeat가 0 이하일 때 nil을 반환하는 Failable Initializer 추가
- Bus 클래스에 지정 이니셜라이져를 추가하고, maxSpeed를 100으로 기본 할당해주는 편의 이니셜라이져 추가

*/

class Vehicle {
    let name: String
    let maxSpeed: Int
    
    init() {
        self.name = "탈것"
        self.maxSpeed = 100
    }
        
    init(name: String, maxSpeed: Int) {
        self.name = name
        self.maxSpeed = maxSpeed
    }
}

// - Car 클래스에 modelYear 또는 numberOfSeat가 0 이하일 때 nil을 반환하는 Failable Initializer 추가

class Car: Vehicle {
    var modelYear: Int
    var numberOfSeats: Int
    
//    init(modelYear: Int, numberOfSeats: Int) {
//        self.modelYear = modelYear
//        self.numberOfSeats = modelYear
//        super.init()
//    }
    
    // if는 함수의 실행 흐름을 제어함, guard는 애초에 실행 여부를 필터링함
    init?(name: String, maxSpeed: Int, modelYear: Int, numberOfSeats: Int) {
        guard modelYear > 0, numberOfSeats > 0 else {return nil}
        self.modelYear = modelYear
        self.numberOfSeats = numberOfSeats
        super.init(name: name, maxSpeed: maxSpeed)
    }
}
 


class Bus: Vehicle {
    let isDoubleDecker: Bool
    
    init(name: String, maxSpeed: Int, isDoubleDecker: Bool) {
        self.isDoubleDecker = isDoubleDecker
        super.init(name: name, maxSpeed: maxSpeed)
    }
    
    convenience init(name: String, isDoubleDecker: Bool) {
        self.init(name: name, maxSpeed: 100, isDoubleDecker: isDoubleDecker)
    }
}


let bus1 = Bus(name: "버스", isDoubleDecker: true)
print(bus1.maxSpeed)

if let car1 = Car(name: "야호", maxSpeed: 999, modelYear: 6, numberOfSeats: 2) {
    print(car1.numberOfSeats)
} else {
    "실패"
}




