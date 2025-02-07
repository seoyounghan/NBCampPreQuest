import Foundation


// MARK: - 1. Struct 구현하기

struct User {
    var userName: String
    var userAge: Int

    func userInfo() -> String {
        return "이름: \(userName) 나이: \(userAge)"
    }
}

var user1 = User(userName: "한서영", userAge: 24)
var user2 = User(userName: "홍길동", userAge: 22)

print("user1 정보 - " + user1.userInfo())
print("user2 정보 - " + user2.userInfo())

user1.userAge = 100
user2.userAge = 300

print("user1 정보 - " + user1.userInfo())
print("user2 정보 - " + user2.userInfo())

// MARK: - 2. Class 사용 예제

class User {
    var userName: String = ""
    var userAge: Int = 0

    func userInfo() -> String {
        return "이름: \(userName) 나이: \(userAge)"
    }

    init(userName: String, userAge: Int) {
        self.userName = userName
        self.userAge = userAge
    }
}

var user3 = User(userName: "김유저", userAge: 33)
var user4 = user3

print("user3 정보 - " + user3.userInfo())
print("user4 정보 - " + user4.userInfo())

user3.userName = "박유저"

print("user3 정보 - " + user3.userInfo())
print("user4 정보 - " + user4.userInfo())

// MARK: - 3. Greetable 프로토콜

protocol Greetable {
    func greet() -> String
}

struct Person: Greetable {
    var personName: String

    func greet() -> String {
        return "안녕하세요 \(personName)님"
    }
}

class Robot: Greetable {
    let robotID: Int

    func greet() -> String {
        return "고유아이디는 \(robotID) 입니다."
    }

    init(robotID: Int) {
        self.robotID = robotID
    }
}

let person1 = Person(personName: "김사람")
let robot1 = Robot(robotID: 123456)

print("person1 - \(person1.greet())")
print("robot1 - \(robot1.greet())")


// MARK: - 4. 프로토콜 확장(Extension)

extension Greetable {
    func greet() -> String {
        return "Hello!"
    }
}

struct Alien: Greetable {

}

var alien: Alien = Alien()

print("\(alien.greet())")
