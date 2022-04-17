//------------------------------------------
// Protocols
//------------------------------------------

/*
มีไว้เพื่อให้รู้ว่าถ้าเรา conform protocol นี้ จะมีตัวที่กำหนดไว้ใน protocol แน่ๆ

type ใดๆ ก็ตามที่สอดคล้องกับ requirement ของ protocol(implement สิ่งที่ protocol ต้องการ)
เราจะเรียก type ดังกล่าว conform กับ protocol ที่ใช้

*/


//------------------------------------------
// Protocol Syntax
//------------------------------------------

/*
    protocol SomeProtocol {
        // protocol definition goes here
    }

    // conform to protocol กี่ตัวก็ได้
    struct SomeStructure: FirstProtocol, AnotherProtocol {
        // structure definition goes here
    }

    // กรณี class จะ inherit จาก superclass ก่อนแล้วค่อย conform to protocol
    class SomeClass: SomeSuperclass, FirstProtocol, AnotherProtocol {
        // class definition goes here
    }
*/


//------------------------------------------
// Property Requirements
//------------------------------------------

/*
เวลาจะสร้าง protocol จะต้องระบุว่า type ที่จะ conform to protocol ตัวนี้จะต้องทำอะไรบ้าง
อาจจะเป็น type property หรือ instance property ก็ได้
โดยต้องระบุชื่อและ type ของ property
type ที่จะเอาไป implement จะเอา property ไป implement แบบไหนก็ได้ ได้ทั้ง stored, compueted property
สามารถระบุได้ว่า property นั้นจะเป็นแค่ gettable หรือเป็นทั้ง get และ set


    protocol SomeProtocol {
        // จะต้องเป็น var เสมอ
        var mustBeSettable: Int { get set }
        var doesNotNeedToBeSettable: Int { get }
    }

    // กรณีเป็น type property
    protocol AnotherProtocol {
        static var someTypeProperty: Int { get set }
    }

*/

/*
    protocol FullyNamed {
        // อย่างน้อยต้อง get ได้
        var fullName: String { get }
    }

    // นำมาทำเป็น stored properties
    struct Person: FullyNamed {
        var fullName: String
    }

    let john = Person(fullName: "John Appleseed")
    // john.fullName is "John Appleseed"

    class Starship: FullyNamed {
        var prefix: String?
        var name: String
        init(name: String, prefix: String? = nil) {
            self.name = name
            self.prefix = prefix
        }
        var fullName: String {
            return (prefix != nil ? prefix! + " " : "") + name
        }
    }
    var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
    // ncc1701.fullName is "USS Enterprise"

*/




protocol NameGetSetProtocol{
    var name: String { get set }
}

class Machine{
    var price: Int
    
    init(price: Int){
        self.price = price
    }
}

class Airconditioner: Machine, NameGetSetProtocol{
    var name: String

    init(){
        self.name = "[unset]"

        super.init(price: 10_000)
    }
    func show(){
        print("name", name, "price", price)
    }
}

let carrierAir = Airconditioner()
carrierAir.name = "Carrier"
carrierAir.show() // name Carrier price 10000


protocol DefaultInitProtocol{
    init()
}

class Storage: Machine, DefaultInitProtocol{

    required convenience init(){
        self.init(price: 2_500)
    }
    override init(price: Int){
        super.init(price: price)
    }
}

let someHDD = Storage()
print(someHDD.price) // 2500

let anotherHDD = Storage(price: 2_600)
print(anotherHDD.price) // 2600






protocol StaticSomeGetsomeSetGet{
    static var getVar: Int { get }
    static var setGetVar: Int { set get }
}


struct StaticStructSomeGetsomeSetGet: StaticSomeGetsomeSetGet{
    static var getVar: Int = 10
    static var setGetVar: Int = 22
}

print(StaticStructSomeGetsomeSetGet.getVar) // 10
print(StaticStructSomeGetsomeSetGet.setGetVar) // 22
StaticStructSomeGetsomeSetGet.getVar = 11
StaticStructSomeGetsomeSetGet.setGetVar = 23
print(StaticStructSomeGetsomeSetGet.getVar) // 11
print(StaticStructSomeGetsomeSetGet.setGetVar) // 23



protocol SomeGetsomeSetGet{
    var getVar: Int { get }
    var setGetVar: Int { set get }
}

struct StructForsomeGetsomeSetGet: SomeGetsomeSetGet{
    // set get to stored
    var setGetVar: Int

    // get to computed
    var getVar: Int{
        return setGetVar
    }
}

var someStructForsomeGetsomeSetGet = StructForsomeGetsomeSetGet(setGetVar: 123)
print(someStructForsomeGetsomeSetGet.getVar) // 123
someStructForsomeGetsomeSetGet.setGetVar = 456 
print(someStructForsomeGetsomeSetGet.getVar) // 456


class ClassForsomeGetsomeSetGet: SomeGetsomeSetGet{
    // let setGetVar: Int // *error*

    // all is stored property
    var setGetVar: Int
    var getVar: Int
    
    init(){
        setGetVar = 111
        getVar = 222
    }
}

var instanceClassForsomeGetsomeSetGet = ClassForsomeGetsomeSetGet()
print(instanceClassForsomeGetsomeSetGet.setGetVar) // 111
print(instanceClassForsomeGetsomeSetGet.getVar) // 222

instanceClassForsomeGetsomeSetGet.setGetVar = 333
instanceClassForsomeGetsomeSetGet.getVar = 444
print(instanceClassForsomeGetsomeSetGet.setGetVar) // 333
print(instanceClassForsomeGetsomeSetGet.getVar) // 444




protocol UserProfileVariable{
    var name: String? { get set }
    var email: String { get }
    var username: String { get set }
    // let password: String { get set } // *error*
    var password: String { get set }
}

struct NocMember: UserProfileVariable{
    var name: String?
    var email: String
    var username: String
    var password: String

    init(email: String, username: String, password: String, name: String? = nil){
        self.email = email
        self.username = username
        self.password = password
        self.name = name
    }

    func show(){
        if (name == nil){
            print("name is unset")
            print("email", email, "username", username)
        }else{
            print("name", name!, "email", email, "username", username)
        }
    }
}

var someNocMember = NocMember(email: "email@gmail.com", username: "someNoc", password: "1234")
someNocMember.show()
/*
name is unset
email email@gmail.com username someNoc
*/

var anotherNocMember = NocMember(email: "selfEmail@gmail.com", username: "anotherNoc", password: "1234", name: "New name")
anotherNocMember.show()
// name New name email selfEmail@gmail.com username anotherNoc




//------------------------------------------
// Method Requirements
//------------------------------------------

/*
    protocol SomeProtocol {
        static func someTypeMethod()
    }

ไม่ควรใส่ default

    protocol RandomNumberGenerator {
        func random() -> Double
    }


adopt RandomNumberGenerator 
    class LinearCongruentialGenerator: RandomNumberGenerator {
        var lastRandom = 42.0
        let m = 139968.0
        let a = 3877.0
        let c = 29573.0
        func random() -> Double {
            lastRandom = ((lastRandom * a + c)
                .truncatingRemainder(dividingBy:m))
            return lastRandom / m
        }
    }
    let generator = LinearCongruentialGenerator()
    print("Here's a random number: \(generator.random())")
    // Prints "Here's a random number: 0.3746499199817101"
    print("And another one: \(generator.random())")
    // Prints "And another one: 0.729023776863283"

*/



protocol Text{
    var message: String{ get }

    func sendMessage() -> String
}

class Message: Text{
    var message: String

    init(text: String){
        self.message = text
    }
    func sendMessage() -> String{
        return self.message
    }
}

let helloMessage = Message(text: "Hello")
print(helloMessage.sendMessage()) // Hello

struct SnapChat: Text{
    var message: String
    
    func sendMessage() -> String{
        return message
    }
}

let helloFromSnapChat = SnapChat(message: "Hello")
print(helloFromSnapChat.sendMessage()) // Hello

enum EnumMessage: String, Text{
    case send, notSend
    var message: String{
        switch self{
            case .send:
                return self.rawValue
            default:
                return self.rawValue
        }
    }

    func sendMessage() -> String{
        switch self{
            case .send:
                return message
            default:
                return "[No Message]"
        }
    }
}

let helloFromEnumMessage = EnumMessage.notSend
print(helloFromEnumMessage.message) // notSend
print(helloFromEnumMessage.sendMessage()) // [No Message]



protocol StaticProfile{
    // static var name: String = 10 // *error*
    static var name: String { get }
    static var age: Int { get }

    static func getProfile() -> String
}

class StaticProfileClass: StaticProfile{
    static var name: String = "[unset]"
    static var age: Int = 1

    static func getProfile() -> String{
        return "name: \(self.name), age: \(self.age)"
    }
}

print(StaticProfileClass.name) // [unset]
StaticProfileClass.name = "Static Class"
print(StaticProfileClass.name) // Static Class
print(StaticProfileClass.getProfile()) // name: Static Class, age: 1



//------------------------------------------
// Mutating Method Requirements
//------------------------------------------

/*
กรณีเป็น value type ถึงต้องใส่ mutating
ถ้าเป็น reference type ไม่ต้องใส่

    protocol Togglable {
        mutating func toggle()
    }


    enum OnOffSwitch: Togglable {
        case off, on
        mutating func toggle() {
            switch self {
            case .off:
                self = .on
            case .on:
                self = .off
            }
        }
    }
    var lightSwitch = OnOffSwitch.off
    lightSwitch.toggle()
    // lightSwitch is now equal to .on


*/

protocol StaticFunction{
    // static mutating func add() // error: static functions must not be declared mutating
    static func plusOne()
}

class StaticAddOneItem: StaticFunction{
    static var value: Int = 0
    
    class func plusOne(){
        self.value += 1
    }
}

print(StaticAddOneItem.value) // 0
StaticAddOneItem.plusOne()
print(StaticAddOneItem.value) // 1



protocol Driving{
    var speed: Int { get set }
    mutating func pressDrive()
    mutating func pressBreak()
}

struct CarDriving: Driving{
    private var _speed: Int = 10
    var speed: Int{
        get{
            return _speed
        }
        set{
            if (newValue < 0){
                _speed = 0
            }else{
                self._speed = newValue
            }
        }
    }

    mutating func pressDrive(){
        self.speed += 10
    }
    mutating func pressBreak(){
        guard self.speed >= 10 else { return }
        self.speed -= 10
    }
}

var appleCar = CarDriving()
appleCar.speed = 100
print(appleCar.speed) // 100
appleCar.pressDrive()
appleCar.pressDrive()
print(appleCar.speed) // 120
appleCar.pressBreak()
print(appleCar.speed) // 110


enum EnumDriving: Int, Driving{
    case drive = 10
    case stop = 0

    var speed: Int{
        get{
            return self.rawValue
        }
        set {}
    }
    
    mutating func pressDrive(){
        self = .drive
    }
    mutating func pressBreak(){
        self = .stop
    }
}

var instanceEnumDriving = EnumDriving.stop
print(instanceEnumDriving.speed) // 0
instanceEnumDriving.pressDrive()
print(instanceEnumDriving.speed) // 10





protocol ChangablePrice{
    var price: Int { set get }
    mutating func changePrice(to: Int)
    
}

struct GasChangablePrice: ChangablePrice{
    var price: Int

    mutating func changePrice(to price: Int){
        self.price = price
    }
}

var someGasChangablePrice = GasChangablePrice(price: -50)
print(someGasChangablePrice.price) // -50
someGasChangablePrice.changePrice(to: 50)
print(someGasChangablePrice.price) // 50


class FruitChangablePrice: ChangablePrice{
    var price: Int = 100
    func changePrice(to value: Int){
        self.price = value
    }
}

var watermelonFruitChangablePrice = FruitChangablePrice()
print(watermelonFruitChangablePrice.price) // 100
watermelonFruitChangablePrice.changePrice(to: 250)
print(watermelonFruitChangablePrice.price) // 250

class SubclassOfFruitChangablePrice: FruitChangablePrice{
    override var price: Int{
        get{
            return super.price
        }
        set{
            super.price = newValue
        }
    }
}

var newWatermelon = SubclassOfFruitChangablePrice()
print(newWatermelon.price) // 100
newWatermelon.price = 300
print(newWatermelon.price) // 300






//------------------------------------------
// Initializer Requirements
//------------------------------------------

/*
ใครอยาก adopt protocol ตัวนี้ต้องสร้าง init ตัวนี้
    protocol SomeProtocol {
        init(someParameter: Int) // ไม่มีปีกกา
    }

    class SomeClass: SomeProtocol {
            // ใส่ required เพื่อให้รู้ว่าต้อง implement init ตัวนี้ด้วย
            // ยกเว้นกรณี class เป็น final ก็ไม่จำเป็นต้องใส่ก็ได้
            // แต่ protocol ไม่ได้ระบุว่าต้องเอามาสร้างเป็น init แบบ designated หรือ convenience ก็ได้
            // แต่ไม่ว่าจะเป็นแบบไหนก็ต้องใส่ required ไว้ข้างหน้า
        required init(someParameter: Int) {

            // initializer implementation goes here
        }
    }

    protocol SomeProtocol {
        init()
    }

    class SomeSuperClass {
        init() {
            // initializer implementation goes here
        }
    }

    class SomeSubClass: SomeSuperClass, SomeProtocol {
        // "required" from SomeProtocol conformance; "override" from SomeSuperClass
        required override init() {
            // initializer implementation goes here
        }
    }

*/

protocol InitOneIntParameter{
    init(value: Int)
}

class Wheel: InitOneIntParameter{
    var wheels: Int

    init(){
        self.wheels = 0
    }

    // required init(wheels: Int){ // *error*
    required convenience init(value wheels: Int){ // *error*
        self.init()
        // phase 2
        self.wheels = wheels
    }
}

class Jeep: Wheel{
    var price: Int

    override init(){
        self.price = 0
        super.init()
    }

    init(value wheels: Int, price: Int){
        self.price = price
        super.init()
        self.wheels = wheels
    }
}

let someJeep = Jeep(value: 6)
print(someJeep.wheels) // 6
print(someJeep.price) // 0

var anotherJeep = Jeep(value: 9, price: 20)
print(anotherJeep.wheels) // 9
print(anotherJeep.price) // 20


class Truck: Wheel{
    var price: Int

    override init(){
        self.price = 0
        super.init()
    }

    required init(value wheels: Int){
        self.price = wheels * 2
        
        super.init()
        self.wheels = wheels
    }
}

let someTruck = Truck(value: 3)
print(someTruck.wheels) // 3
print(someTruck.price) // 6



//------------------------------------------
// Failable Initializer Requirements
//------------------------------------------

/*
ถ้าเกิด requirement เป็น failable 
type ที่มา adopt protocol สามารถสร้าง init ที่เป็น failable หรือ non-failable ก็ได้

แต่ถ้า protocol ระบุเป็น non-failable init
ตัว type adopt จะต้องสร้างเป็น non-faiable หรือ failable ที่เป็น implicitly unwrapped failable init

*/


protocol FailableDefaultInitProtocol{
    init?()
}


// protocol init? -> init?
class MonsterFailable: FailableDefaultInitProtocol{
    var name: String?

    required init?(){
        self.name = "[some text]"
    }
}

// inherit
// protocol init? -> init? -> init!
class Skeleton: MonsterFailable{
    var species: String

    required init!(){
        self.species = "Skeletion"

        super.init()
        self.name = "Skel-Head"
    }
}

let someSkeleton = Skeleton()
print(someSkeleton?.name) // Optional("Skel-Head")
print(someSkeleton!.species) // Skeletion


// inherit subclass
// protocol init? -> init? -> init! -> init?
class SubSkeletonFailable: Skeleton{
    var color: String
    
    // required init!(){
    required init?(){
        self.color = "White"

        super.init()
    }
}

let someSubSkeleton = SubSkeletonFailable()
print(someSubSkeleton?.name) // Optional("Skel-Head")
print(someSubSkeleton?.species) // Optional("Skeletion")
print(someSubSkeleton?.color) // Optional("White")


// inherit subclass
// protocol init? -> init? -> init! -> init? -> init
final class SkeletonBone: SubSkeletonFailable{
    var action: String

    required init(){
        self.action = "Walk"

        super.init()! // << force-unwrapped
        self.name = "failable"
        self.color = "Orange"
    }
}

let someSkeletonBone = SkeletonBone()
print(someSkeletonBone.name) // Optional("failable")
print(someSkeletonBone.species) // Skeletion
print(someSkeletonBone.color) // Orange
print(someSkeletonBone.action) // Walk


// inherit subclass
// protocol init? -> init? -> init! -> init?
final class SubSkeletonNonfailable: Skeleton{
    var color: String
    
    required init(){
        self.color = "Black"

        super.init()
    }
}

let someSubSkeletonNonfailable = SubSkeletonNonfailable()
print(someSubSkeletonNonfailable.name) // Optional("Skel-Head")
print(someSubSkeletonNonfailable.species) // Skeletion
print(someSubSkeletonNonfailable.color) // Black




// ============================================

// protocol init? -> init!
class MonsterImplicitly: FailableDefaultInitProtocol{
    var name: String?

    required init!(){
        self.name = "Monster!"
    }
}

// inherit
// protocol init? -> init! -> init/init?/init!
class AngleSubclassFromImplicitly: MonsterImplicitly{
    var species: String

              // ได้ทั้ง non-failable / failable
    // required init?(){
    // required init!(){
    required init(){
        self.species = "Angle Non-failable"

        super.init()
        self.name = "implicitly"
    }
}

let someAngleFromImplicitly = AngleSubclassFromImplicitly()
print(someAngleFromImplicitly.name) // Optional("implicitly")
print(someAngleFromImplicitly.species) // Angle Non-failable



// ============================================

// protocol init? -> init
class MonsterNonFailable: FailableDefaultInitProtocol{
    var name: String

    required init(){
        self.name = "[Monster name]"
    }
}

// inherit
// protocol init? -> init -> init
class WildMonster: MonsterNonFailable{
    var species: String?

    required init(){
        self.species = nil
        
        super.init()
    }
}

let someWildMonster = WildMonster()
print(someWildMonster.name) // [Monster name]
someWildMonster.species = "Wild Monster"
print(someWildMonster.species) // Optional("Wild Monster")



// inherit
// protocol init? -> init -> init?
/*/
class WildMonsterFailable: MonsterNonFailable{
   var species: String?


// error: failable initializer 'init()' cannot override a non-failable initializer
   required init?(){
       self.species = "[Failable Init]"

       super.init()
    //    self.name = nil
   }
}
*/



// ============================================

protocol NonFailableDefaultInitProtocol{
    init()
}

// protocol init -> init!
class AnimalImplicitly: NonFailableDefaultInitProtocol{
    var name: String

    required init!(){
        self.name = "[implicitly]"
    }
}

// inherit
// protocol init -> init! -> init?/init!/init
final class MonkeyFailableSubClass: AnimalImplicitly{
    var color: String

                // ได้ทั้ง non-failable / failable
    // required init!(){
    required init?(){
    // required init(){
        self.color = "Yellow"

        super.init()
        self.name = "implicitly to failable"
    }
}

let someMonkey = MonkeyFailableSubClass()
print(someMonkey?.name) // Optional("implicitly to failable")
print(someMonkey?.color) // Optional("Yellow")


// ============================================

// protocol init -> init
class AnimalNonFailable: NonFailableDefaultInitProtocol{
    var name: String

    required init(){
        self.name = "[Non-failble]"
    }
}





//------------------------------------------
// Protocols as Types
//------------------------------------------

/*
ใช้ protocol เหมือนกับเป็น type ตัวนึงได้ ทำเป็น type ของ parateter/return type ให้กับ function, method, init
เป็น type ของตัวแปรต่างๆ constant, variable, property
เป็น type เก็บสิ่งของเช่น array, dictionary ได้
*/

/*
    class Dice {
        let sides: Int
        let generator: RandomNumberGenerator
        init(sides: Int, generator: RandomNumberGenerator) {
            self.sides = sides
            self.generator = generator
        }
        func roll() -> Int {
            return Int(generator.random() * Double(sides)) + 1
        }
    }

// สามารถเปลี่ยน generator เป็นสูตรการคำนวณ random สูตรอื่นได้ แต่ต้องเป็น RandomNumberGenerator
    var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
    for _ in 1...5 {
        print("Random dice roll is \(d6.roll())")
    }
    // Random dice roll is 3
    // Random dice roll is 5
    // Random dice roll is 4
    // Random dice roll is 5
    // Random dice roll is 4


*/



protocol Rectangle{
    var width: Double { set get}
    var length: Double { set get}
    var height: Double { set get}

    init(width: Double, length: Double, height: Double)
    func calculateVolume() -> Double
}

class Box: Rectangle{
    var width: Double
    var length: Double
    var height: Double

    required init(width: Double, length: Double, height: Double){
        self.width = width
        self.length = length
        self.height = height
    }
    func calculateVolume() -> Double{
        return (width * length * height)
    }
}

func getVolume(rectangle: Rectangle) -> Double{
    return rectangle.calculateVolume()
}

func updateRectangle(rectangle: Rectangle) -> Rectangle{
    var newRectangle = rectangle
    newRectangle.width += 10
    newRectangle.length += 10
    newRectangle.height += 10

    return newRectangle
}

var rectangleArray = [Rectangle]()
var newBox = Box(width: 10, length: 10, height: 10)

rectangleArray.append(newBox)

print(getVolume(rectangle: rectangleArray[0])) // 1000

updateRectangle(rectangle: newBox)
print(getVolume(rectangle: rectangleArray[0])) // 8000




//------------------------------------------
// Delegation
//------------------------------------------


/*
    protocol DiceGame {
        var dice: Dice { get }
        func play()
    }
    protocol DiceGameDelegate: AnyObject {
        func gameDidStart(_ game: DiceGame)
        func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
        func gameDidEnd(_ game: DiceGame)
    }

    class SnakesAndLadders: DiceGame {
        let finalSquare = 25
        let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
        var square = 0
        var board: [Int]
        init() {
            board = Array(repeating: 0, count: finalSquare + 1)
            board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
            board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
        }
        // stored properties ของ DiceGameDelegate
        weak var delegate: DiceGameDelegate?
        func play() {
            square = 0
            delegate?.gameDidStart(self)
            gameLoop: while square != finalSquare {
                let diceRoll = dice.roll()
                delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
                switch square + diceRoll {
                case finalSquare:
                    break gameLoop
                case let newSquare where newSquare > finalSquare:
                    continue gameLoop
                default:
                    square += diceRoll
                    square += board[square]
                }
            }
            delegate?.gameDidEnd(self)
        }
    }



    class DiceGameTracker: DiceGameDelegate {
        var numberOfTurns = 0
        func gameDidStart(_ game: DiceGame) {
            numberOfTurns = 0
            if game is SnakesAndLadders {
                print("Started a new game of Snakes and Ladders")
            }
            print("The game is using a \(game.dice.sides)-sided dice")
        }
        func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
            numberOfTurns += 1
            print("Rolled a \(diceRoll)")
        }
        func gameDidEnd(_ game: DiceGame) {
            print("The game lasted for \(numberOfTurns) turns")
        }
    }


 how DiceGameTracker looks in action:

    let tracker = DiceGameTracker()
    let game = SnakesAndLadders()
    game.delegate = tracker
    game.play()
    // Started a new game of Snakes and Ladders
    // The game is using a 6-sided dice
    // Rolled a 3
    // Rolled a 5
    // Rolled a 4
    // Rolled a 5
    // The game lasted for 4 turns


*/


protocol RandomRockPaperScissor{
    func random() -> String
}

class MyRandomRockPaperScissor: RandomRockPaperScissor{
    var lastNumber = 0
    var firstRandom = 6.5
    var secondRandom = 2.35
    var symbol: [Symbol] = [.rock, .paper, .scissor]

    enum Symbol: String{
        case rock, paper, scissor

        func getValue() -> String{
            switch self{
                case .rock:
                    return self.rawValue
                case .paper:
                    return self.rawValue
                case .scissor:
                    return self.rawValue
            }
        }
    }
    
    func random() -> String{
        firstRandom += 3.4
        secondRandom += 16.3
        lastNumber = Int((firstRandom * secondRandom).truncatingRemainder(dividingBy: 3))
        return symbol[lastNumber].getValue()
    }
}

/*
let someRandom = MyRandomRockPaperScissor()
print(someRandom.random()) // paper
print(someRandom.random()) // scissor
print(someRandom.random()) // rock
print(someRandom.random()) // paper
print(someRandom.random()) // scissor
*/


protocol PlayerLevel{
    var level: Int { set get }

    mutating func levelUp()
}

protocol PlayerProfile: PlayerLevel{
    var name: String { set get }
    var lifepoint: Int { set get }

    mutating func updateName(to name: String)
}


class Player: PlayerProfile{
    var name: String
    var lifepoint: Int
    var hand: RandomRockPaperScissor
    var level: Int

    init(name: String, hand: RandomRockPaperScissor){
        self.name = name
        self.lifepoint = 5
        self.level = 1
        self.hand = hand
    }

    func updateName(to name: String){
        self.name = name
    }

    func levelUp(){
        self.level += 1
    }

    func getHand() -> String{
        return hand.random()
    }

}

let someDeck = MyRandomRockPaperScissor()
let someplayer = Player(name: "john", hand: someDeck)
print(someplayer.getHand())


protocol Battle{
    func battle(player1: Player, player2: Player)

}

protocol WinCondition{
    func whoWin(p1: String, p2: String) -> Bool
}

// let someRandom = MyRandomRockPaperScissor()
// let win = RockPaperScissorWinCondition()

// let p1 = someRandom.random()
// let p2 = someRandom.random()
// print("p1", p1, "p2", p2)
// print(win.whoWin(p1: p1,p2: p2))

class RockPaperScissorGame: Battle, WinCondition{
    let maxRound: Int

    init(round: Int = 3){
        self.maxRound = round
    }

    func battle(player1: Player, player2: Player){
        print("Player 1: \(player1.name) has come!")
        print("Player 2: \(player2.name) has come!")
        print("let's play Rock Payer Scissor!\n")

        for _ in 0...maxRound{
            let p1Hand = player1.getHand()
            let p2Hand = player2.getHand()
            print("Player 1 Hand: \(p1Hand)")
            print("Player 2 Hand: \(p2Hand)")
            
            
            if whoWin(p1: p1Hand, p2: p2Hand){
                print("Player 1: \(player1.name) Win!")
                player1.levelUp()
                player2.lifepoint -= 1
            }else{
                print("Player 2: \(player2.name) Win!")
                player2.levelUp()
                player1.lifepoint -= 1
            }
        }
    }

    func whoWin(p1: String, p2: String) -> Bool{
        switch (p1, p2){
            case (p1, p2) where p1 == p2:
                return false
            case ("rock", "scissor"):
                return true
            case ("paper", "rock"):
                return true
            case ("scissor", "paper"):
                return true
            default:
                return false
        }
    }

}

let rockPaperScissorDeck = MyRandomRockPaperScissor()
var obiwan = Player(name: "Obiwan", hand: rockPaperScissorDeck)
var anakin = Player(name: "Anakin", hand: rockPaperScissorDeck)

print(obiwan.name) // Obiwan
print(anakin.name) // Anakin

let someRockPaperScissorGame = RockPaperScissorGame()

someRockPaperScissorGame.battle(player1: obiwan, player2: anakin)
/*
Player 1: Obiwan has come!
Player 2: Anakin has come!
let's play Rock Payer Scissor!

Player 1 Hand: paper
Player 2 Hand: scissor
Player 2: Anakin Win!
Player 1 Hand: rock
Player 2 Hand: paper
Player 2: Anakin Win!
Player 1 Hand: scissor
Player 2 Hand: rock
Player 2: Anakin Win!
Player 1 Hand: rock
Player 2 Hand: rock
Player 2: Anakin Win!
*/



//------------------------------------------
// Adding Protocol Conformance with an Extension
//------------------------------------------

/*
    protocol TextRepresentable {
        var textualDescription: String { get }
    }
    extension Dice: TextRepresentable {
        var textualDescription: String {
            return "A \(sides)-sided dice"
        }
    }
    let d12 = Dice(sides: 12, generator: LinearCongruentialGenerator())
    print(d12.textualDescription)
    // Prints "A 12-sided dice"

    extension SnakesAndLadders: TextRepresentable {
        var textualDescription: String {
            return "A game of Snakes and Ladders with \(finalSquare) squares"
        }
    }
    print(game.textualDescription)
    // Prints "A game of Snakes and Ladders with 25 squares"


*/

protocol SpellProtocol{
    func spell() -> String
}

class Spell: SpellProtocol{
    var spellSet: [String]
    var nextSpell: Int
    
    init(name: [String]){
        self.spellSet = name
        self.nextSpell = 0
    }

    func spell() -> String{
        if (nextSpell >= spellSet.count){
            self.nextSpell = 0
            return spellSet[nextSpell]
        }else{
            self.nextSpell += 1
            return spellSet[nextSpell - 1]
        }
    }
}

let playerSpell = Spell(name: ["Fireball", "Waterball", "Thunder"])
print(playerSpell.spell()) // Fireball
print(playerSpell.spell()) // Waterball
print(playerSpell.spell()) // Thunder
print(playerSpell.spell()) // Fireball

class Wizard{
    var name: String
    var mySpell : SpellProtocol
    
    init(name: String, spell: SpellProtocol){
        self.name = name
        self.mySpell = spell
    }
}

let gordon = Wizard(name: "Gorgon", spell: playerSpell)
print(gordon.mySpell.spell()) // Fireball
print(gordon.mySpell.spell()) // Waterball



protocol SayName{
    var sayName: String { get }
}

extension Wizard: SayName{
    var sayName: String{
        return name
    }
}

print(gordon.sayName) // Gordon
let gran = Wizard(name: "Gran", spell: Spell(name: ["Lighting", "Phantom Pain"]))
print(gran.mySpell.spell()) // Lighting
print(gran.sayName) // Gran

protocol SaySpell{
   var saySpell: String { get }
}
extension Spell: SaySpell{
    var saySpell: String{
        return spell()
    }
}

print(playerSpell.saySpell) // Thunder




//------------------------------------------
// Conditionally Conforming to a Protocol
//------------------------------------------

/*
    extension Array: TextRepresentable where Element: TextRepresentable {
        var textualDescription: String {
            let itemsAsText = self.map { $0.textualDescription }
            return "[" + itemsAsText.joined(separator: ", ") + "]"
        }
    }
    let myDice = [d6, d12]
    print(myDice.textualDescription)
    // Prints "[A 6-sided dice, A 12-sided dice]"

*/


extension Array: SayName where Element: SayName{
    var sayName: String{
        let theyNameAsString = self.map{ $0.sayName.uppercased() }
        return "This group we have " + theyNameAsString.joined(separator:", ")
    }
}

var peopleWhoNeedToSayTheyName = [gran, gordon]
// array สามารถใช้ computed properties sayName ได้เหมือนตัว instance แล้ว
print(peopleWhoNeedToSayTheyName.sayName) // This group we have GRAN, GORGON



//------------------------------------------
// Declaring Protocol Adoption with an Extension
//------------------------------------------

/*
    struct Hamster {
        var name: String
        var textualDescription: String {
            return "A hamster named \(name)"
        }
    }
    extension Hamster: TextRepresentable {}

    let simonTheHamster = Hamster(name: "Simon")
    let somethingTextRepresentable: TextRepresentable = simonTheHamster
    print(somethingTextRepresentable.textualDescription)
    // Prints "A hamster named Simon"

*/

protocol MoneyProtocol{
    var money: Int { get }
}

class Harddisk: MoneyProtocol{
    var _money: Int = 0
    var money: Int{
        return _money
    }
    init(){ }
    init(money: Int){
        self._money = money
    }
}

class SmartPhone{
    var brand: String = "[unset]"
    var money: Int{
        return 650
    }
}

var someHarddisk = Harddisk()

var someSmartPhone = SmartPhone()

extension SmartPhone: MoneyProtocol {}

extension Array: MoneyProtocol where Element: MoneyProtocol{
    var money: Int{
        var result: Int = 0
        // let listOfArray = self.map{ $0.money }
        for item in self{
            result += item.money
        }
        return result
    }
}


let listOfSomeHarddisk: MoneyProtocol = [someHarddisk, Harddisk(money: 300), Harddisk(money: 650)]
print(listOfSomeHarddisk.money) // 950

let newSmartPhone: MoneyProtocol = someSmartPhone
print(newSmartPhone.money) // 650


//------------------------------------------
// Adopting a Protocol Using a Synthesized Implementation
//------------------------------------------

/*
ถ้าเงื่อนไขตรงกับที่ swift กำหนด จะ synthesize อัตโนมัติโดยไม่ต้อง implement
Equatable == !=

1. type เป็น struct และมีเพียงแค่ stored properties ที่ conform to Equatable อยู่แล้ว
2. enum มี associated types ที่ conform to Equatable อยู่แล้ว
3. enum ที่ไม่มี associated types
*/

/*
    struct Vector3D: Equatable {
        var x = 0.0, y = 0.0, z = 0.0
    }

    let twoThreeFour = Vector3D(x: 2.0, y: 3.0, z: 4.0)
    let anotherTwoThreeFour = Vector3D(x: 2.0, y: 3.0, z: 4.0)
    if twoThreeFour == anotherTwoThreeFour {
        print("These two vectors are also equivalent.")
    }
    // Prints "These two vectors are also equivalent."

*/

/*
Hashable
hash(into:)
เช่น สิ่งที่เก็บอยู่ใน set และ key ของ dictionary ต้องเป็น hashable ถึงจะเก็บค่าได้
ถ้าอยากสร้าง types ให้ conform to Hashable

1. type เป็น struct และมีเพียงแค่ stored properties ที่ conform to Equatable อยู่แล้ว
2. enum มี associated types ที่ conform to Equatable อยู่แล้ว
3. enum ที่ไม่มี associated types
*/

/*

struct RectangleStruct: Equatable, Hashable{
    // only stored properties
    var width: Int
    var length: Int

    init(width: Int, length: Int){
        self.width = width
        self.length = length
    }
}

let rectangleArrayInstance = [
                    RectangleStruct(width: 1, length: 2),
                    RectangleStruct(width: 3, length: 4),
                    RectangleStruct(width: 6, length: 6),
                    ]
let compareRectangle = RectangleStruct(width:6 , length: 4)
let anotherCompareRectangle = RectangleStruct(width:6 , length: 6)

for rectangle in rectangleArrayInstance{
    if (compareRectangle == rectangle){
        print("we found your compareRectangle in our Rectangle width:\(rectangle.width), length:\(rectangle.length)")
    }else if (anotherCompareRectangle == rectangle){
        print("we found your anotherCompareRectangle in our Rectangle width:\(rectangle.width), length:\(rectangle.length)")
    }else{
        print("width:\(rectangle.width), length:\(rectangle.length) not match on this iterator")
    }
}

/*
width:1, length:2 not match on this iterator
width:3, length:4 not match on this iterator
we found your anotherCompareRectangle in our Rectangle width:6, length:6
*/


let rectangleArraySet: Set = [
                    RectangleStruct(width: 1, length: 2),
                    RectangleStruct(width: 3, length: 4),
                    RectangleStruct(width: 6, length: 6),
                    ]

print(type(of:rectangleArraySet)) // Set<RectangleStruct>

let instanceForRectangleSet = RectangleStruct(width: 3, length: 4)

if rectangleArraySet.contains(instanceForRectangleSet){
    print("found width:\(instanceForRectangleSet.width), lenth:\(instanceForRectangleSet.length) match with some instance")
}else{
    print("dont found width:\(instanceForRectangleSet.width), lenth:\(instanceForRectangleSet.length)")
}
// found width:3, lenth:4 match with some instance


// ไม่ synthesize Equatable, Hashable 
struct RectangleClass{
    // only stored properties แต่ไม่ comform to protocol Equatable, Hashable 
    var width: Int 
    var length: Int

    init(width: Int, length: Int){
        self.width = width
        self.length = length
    }
}

let rectangleArrayForClass = [
                    RectangleClass(width: 1, length: 2),
                    RectangleClass(width: 3, length: 4),
                    RectangleClass(width: 6, length: 6),
                    ]
let compareRectangleForClass = RectangleClass(width:6 , length: 6)

/*
error: binary operator '==' cannot be applied to operands of type 'RectangleStruct' and 'RectangleClass'
print(rectangleArrayForClass[2] == compareRectangleForClass)
*/

// ทำให้ conform to Equatable
extension RectangleClass: Equatable{
    static func ==(firstRect: RectangleClass, SecondRect: RectangleClass) -> Bool{
        return (firstRect.width == SecondRect.width) && (firstRect.length == SecondRect.length)
    }
}

print(rectangleArrayForClass[2] == compareRectangleForClass) // true

for rectangle in rectangleArrayForClass{
    if (compareRectangleForClass == rectangle){
        print("we found your compareRectangleForClass in our Rectangle width:\(rectangle.width), length:\(rectangle.length)")
    }else if (compareRectangleForClass == rectangle){
        print("we found your anotherCompareRectangle in our Rectangle width:\(rectangle.width), length:\(rectangle.length)")
    }else{
        print("width:\(rectangle.width), length:\(rectangle.length) not match on this iterator")
    }
}
*/

/*
width:1, length:2 not match on this iterator
width:3, length:4 not match on this iterator
we found your compareRectangleForClass in our Rectangle width:6, length:6
*/



/*
class Ipad: Hashable{
    var serialNumber: Int
    var name: String
    var hashValue: Int{
        return serialNumber.hashValue
    }

    init(serialNumber: Int, name: String){
        self.serialNumber = serialNumber
        self.name = name
    }

    func hash(into hash: inout Hasher) {
        hash.combine(serialNumber)
    }
    static func ==(first: Ipad, second: Ipad) -> Bool{
        return first.serialNumber == second.serialNumber
    }
}

let firstIpad = Ipad(serialNumber: 123, name: "Ipad1")
let secondIpad = Ipad(serialNumber: 123, name: "Ipad2")

print(firstIpad == secondIpad) // true

*/



/*
Comparable 
<=, >, >=
จะ synthesize ในกรณีที่ enum ไม่มี rawValue
ถ้า enum มี associated types ก็ต้อง conform to Comparable protocol
*/

/*

    enum SkillLevel: Comparable {
        case beginner
        case intermediate
        case expert(stars: Int)
    }
    var levels = [SkillLevel.intermediate, SkillLevel.beginner,
                  SkillLevel.expert(stars: 5), SkillLevel.expert(stars: 3)]
    for level in levels.sorted() {
        print(level)
    }
    // Prints "beginner"
    // Prints "intermediate"
    // Prints "expert(stars: 3)"
    // Prints "expert(stars: 5)"

*/


/*
struct NewIpad{
    // only stored properties แต่ไม่ comform to Compareable
    let year: Int
    let month: Int
    var price: Int
}

let newerIpad = NewIpad(year: 1999,month: 12, price: 1999)
let olderIpad = NewIpad(year: 1999,month: 1, price: 10)

// error: binary operator '>' cannot be applied to two 'NewIpad' operands
// print(instanceForNewIpad > anotherInstanceForNewIpad)


extension NewIpad: Comparable{
    static func < (first: NewIpad, second: NewIpad) -> Bool{
        if (first.year != second.year){
            return first.year < second.year
        }else if (first.month != second.month){
            return first.month < second.month
        }else{
            return false
        }
    }

    static func > (first: NewIpad, second: NewIpad) -> Bool{
        if (first.year != second.year){
            return first.year > second.year
        }else if (first.month != second.month){
            return first.month > second.month
        }else{
            return false
        }
    }
}

print(newerIpad > olderIpad) // true
print(newerIpad < olderIpad) // false

*/

//------------------------------------------
// Collections of Protocol Types
//------------------------------------------

/*
    let things: [TextRepresentable] = [game, d12, simonTheHamster]
    
    for thing in things {
        print(thing.textualDescription)
    }
    // A game of Snakes and Ladders with 25 squares
    // A 12-sided dice
    // A hamster named Simon

*/


let listOfSomeElectronic: [MoneyProtocol]  = [someHarddisk, someSmartPhone, Harddisk(money: 500), SmartPhone()]

for item in listOfSomeElectronic{
    print(item.money)
}
/*
0
650
500
650
*/

//------------------------------------------
// Protocol Inheritance
//------------------------------------------

/*
protocol Product {
    var weight: Int { get }
}

extension Harddisk: Product{
    struct CollectData{
        static var _weight: Int = 1
    }
    var weight: Int{
        get{
            return CollectData._weight
        }
        set{
            CollectData._weight = newValue
        }
    }
}

protocol Ram: Product {
    var memory: Int { get set }
}

extension SmartPhone: Ram{
    struct CollectData{
        static var _memory: Int = 1
    }
    var memory: Int{
        get { return CollectData._memory }
        set{
            CollectData._memory = newValue
        }
    }
    var weight: Int{
        return 100
    }

}

// extension computed properties เสมือนมี stored properties 
someHarddisk.weight = 50
print(someHarddisk.weight) //50

someSmartPhone.memory = 6
print(someSmartPhone.memory) // 6
*/


//------------------------------------------
// Class-Only Protocols
//------------------------------------------

/*
protocol ที่จงใจสร้างขึ้นมาเพื่อให้ class เอาไปใช้เท่านั้น

    protocol SomeClassOnlyProtocol: AnyObject, SomeInheritedProtocol {
        // class-only protocol definition goes here
    }

*/

/*
protocol Movable: AnyObject{
    func moveForward()
    func moveBackward()
}

// rror: non-class type 'RobotStuct' cannot conform to class protocol 'Movable'
// struct RobotStuct: Movable{} 

class Robot: Movable{
    var move: String = "stop"
    
    init() {}
    init(move: String){
        self.move = move
    }

    func moveForward(){
        self.move = "Forward"
    }
    func moveBackward(){
        self.move = "Backward"
    }
}

let robomi = Robot()
robomi.moveForward()
print(robomi.move) // Forward
*/

//------------------------------------------
// Protocol Composition
//------------------------------------------

/*
    protocol Named {
        var name: String { get }
    }
    protocol Aged {
        var age: Int { get }
    }
    struct Person: Named, Aged {
        var name: String
        var age: Int
    }
    func wishHappyBirthday(to celebrator: Named & Aged) {
        print("Happy birthday, \(celebrator.name), you're \(celebrator.age)!")
    }
    let birthdayPerson = Person(name: "Malcolm", age: 21)
    wishHappyBirthday(to: birthdayPerson)
    // Prints "Happy birthday, Malcolm, you're 21!"


    class Location {
        var latitude: Double
        var longitude: Double
        init(latitude: Double, longitude: Double) {
            self.latitude = latitude
            self.longitude = longitude
        }
    }
    class City: Location, Named {
        var name: String
        init(name: String, latitude: Double, longitude: Double) {
            self.name = name
            super.init(latitude: latitude, longitude: longitude)
        }
    }
    func beginConcert(in location: Location & Named) {
        print("Hello, \(location.name)!")
    }

    let seattle = City(name: "Seattle", latitude: 47.6, longitude: -122.3)
    beginConcert(in: seattle)
    // Prints "Hello, Seattle!"

*/



/*


protocol Brand{
    var name: String { set get }
}

protocol Price{
    var price: Float { set get }
}

struct Iphone: Brand, Price{
    var name: String
    var price: Float
}

func phoneDetail(phone: Brand & Price){
    print("Phone form: \(phone.name), Price: \(phone.price)")
}

let someIphone: Brand & Price = Iphone(name: "Iphone 1", price: 10000)
phoneDetail(phone: someIphone)
// Phone form: Iphone 1, Price: 10000.0

class Ipad777{
    var detail: Brand & Price
    
    init(detail: Brand & Price){
        self.detail = detail
    }
}

let ipadFromIphone = Ipad777(detail: someIphone)
ipadFromIphone.detail.name = "IPAD"
ipadFromIphone.detail.price = 777777.7

phoneDetail(phone: ipadFromIphone.detail)
// Phone form: IPAD, Price: 777778.0


extension Ipad777: Ram{
    struct MemoryData{
        static var _memory: Int = 1
        static var _weight: Int = 200
    }
    var memory: Int{
        get { return MemoryData._memory}
        set{
            MemoryData._memory = newValue
        }
    }
    var weight: Int{
        get{
            return MemoryData._weight
        }
        set{
            MemoryData._weight = newValue
        }
    } 
}

ipadFromIphone.memory = 20

func ipadDetail(ipad: Ipad777 & Ram){
    print("Ipad name: \(ipad.detail.name), Price: \(ipad.detail.price)")    
    print("Have Ram \(ipad.memory)GB, and Weight \(ipad.weight)")
}

ipadDetail(ipad: ipadFromIphone)
/*
Ipad name: IPAD, Price: 777778.0
Have Ram 20GB, and Weight 200
*/

*/




//------------------------------------------
// Checking for Protocol Conformance
//------------------------------------------

/*
สามาถใช้ is, as?, as! ได้ใน protocol
    The is operator returns true if an instance conforms to a protocol and returns false if it doesn’t.
    The as? version of the downcast operator returns an optional value of the protocol’s type, and this value is nil if the instance doesn’t conform to that protocol.
    The as! version of the downcast operator forces the downcast to the protocol type and triggers a runtime error if the downcast doesn’t succeed.

    protocol HasArea {
        var area: Double { get }
    }
    class Circle: HasArea {
        let pi = 3.1415927
        var radius: Double
        var area: Double { return pi * radius * radius }
        init(radius: Double) { self.radius = radius }
    }
    class Country: HasArea {
        var area: Double
        init(area: Double) { self.area = area }
    }
    class Animal {
        var legs: Int
        init(legs: Int) { self.legs = legs }
    }
    let objects: [AnyObject] = [
        Circle(radius: 2.0),
        Country(area: 243_610),
        Animal(legs: 4)
    ]
    for object in objects {
        if let objectWithArea = object as? HasArea {
            print("Area is \(objectWithArea.area)")
        } else {
            print("Something that doesn't have an area")
        }
    }
    // Area is 12.5663708
    // Area is 243610.0
    // Something that doesn't have an area


*/



/*

protocol Buy {
    func buy()
}

struct Book: Buy {
    var price: Int
    func buy() {
        print("Buy some book cost \(self.price)")
    }
}
extension Array: Buy where Element: Buy {
    func buy() {
        for item in self {
            item.buy()
        }
    }
}

let listOfBook = [Book(price: 100), Book(price: 200), Book(price: 300)]


if let books = listOfBook as? Buy {
    books.buy()
}
/*
Buy some book cost 100
Buy some book cost 200
Buy some book cost 300
*/

let newBook = Book(price: 500) as Book
print(type(of:newBook)) // Book
print(newBook.price) // 500 

let newBook2 = Book(price: 600) as? Buy
if let book = newBook2{
    print(type(of:book)) // Book
    // print(book.price) // error: value of type 'Buy' has no member 'price'
}


let newBook3: Buy? = Book(price: 700)
newBook3?.buy()
// Buy some book cost 700

struct Ball: Buy{
    func buy(){
        print("Buy some ball")
    }
}

struct Bluetooth{}

let anyBuy: [Any] = [Book(price: 800), Ball(), Bluetooth()]
for item in anyBuy{
    switch item{
        case let value as Ball:
            value.buy()
        case let value as Book:
            value.buy()
        default:
            print("cant buy")
    }
}
/*
Buy some book cost 800
Buy some ball
cant buy
*/

*/


//------------------------------------------
// Optional Protocol Requirements
//------------------------------------------

/*
คนที่จะมา adopt ตัว CounterDataSource จะต้องใส่ @objc
โดยที่จะ implement ครบทั้งสองตัวหรือไม่ implement ก็ได้ เพราะเป็น optional
    @objc protocol CounterDataSource {
        @objc optional func increment(forCount count: Int) -> Int
        @objc optional var fixedIncrement: Int { get }
    }

    class Counter {
        var count = 0
        var dataSource: CounterDataSource?
        func increment() {
            // ทำ opitonal chaining ถ้าไม่มีไปเข้าอีก case
            if let amount = dataSource?.increment?(forCount: count) {
                count += amount
            } else if let amount = dataSource?.fixedIncrement {
                count += amount
            }
        }
    }


// คลาสทุกคลาสใน objective C จะต้อง inherit มาจาก NSObject
    class ThreeSource: NSObject, CounterDataSource {
        let fixedIncrement = 3
    }
    var counter = Counter()
    counter.dataSource = ThreeSource()
    for _ in 1...4 {
        counter.increment()
        print(counter.count)
    }
    // 3
    // 6
    // 9
    // 12

    class TowardsZeroSource: NSObject, CounterDataSource {
        func increment(forCount count: Int) -> Int {
            if count == 0 {
                return 0
            } else if count < 0 {
                return 1
            } else {
                return -1
            }
        }
    }

    counter.count = -4
    counter.dataSource = TowardsZeroSource()
    for _ in 1...5 {
        counter.increment()
        print(counter.count)
    }
    // -3
    // -2
    // -1
    // 0
    // 0


*/


//------------------------------------------
// Protocol Extensions
//------------------------------------------

/*
โดยปกติการสร้าง protocol เช่น จะระบุแค่ชื่อตัวแปร, ฟังก์ชั่น และระบุ return type
แต่เมื่อ extension protocol จะสามารถกำหนดค่า default ให้กับตัว protocol ได้

*RandomNumberGenerator เป็น protocol
    extension RandomNumberGenerator {
        func randomBool() -> Bool {
            return random() > 0.5
        }
    }

    let generator = LinearCongruentialGenerator()
    print("Here's a random number: \(generator.random())")
    // Prints "Here's a random number: 0.3746499199817101"
    print("And here's a random Boolean: \(generator.randomBool())")
    // Prints "And here's a random Boolean: true"


*/

/*

protocol Fly{
    var canFly: Bool { set get }
}

class Bird: Fly{
    var canFly = true
    init(fly: Bool){
        self.canFly = fly
    }
}

let someBird = Bird(fly: false)

// Fly เป็น protocol
extension Fly{
    func fly() -> Bool{
        return canFly
    }
}

print(someBird.fly()) // false


*/


//------------------------------------------
// Providing Default Implementations
//------------------------------------------

/*

protocol Greeting{
    var greeting: String { get }
}

// สร้าง default value ให้กับ Greeting
extension Greeting{
    var greeting: String{
        return "Hello extension"
    }
}

// สร้าง GreatingClass ที่ไม่ได้สร้าง greeting
class GreetingClass: Greeting{
    var message: String

    init(){
        self.message = "[none]"
    }
    func greet() -> String{
        return greeting
    }
}

let someGreeting:GreetingClass = GreetingClass()
print(someGreeting.greet()) // Hello extension
print(someGreeting.message) // [none]

// สร้างฟังก์ชั่นให้อัพเดทค่าใน stored properties เป็นค่าใหม่ที่ถูกสร้างจาก default Protocol
extension GreetingClass{
    func setMesssge(){
        self.message = greeting
    }
}

someGreeting.setMesssge()
print(someGreeting.message) // Hello extension

*/


//------------------------------------------
// Adding Constraints to Protocol Extensions
//------------------------------------------


/*
For example, you can define an extension to the Collection protocol
that applies to any collection whose elements conform to the Equatable protocol.
By constraining a collection’s elements to the Equatable protocol,
a part of the standard library, you can use the == and != operators to check for equality
and inequality between two elements.

    extension Collection where Element: Equatable {
        func allEqual() -> Bool {
            for element in self {
                if element != self.first {
                    return false
                }
            }
            return true
        }
    }

    let equalNumbers = [100, 100, 100, 100, 100]
    let differentNumbers = [100, 100, 200, 100, 200]

    print(equalNumbers.allEqual())
    // Prints "true"
    print(differentNumbers.allEqual())
    // Prints "false"

*/



/*

extension Array where Element: Equatable {
   func plusOneToElement() -> [Element]{
       
       return self
   }
}

extension Array where Element: Comparable {
    func sortMaxToMin() -> [Element] {
        return self.sorted(){ $0 > $1 }
    }
}

let someElement = [3, 7, 9, 11, 50, 1, 2, 80].sortMaxToMin()
print(someElement) // [80, 50, 11, 9, 7, 3, 2, 1]

extension Array where Element == Int {
    func lessThanTen() -> [Int] {
        return self.filter { $0 < 10 }
    }
}

print(someElement.lessThanTen()) // [9, 7, 3, 2, 1]


extension Array where Element: Comparable {
    func moreThanFirstElement() -> [Element] {
        if let firstElement = self.first{
            return self.filter{ $0 > firstElement }
        }
        return self
    }
}

let anotherElement = [5, 6, 7, 1, 2, 9, 10, 50, 3, 4, 3, 5, 6]
print(anotherElement) // [5, 6, 7, 1, 2, 9, 10, 50, 3, 4, 3, 5, 6]
print(anotherElement.moreThanFirstElement()) // [6, 7, 9, 10, 50, 6]

struct Apple{
   var totalApple: Int
}

extension Collection where Element == Apple {
   var countTotalApple: Int {
       var result = 0
       for item in self{
           result += item.totalApple
       }
       return result
   }
}

let listOfApple = [Apple(totalApple: 5), Apple(totalApple: 9), Apple(totalApple: 90)]
print(listOfApple.countTotalApple) // 104



*/