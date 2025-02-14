import Combine
import Foundation

// MARK: - Step 1: Combine 기본 구현

let numbers = [10, 20, 30, 40, 50].publisher
numbers.map { $0 * 2 }
    .sink { print($0) }

let just = Just(100)
just.map { $0 + 50 }
    .sink { print($0) }

// MARK: - Step 2: Combine로 비동기 데이터 처리

let url = "https://jsonplaceholder.typicode.com/todos/1"
var cancellable: AnyCancellable?

struct Todo: Decodable {
    let title: String
}

cancellable = URLSession.shared
    .dataTaskPublisher(for: URL(string: url)!)
    .map(\.data)
    .decode(type: Todo.self, decoder: JSONDecoder())
    .sink(receiveCompletion: { print($0)}, receiveValue: {print($0.title)})

let timer = Timer.publish(every: 1,
                          on: .main,
                          in: .common)
    .autoconnect()

var timerCancellable: AnyCancellable? = timer
    .map(\.timeIntervalSince1970)
    .sink { print($0) }

DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
    timerCancellable?.cancel()
}
