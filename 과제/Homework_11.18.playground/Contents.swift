import UIKit

//1. 클래스 만들어보기
class Dog {
    var name: String
    var age: Int
    var weight: Int
    var breed: String
    
    init(name: String, age: Int, weight: Int, breed: String) {
        self.name = name
        self.age = age
        self.weight = weight
        self.breed = breed
    }
    
    func bowWow() {
        print("bow!!wow!!")
    }
    
    func eatSomething() {
        print("chop!! chop!!")
    }
}

class Student {
    var name: String
    var age: Int
    var nameOfSchool: String
    var grade: Int
    
    init(name: String, age: Int, nameOfSchool: String, grade: Int) {
        self.name = name
        self.age = age
        self.nameOfSchool = nameOfSchool
        self.grade = grade
    }
    
    func study() {
        print("studying hard...")
    }
    
    func eatSomething() {
        print("chop!! chop!!")
    }
    
    func sleep() {
        print("zzZ")
    }
}

class IPhone {
    var nameOfDevice: String
    var price: Int
    var faceId: Bool
    
    init(nameOfDevice: String, price: Int, faceId: Bool) {
        self.nameOfDevice = nameOfDevice
        self.price = price
        self.faceId = faceId
    }
    
    func makePhoneCall() {
        print("calling...")
    }
    
    func sendMassage() {
        print("typing text..")
    }
}

class Coffee {
    var nameOfCoffee: String
    var price: Int
    var originOfBeans: String
    
    init(nameOfCoffee: String, price: Int, originOfBeans: String) {
        self.nameOfCoffee = nameOfCoffee
        self.price = price
        self.originOfBeans = originOfBeans
    }
}

class Calculator {
    var value = 0
    
    func sum(a: Int, b: Int) -> Int {
        value = a + b
        return value
    }
    
    func div(a: Int, b: Int) -> Int {
          value = a / b
          return value
      }
    
    func sub(a: Int, b: Int) -> Int {
          value = a - b
          return value
      }
    
    func mul(a: Int, b: Int) -> Int {
          value = a * b
          return value
      }
    
    func initializationOfValue() {
        self.value = 0
    }
}
