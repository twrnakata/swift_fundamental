//------------------------------------------
// Extensions
//------------------------------------------

/*
อยากจะเพิ่มอะไรบางอย่างเข้าไปในคลาสแต่ไม่อยากสร้างคลาสใหม่ และไม่อยาก inherit ก็ extension
โดยไม่จำเป็นต้องเข้าถึง source code เก่า ก็สามารถ extension ได้

Extensions in Swift can:

    Add computed "instance" properties and computed "type" properties
    Define instance methods and type methods
    Provide new initializers
    Define subscripts
    Define and use new nested types
    Make an existing type conform to a protocol

extension สามาถเพิ่มฟังก์ชั่นแต่ไม่สามารถ override ฟังก์ชั่นที่สร้างขึ้นมาได้

*/



//------------------------------------------
// Extension Syntax
//------------------------------------------

/*
    extension SomeType {
        // new functionality to add to SomeType goes here
    }

    extension SomeType: SomeProtocol, AnotherProtocol {
        // implementation of protocol requirements goes here
    }


instance เดิมสามารถเรียกใช้ส่วนที่ถูก extension เพิ่มทีหลังได้
*/

//------------------------------------------
// Computed Properties
//------------------------------------------

/*
    extension Double {
        var km: Double { return self * 1_000.0 }
        var m: Double { return self }
        var cm: Double { return self / 100.0 }
        var mm: Double { return self / 1_000.0 }
        var ft: Double { return self / 3.28084 }
    }
    let oneInch = 25.4.mm
    print("One inch is \(oneInch) meters")
    // Prints "One inch is 0.0254 meters"
    let threeFeet = 3.ft
    print("Three feet is \(threeFeet) meters")
    // Prints "Three feet is 0.914399970739201 meters"

*/


extension Int{
    var isEven: Bool{
        return (self % 2 == 0 )
    }
}

print(2.isEven) // true
print(33.isEven) // false 


extension Double{
    var area: Double{
        return 3.14 * (self * self)
    }
}

let circleArea = 12.area
print(circleArea) // 452.16


class Circle{
    var radius: Double = 0
}

extension Circle{
    var area: Double{
        return 3.14 * (radius * radius)
    }
    // *error*
    // var areaSelf: Double{
    //     return 3.14 * (self * self)
    // }
}

let circle = Circle()
circle.radius = 12
print("Area:", circle.area)


extension Circle{
    func areaToString() -> String{
        return String(area)
    }
}

print(type(of:circle.areaToString())) // String
print(circle.areaToString()) // 452.16



extension String {
    func length() -> Int {
        return self.count
    }
}

print("9ad8*letsgosomewahererlese0irkirt91".length()) // 35



//------------------------------------------
// Initializers
//------------------------------------------

/*
ไม่สามารเพิ่ม designated, deinit ได้ แต่สามารถเพิ่ม convenience ได้


    struct Size {
        var width = 0.0, height = 0.0
    }
    struct Point {
        var x = 0.0, y = 0.0
    }
    struct Rect {
        var origin = Point()
        var size = Size()
    }


    let defaultRect = Rect()
    let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0),
       size: Size(width: 5.0, height: 5.0))


    extension Rect {
        init(center: Point, size: Size) {
            let originX = center.x - (size.width / 2)
            let originY = center.y - (size.height / 2)
            self.init(origin: Point(x: originX, y: originY), size: size)
        }
    }


    let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
                          size: Size(width: 3.0, height: 3.0))
    // centerRect's origin is (2.5, 2.5) and its size is (3.0, 3.0)

*/


struct Person {
    let firstname: String
    let lastname: String

}

extension Person {
    init(dictionary: [String: String]) {
        self.firstname = dictionary["firstname"] ?? "[unset firstname]"
        self.lastname = dictionary["lastname"] ?? "[unset lastname]"
    }
    // init(tuple: (firstname: String, lastname: String)){
    //     let a = firstname
    //     let b = lastname
    //     self.firstname = a
    //     self.lastname = b
    //     // self.init(firstname: firstname, lastname: lastname)
    // }
    
    var toDictionary: [String: String] {
        return [
            "firstname": firstname,
            "lastlast": lastname
            ]
    }

    var profile: String{
        return "Myname is: \(firstname) \(self.lastname)"
    }
}

let manusBoon = Person(firstname: "Manus", lastname: "Boon")
print(manusBoon) // Person(firstname: "Manus", lastname: "Boon")
print(manusBoon.profile) // Myname is: Manus Boon

let somchaiKonthai = Person(dictionary: ["firstname": "Somchai", "lastname": "Konthai"])

print(somchaiKonthai) // Person(firstname: "Somchai", lastname: "Konthai")
print(somchaiKonthai.profile) // Myname is: Somchai Konthai
print(somchaiKonthai.firstname) // Somchai

let dictionarySomchai = somchaiKonthai.toDictionary
print(dictionarySomchai) // ["firstname": "Somchai", "lastlast": "Konthai"]






class Vehicle{
    var speed: Int = 0
}

class Car: Vehicle{
    let brand: String
    init(brand: String){
        self.brand = brand
    }
    func drive(){
        self.speed += 10
    }
}

extension Car{
    convenience init(brand: String, speed: Int){
        self.init(brand: brand)
        self.speed = speed
    }
}
extension Vehicle{
    func stop(){
        speed = 0
    }
}

let astonMartin = Car(brand: "Aston Martin", speed: 200)
print(astonMartin.speed) // 200
astonMartin.drive()
astonMartin.drive()
print(astonMartin.speed) // 220
astonMartin.stop()
print(astonMartin.speed) // 0



enum Color: String{
    case red, green, blue
}

extension Color{
    init(){
        self = .red
    }

    init?(_ value: String){
        switch value.lowercased(){
            case "red":
                self = .red
            case "blue":
                self = .blue
            default:
                self = .green
        }
    }

    var color: String{
        return self.rawValue
    }
}

var myRed = Color("BluE")
print(myRed!.color) // blue

var myColor = Color()
print(myColor.color) // red



//------------------------------------------
// Methods
//------------------------------------------

/*
    extension Int {
        func repetitions(task: () -> Void) {
            for _ in 0..<self {
                task()
            }
        }
    }

    3.repetitions {
        print("Hello!")
    }
    // Hello!
    // Hello!
    // Hello!

*/


extension Double{
    func powerTwoClosure(closure: (Double) -> Void){
        closure(self)
    }
}

5.powerTwoClosure{
    print($0 * $0)
}
// 25.5


struct Plane{
    var speed: Float = 0.0
}

extension Plane{
    func increaseSpeed(closure: () -> Void){
        closure()
    }
}

var somePlane = Plane(speed: 1200)
print(somePlane.speed) // 1200.0
somePlane.increaseSpeed{
    somePlane.speed += 1000
}
print(somePlane.speed) // 2200.0



struct Animal{
    var name: String
    var size: Size
    enum Size: Int{
        case small = 1, big
    }
}

var pig = Animal(name: "Pig", size: .small)

extension Animal{
    var sell: Int{
        switch self.size{
            case .small:
                return size.rawValue * 20
            case .big:
                return size.rawValue * 20
        }
    }
}

print("Pig on sale", pig.sell) // 20

extension Animal.Size{
    func ifSellToFarmer() -> Int{
        switch self{
            case .small:
                return self.rawValue * 10
            case .big:
                return self.rawValue * 10
        }
    }
}

print("Pig Sell to Farmer", pig.size.ifSellToFarmer()) // Pig Sell to Farmer 10



class User {
    private static var name: String = "[unset]"
    private static var password: String = "[unset]"
    private static var isLogin : Bool = false
}
extension User{
    static func setName(_ name: String){
        self.name = name
    }
    static func setPassword(_ password: String){
        self.password = password
    }
    static func logIn(enterPassword: String){
        if (enterPassword == password){
            isLogin = true
        }else{
            isLogin = false
        }
    }
    static func show(){
        print("name", name, "isLogin", isLogin)
    }
}


User.setName("Anakin")
User.setPassword("password")
User.show() // name Anakin isLogin false
User.logIn(enterPassword: "Password")
User.show() // name Anakin isLogin false
User.logIn(enterPassword: "password")
User.show() // name Anakin isLogin true




//------------------------------------------
// Mutating Instance Methods
//------------------------------------------

/*
    extension Int {
        mutating func square() {
            self = self * self
        }
    }
    var someInt = 3
    someInt.square()
    // someInt is now 9

*/


extension Double{
    mutating func powerTwo(){
        self = self * self
    }
}

var doubleTwo = 2.0
doubleTwo.powerTwo()
print(doubleTwo) // 4.0


extension String{
    func toInt() -> Int{
        return Int(self)!
    }
}

let nineStringToInt = "9"
print(type(of:nineStringToInt.toInt())) // Int
print(nineStringToInt.toInt()) // 9




extension Animal.Size{
    mutating func growth(){
        switch self{
            case .small:
                self = .big
            default:
                self = .big
        }
    }
}

print(pig.size) // small
pig.size.growth()
print(pig.size) // big

print("Pig on sale", pig.sell) // 40
print("Pig Sell to Farmer", pig.size.ifSellToFarmer()) // Pig Sell to Farmer 20



enum Activity: String{
    case walking = "Walking"
    case running = "Running"
    case talking = "Talking"
}

var archerActivity = Activity.walking
print(archerActivity.rawValue) // Walking

extension Activity{
    mutating func run(){
        switch self{
            case .walking:
                self = .running
            default:
                break
        }
    }

    var status: String{
        switch self{
            default:
                return self.rawValue
        }
    }
}

archerActivity.run()
print(archerActivity.status) // Running





//------------------------------------------
// Subscripts
//------------------------------------------

/*
    extension Int {
        subscript(digitIndex: Int) -> Int {
            var decimalBase = 1
            for _ in 0..<digitIndex {
                decimalBase *= 10
            }
            return (self / decimalBase) % 10
        }
    }
    746381295[0]
    // returns 5
    746381295[1]
    // returns 9
    746381295[2]
    // returns 2
    746381295[8]
    // returns 7


    746381295[9]
    // returns 0, as if you had requested:
    0746381295[9]

*/

extension String {
    subscript(index: Int) -> Character {
        let newIndex = self.index(self.startIndex, offsetBy: index)
        return self[newIndex]
    }
}

print("ABC"[0]) // A
var someString = "Hello where is my dragon"
print(someString[0]) // H
print(someString[3]) // l
print(someString[3+1]) // o



let someRange: Range<Int> = 0..<4
print(someRange)
print(someRange.contains(2)) // true

extension String{
    subscript(range: Range<Int>) -> String{
        let first = index(startIndex, offsetBy: range.lowerBound)
        let last = index(startIndex, offsetBy: range.upperBound)
        return String(self[first..<last])
    }
}

print("ABCDEFG"[0..<5]) // ABCDE


func oneToThree() -> CountableClosedRange<Int> {
    return 1...3
}
print(oneToThree()) // 1...3

extension String{
    subscript(range: CountableClosedRange<Int>) -> String{
        let first = index(startIndex, offsetBy: range.lowerBound)
        let last = index(startIndex, offsetBy: range.upperBound)
        return String(self[first...last])
    }
}

print("ABCDEGF"[1...3]) // BCD
// print(oneToThree()[1...2])

func myClosure(closure: () -> Void){
    closure()
}
myClosure{
    print("ABC"[1...2])
}
// BC

extension String{
    subscript(range: CountablePartialRangeFrom<Int>) -> String{
        return String(self[index(startIndex, offsetBy: range.lowerBound)...])
    }
}

myClosure{
    print("ABCDEFG"[1...])
}
// BCDEFG

extension String{
    subscript(range: PartialRangeUpTo<Int>) -> String{
        return String(self[..<index(startIndex, offsetBy: range.upperBound)])
    }
}

myClosure{
    print("some one have to run"[..<9])
}
// some one

extension String{
    subscript(range: PartialRangeThrough<Int>) -> String{
        return String(self[...index(startIndex, offsetBy: range.upperBound)])
    }
}

print("the dragon"[...6])
// the dra


//------------------------------------------
// Nested Types
//------------------------------------------

/*
    extension Int {
        enum Kind {
            case negative, zero, positive
        }
        var kind: Kind {
            switch self {
            case 0:
                return .zero
            case let x where x > 0:
                return .positive
            default:
                return .negative
            }
        }
    }


    func printIntegerKinds(_ numbers: [Int]) {
        for number in numbers {
            switch number.kind {
            case .negative:
                print("- ", terminator: "")
            case .zero:
                print("0 ", terminator: "")
            case .positive:
                print("+ ", terminator: "")
            }
        }
        print("")
    }
    printIntegerKinds([3, 19, -27, 0, -6, 0, 7])
    // Prints "+ + - 0 - 0 + "

*/


struct Player{
    var name: String
}

extension Player{
    enum Status: String{
        case normal, posioned

        var status: String{
            return self.rawValue
        }

        init(){
            self = .normal
        }
    }
}

var lundwarm = Player(name: "lundwarm")

var lundwarmStatus = Player.Status()
print(lundwarmStatus.status) // normal


extension Player.Status{
    enum Login{
        case login, logout

        init(_ value: String){
            switch value.lowercased(){
                case "login":
                    self = .login
                default:
                    self = .logout
            }
        }

        var isLogin: String{
            switch self{
                case .login:
                    return "Login"
                case .logout:
                    return "Logout"
            }
        }

        mutating func login(){
            self = .login
        }
    }
}

var lundwarmLoginStatus = Player.Status.Login("No")
print(lundwarmLoginStatus.isLogin) // Logout
lundwarmLoginStatus.login()
print(lundwarmLoginStatus.isLogin) // Login