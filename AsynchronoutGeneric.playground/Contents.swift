import Foundation

// MARK: - Step 1: 비동기 프로그래밍 구현

DispatchQueue.global().async {
    for i in 1...5 {
        print(i)
    }
    DispatchQueue.main.async {
        print("UI 업데이트 완료")
    }
}

func loadData() -> Bool {
    sleep(3)
    return true
}

DispatchQueue.global().async {
    loadData()
    DispatchQueue.main.async {
        print("데이터 로드 완료")
    }
}

// MARK: - Step 2: 제네릭 구현

func swapValues<T>(_ a: inout T, _ b: inout T) {
    (a, b) = (b, a)
}

var a = 10
var b = 20
swapValues(&a, &b)
print(a, b)

struct Stack<T> {
    var items: [T] = []

    mutating func push(_ num: T) {
        items.append(num)
    }
    
    mutating func pop() -> T {
        if let lastItem = items.popLast() {
            return lastItem
        } else {
            return 0 as! T
        }
    }
}

var intStack = Stack<Int>()
intStack.push(1)
intStack.push(2)
print(intStack.pop())
