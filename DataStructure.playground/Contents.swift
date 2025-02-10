import Foundation

// MARK: - Step 1: 자료구조 구현

struct Queue {
    var q: [Int] = []

    mutating func enqueue(inputNumber: Int) {
        q.append(inputNumber)
    }

    mutating func dequeue() {
        if !q.isEmpty {
            q.removeFirst()
        }
    }

    func printQueue() {
        if q.isEmpty {
            print("비어있는 큐 입니다.")
        } else {
            print(q)
        }
    }
}

var firstQ = Queue()

firstQ.printQueue()
firstQ.enqueue(inputNumber: 1)
firstQ.enqueue(inputNumber: 8)
firstQ.enqueue(inputNumber: 4)
firstQ.printQueue()
firstQ.dequeue()
firstQ.printQueue()


struct Stack {
    var stack: [Int] = []

    mutating func push(inputNumber: Int) {
        stack.append(inputNumber)
    }

    mutating func pop() {
        if !stack.isEmpty {
            stack.removeLast()
        }
    }

    func printStack() {
        if stack.isEmpty {
            print("비어있는 스택 입니다.")
        } else {
            print(stack)
        }
    }
}

var firstStack = Stack()

firstStack.printStack()
firstStack.push(inputNumber: 3)
firstStack.push(inputNumber: 5)
firstStack.push(inputNumber: 1)
firstStack.printStack()
firstStack.pop()
firstStack.printStack()

// MARK: - Step 2: ARC와 순환 참조 해결

class Person {
    var name: String
    var pet: Pet?

    init(name: String) {
        self.name = name
    }

    deinit {
        print("Person 해제")
    }
}

class Pet {
    weak var owner: Person?

    init(owner: Person?) {
        self.owner = owner
    }

    deinit {
        print("Pet 해제")
    }
}

do {
    let person = Person(name: "김사람")
    let pet = Pet(owner: person)
    person.pet = pet
}
