//------------------------------------------
// Methods
//------------------------------------------

/*
class, struct, enum สามารถมี methods ได้หมด
*/

//------------------------------------------
// Instance Methods
//------------------------------------------

/*
    class Counter {
        var count = 0
        func increment() {
            count += 1
        }
        func increment(by amount: Int) {
            count += amount
        }
        func reset() {
            count = 0
        }
    }


    let counter = Counter()
    // the initial counter value is 0
    counter.increment()
    // the counter's value is now 1
    counter.increment(by: 5)
    // the counter's value is now 6
    counter.reset()
    // the counter's value is now 0


*/



class BankAccount{
    var balance: Int = 0

    func deposit(_ amount: Int) {
        balance += amount
    }
}
let someAccount = BankAccount()
print(someAccount.balance) // 0 
someAccount.deposit(50)
print(someAccount.balance) // 50



class BookClass {
    var title: String = "noname"
    var author: String = "noname"

    func setTitle(to title: String){
        self.title = title
    }
    func author(by person: String){
        self.author = person
    }
}

let atomicHabits = BookClass()
atomicHabits.setTitle(to: "Atomic Habits")
atomicHabits.author(by: "James Clear")

print("Book name: \(atomicHabits.title) \nAuthor: \(atomicHabits.author)")
/*
Book name: Atomic Habits 
Author: James Clear
*/



class InfiniteWord{
    var word = ""
    
    func add(words: String){
        word += words
    }
}

var listOfWord = InfiniteWord()
listOfWord.add(words: "A")
listOfWord.add(words: "B")
listOfWord.add(words: "C")
listOfWord.add(words: "D")
print(listOfWord.word) // ABCD



class Sugar{
    var haveSugar = false
}

class Candy: Sugar{
    func setSugar(_ sugar: Bool){
        haveSugar = sugar
    }
}

var someCandy = Candy()
print(someCandy.haveSugar) // false
someCandy.setSugar(true)
print(someCandy.haveSugar) // true




//------------------------------------------
// The self Property
//------------------------------------------


/*
    func increment() {
        self.count += 1
    }

    struct Point {
        var x = 0.0, y = 0.0
        func isToTheRightOf(x: Double) -> Bool {
            return self.x > x
        }
    }
    let somePoint = Point(x: 4.0, y: 5.0)
    if somePoint.isToTheRightOf(x: 1.0) {
        print("This point is to the right of the line where x == 1.0")
    }
    // Prints "This point is to the right of the line where x == 1.0"


*/


class Growth{
    var age = 10

    func happyBirthDay(){
        self.age += 1
    }
}

var todayIsMyBirthDay = Growth()
print(todayIsMyBirthDay.age) // 10
todayIsMyBirthDay.happyBirthDay()
print(todayIsMyBirthDay.age) // 11



class IncreaseTen{
    var number = 0

    func increment(){
        self.number += 10
    }
}

var addTenForEver = IncreaseTen()
print(addTenForEver.number) // 0
addTenForEver.increment()
addTenForEver.increment()
print(addTenForEver.number) // 20



class AdditionClass{
    private var number1: Int = 1
    private var number2: Int = 1
    private var result: Int

    init(number1: Int, number2: Int) {
        self.number1 = number1
        self.number2 = number2
        self.result = (number1 + number2)
        self.result = (number1 + number2)
    }

    func resultOf(number1: Int, number2:Int) -> Int{
        self.number1 = number1
        self.number2 = number2
        self.result = (number1 + number2)
        return result
    }
    
    func viewResult() -> Int{
        return self.result
    }
}

let myAddtionOfTwoNumber = AdditionClass(number1: 2, number2: 500)
print(myAddtionOfTwoNumber.viewResult()) // 502
print(myAddtionOfTwoNumber.resultOf(number1: 10, number2: 10)) // 20




//------------------------------------------
// Modifying Value Types from Within Instance Methods
//------------------------------------------

/*
    struct Point {
        var x = 0.0, y = 0.0
        mutating func moveBy(x deltaX: Double, y deltaY: Double) {
            x += deltaX
            y += deltaY
        }
    }
    var somePoint = Point(x: 1.0, y: 1.0)
    somePoint.moveBy(x: 2.0, y: 3.0)
    print("The point is now at (\(somePoint.x), \(somePoint.y))")
    // Prints "The point is now at (3.0, 4.0)"

*/


struct AreaStruct {
    var width = 15
    var height = 20
    
    mutating func scaleUp(by value: Int){
        width *= value
        height *= value
    }
}

var someAreaStruct = AreaStruct()
print(someAreaStruct) // AreaStruct(width: 15, height: 20)
someAreaStruct.scaleUp(by: 20)
print(someAreaStruct) // AreaStruct(width: 300, height: 400)

let letSomeAreaStruct = AreaStruct(width: 90, height: 90)
print(letSomeAreaStruct) // AreaStruct(width: 90, height: 90)



struct Triangle{
    var a: Int
    var b: Int
    var c: Int

    mutating func changeTriangle(a: Int, b: Int, c: Int){
        self.a = a
        self.b = b
        self.c = c
    }
}

var myTriangle = Triangle(a: 1, b: 2, c: 3)
print(myTriangle) // Triangle(a: 1, b: 2, c: 3)
myTriangle.changeTriangle(a: 2, b: 3, c: 4)
print(myTriangle) // Triangle(a: 2, b: 3, c: 4)




struct Move{
    var position = 0
    
    mutating func moveForward(_ forward: Int){
        guard forward > 0 else { return }
        position += forward
    }
}

var moveInstance = Move()
print(moveInstance.position) // 0
moveInstance.moveForward(10)
print(moveInstance.position) // 10





class Crap{
    var legs = 4

    init(){
        self.legs = 4
    }
    init(legs : Int){
        self.legs = legs
    }

    func changeLegs(to value: Int){
        self.legs = value
    }
}

var myCrap = Crap()
print(myCrap.legs) // 4
myCrap.changeLegs(to: 8)
print(myCrap.legs) // 8



//------------------------------------------
// Assigning to self Within a Mutating Method
//------------------------------------------

/*
    struct Point {
        var x = 0.0, y = 0.0
        mutating func moveBy(x deltaX: Double, y deltaY: Double) {
            self = Point(x: x + deltaX, y: y + deltaY)
        }
    }

*/


struct Chair{
    var color = "red"

    mutating func changeColor(to value: String){
        self = Chair(color: value)
    }
}

var myStructChair = Chair()
print(myStructChair) // Chair(color: "red")
myStructChair.changeColor(to: "blue")
print(myStructChair) // Chair(color: "blue")


enum AnimalEnum{
    case dog, cat, fish
    
    mutating func switchTypes(){  
        switch self{
            case .dog:
                self = .cat
            case .cat:
                self = .fish
            case .fish:
                self = .dog
        }
    }
}


var guessAnimal = AnimalEnum.dog
print(guessAnimal) // dog
guessAnimal.switchTypes()
print(guessAnimal) // cat
guessAnimal.switchTypes()
print(guessAnimal) // fish



struct FoolballPlayer{
    var position = "[Unset]"

    mutating func setPosition(to position: String){
        switch position {
        case "forward":
            self.position = "Forward"
        case "center":
            self.position = "Center"
        default:
            self.position = "Midfield"
        }
    }
}

var kante = FoolballPlayer()
print(kante.position) // [Unset]
kante.setPosition(to: "forward")
print(kante.position) // Forward



enum MiracleMathematic{
    case plusTwo(Int)
    case multiTwo(Int)
    case divideByTwo(Int)
    case modTwo(Int)

    mutating func operating(){
        switch self{
            case let .plusTwo(value):
                self = .plusTwo(value + 2)
            case let .multiTwo(value):
                self = .multiTwo(value * 2)
            case let .divideByTwo(value):
                self = .divideByTwo(value / 2)
            case let .modTwo(value):
                self = .modTwo(value % 2)

        }
    }
    
    mutating func switchOperating(){
        switch self{
            case let .plusTwo(value):
                self = .multiTwo(value)

            case let .multiTwo(value):
                self = .divideByTwo(value)

            case let .divideByTwo(value):
                self = .modTwo(value)

            case let .modTwo(value):
                self = .plusTwo(value % 2)
        }
    }
}

var guessWhatIsOperating = MiracleMathematic.plusTwo(0)
print(guessWhatIsOperating) // plusTwo(0)
guessWhatIsOperating.operating()
print(guessWhatIsOperating) // plusTwo(2)

guessWhatIsOperating.switchOperating()
print(guessWhatIsOperating) // multiTwo(2)
guessWhatIsOperating.operating()
print(guessWhatIsOperating) // multiTwo(4)



//------------------------------------------
// Type Methods
//------------------------------------------

/*
    class SomeClass {
        // ยอมให้ subclass override function ได้
        class func someTypeMethod() {
            // type method implementation goes here
        }
    }
    SomeClass.someTypeMethod()


    struct LevelTracker {
        // ทุกคนมองเห็นเหมือนกัน เป็นของ type
        static var highestUnlockedLevel = 1 // Static properties
        // ติดตามเลเวลปัจจุบันของผู้เล่น
        var currentLevel = 1

        // เป็น static และอยู่ภายใน type เดียวกันและมีการเรียกใช้ static properties สามารถเขียนแค่ชื่อได้
        static func unlock(_ level: Int) {
            if level > highestUnlockedLevel { highestUnlockedLevel = level }
        }

        static func isUnlocked(_ level: Int) -> Bool {
            return level <= highestUnlockedLevel
        }

        @discardableResult // หมายถึงไม่ให้แจ้งเตือนว่าค่าที่ถูกประกาศไม่ได้ถูกใช้
        // ถึงแม้จะอยู่ใน type เดียวกัน แต่ไม่ใช่ static
        mutating func advance(to level: Int) -> Bool {
            if LevelTracker.isUnlocked(level) {
                currentLevel = level
                return true
            } else {
                return false
            }
        }
    }


    class Player {
        var tracker = LevelTracker()
        let playerName: String
        func complete(level: Int) {
            LevelTracker.unlock(level + 1)
            tracker.advance(to: level + 1)
        }
        init(name: String) {
            playerName = name
        }
    }


    var player = Player(name: "Argyrios")
    player.complete(level: 1)
    print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")
    // Prints "highest unlocked level is now 2"


    player = Player(name: "Beto")
    if player.tracker.advance(to: 6) {
        print("player is now on level 6")
    } else {
        print("level 6 hasn't yet been unlocked")
    }
    // Prints "level 6 hasn't yet been unlocked"



*/




class Jump{
    // private static var height = 0
    static var height = 0

    class func setJump(to number: Int){
        height = number
    }
}

print(Jump.height) // 0
Jump.setJump(to: 90)
print(Jump.height) // 90
Jump.height = 120
print(Jump.height) // 120


var najJump = Jump()
//  error: static member 'height' cannot be used on instance of type 'Jump'
// print(najJump.height)



class Trick{
    private static var boolValue = false 

    class func getNotBool() -> Bool{
        let result = self.boolValue
        return !result
    }
    class func setBool(_ bool: Bool){
        self.boolValue = bool        
    }
}


print(Trick.getNotBool()) // true
Trick.setBool(true)
print(Trick.getNotBool()) // false




struct TextOptional{
    static var text: String?

    static func setText(to text: String){
        self.text = text
    }
    
    // error static member 'text' cannot be used on instance of type 'TextOptional'
    // var show: String{ 
    //     return self.text
    // }

    // error: static member 'text' cannot be used on instance of type 'TextOptional'
    // func getText() -> String{
    //     return self.text
    // }
}



print(TextOptional.text) // nil
TextOptional.setText(to: "First Optional")
print(TextOptional.text) // Optional("First Optional")


var myTypeMethodOptional = TextOptional()
print(myTypeMethodOptional) // TextOptional()
print(type(of:myTypeMethodOptional)) // TextOptional

// : error: static member 'text' cannot be used on instance of type 'TextOptional'
// print(myTypeMethodOptional.text)
// myTypeMethodOptional.setText(to: "second Optional")

TextOptional.setText(to: "second Optional")
print(TextOptional.text) // Optional("second Optional")





enum LightRoom{
    static var light = false
    static func pressSwitch(){
        self.light = !light
    }    
}

print(LightRoom.light) // false
LightRoom.pressSwitch()
print(LightRoom.light) // true



struct Budget{
    static var money: Int  = 1000{
        willSet{
            print("buy some item for \(money - newValue)")
        }
        didSet{
            if (money == 0) {
                print("dont have any money left")
            }
            print("Money amount: \(money)")
        }
    }
    static func checkBudget(_ value: Int) -> Bool{
        if value > (money * 50 / 100){
            return false
        }
        return true
    }
}



class SomeKid {
    var money = Budget()
    let name: String

    func buyToothBrush(_ price: Int){
         if Budget.checkBudget(price){
             Budget.money -= price
         }else{
             print("cant but this item")
         }
    }

    init(name: String){
        self.name = name
    }
}

struct Toothbrush{
    var _price = 400
    var price: Int{
        get{ return _price }
        set{
            self._price = newValue
        }
    }
}


var littleBoy = SomeKid(name: "Honda")

var someToothbrush = Toothbrush()
print(someToothbrush.price)
print(Budget.money) // 1000

littleBoy.buyToothBrush(someToothbrush.price)
/*
buy some item for 400
Money amount: 600
*/


print(Budget.money) // 600
littleBoy.buyToothBrush(someToothbrush.price)
print(Budget.money) // 600
print("========")





class DigitNumber{
    static func findMin(number1: Int, number2: Int) -> Int{
        if number1 < number2{
            return number1
        }else{
            return number2
        }
    }
}

var someMin = DigitNumber.findMin(number1: 9154799254, number2: 91587215)
print(someMin) // 91587215



