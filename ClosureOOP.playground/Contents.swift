import Foundation

// MARK: - Step 1: 클로저 구현하기

let numbers = [1, 2, 3, 4, 5]
let doubled = numbers.map() { number in
    return number * 2
}

print(doubled)

var counter = 0
let incrementCounter = {
    counter += 1
}
incrementCounter()
incrementCounter()
print(counter)  //2 출력

// MARK: - Step 2: 객체지향 프로그래밍 구현하기

class Animal {
    var name: String

    init(name: String) {
        self.name = name
    }
    
    func makeSound() {
        print("Animal sound")
    }
}

class Dog: Animal {
    override func makeSound() {
        print("Dog sound")
    }
}

class Cat: Animal {
    override func makeSound() {
        print("Cat sound")
    }
}

let animal = Animal(name: "animal")
let dog = Dog(name: "dog")
let cat = Cat(name: "cat")

animal.makeSound()
dog.makeSound()
cat.makeSound()

let animals: [Animal] = [dog, cat]

for animal in animals {
    animal.makeSound()
}
