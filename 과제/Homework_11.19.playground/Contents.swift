import UIKit


// 상속 적용해 보기
class Animal {
    var brain = true
    var legs = 0
    
    func eat() {
        print("냠냠")
    }
}

class Human: Animal {
    override var legs: Int {
        get {
            return super.legs
        }
        set {
            super.legs = newValue

        }
    }
}

class Pet: Animal {
    var fleas : Int
    init(fleas: Int) {
        self.fleas = fleas
    }
    override var legs: Int {
        get {
            return super.legs
        }
        set {
            super.legs = newValue

        }
    }
}

class Dog: Pet {
    override var fleas: Int{
        get {
            return super.fleas
        }
        set {
            super.fleas = newValue

        }
    }
    override func eat() {
           print("와구와구와구와구")
       }
}

class Cat: Pet {
    override var fleas: Int{
        get {
            return super.fleas
        }
        set {
            super.fleas = newValue

        }
    }
   
}

let dog1 = Dog(fleas: 8)

dog1.legs = 4
print(dog1.brain)
print(dog1.legs)
print(dog1.fleas)
dog1.eat()
