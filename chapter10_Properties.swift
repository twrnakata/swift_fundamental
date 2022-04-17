func typeOf(_ data:Any) -> () {
    print(type(of:data))
}

//------------------------------------------
// Properties
//------------------------------------------


/*
properties มี 2 แบบ คือ Stored และ Computed
    stored เก็บค่าได้คือ class, structure (ไม่รวม enum) ที่มีการกำหนดค่า default มีการเรียก initializer
    computed เป็น propeties ที่ไว้ใช้คำนวณ ไม่ต้องเก็บค่า มีทั้ง class, structure, enum

    ปกติเวลาสร้าง class, struct properties จะเป็นของ instance
    แต่ static จะเป็นของ type หรือ type properties(เป็นของ class ไม่ใช่ instance)
*/


//------------------------------------------
// Stored Properties
//------------------------------------------

/*
Stored properties can be either variable stored properties
(introduced by the var keyword) or constant stored properties
(introduced by the let keyword).
*/

    // stored properties
    // struct ตัวนี้ไม่ได้กำหนด default ฉะนั้นจะไม่มี default init ให้
    struct FixedLengthRange {
        var firstValue: Int
        let length: Int // หลัง assign ค่าจะแก้ไขไม่ได้
    }

    var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3) // memberwise init ที่จะกำหนดค่า properties ให้ทุกตัว
    // the range represents integer values 0, 1, and 2
    rangeOfThreeItems.firstValue = 6
    // the range now represents integer values 6, 7, and 8


struct StructureWithStoredProperties {
    let fixedPropertiesInt: Int
    var reusablePropertiesInt: Int
    var reusablePropertiesString: String
}


var instanceOfStructureWithStoredProperties = 
StructureWithStoredProperties(fixedPropertiesInt: 3, reusablePropertiesInt: 4, reusablePropertiesString: "can reused")

print(instanceOfStructureWithStoredProperties)
// StructureWithStoredProperties(fixedPropertiesInt: 3, reusablePropertiesInt: 4, reusablePropertiesString: "can reused")

// instanceOfStructureWithStoredProperties.fixedPropertiesInt = 1 // *error* variable let
instanceOfStructureWithStoredProperties.reusablePropertiesInt = 100
instanceOfStructureWithStoredProperties.reusablePropertiesString = "stored properties"
print(instanceOfStructureWithStoredProperties)
// StructureWithStoredProperties(fixedPropertiesInt: 3, reusablePropertiesInt: 100, reusablePropertiesString: "stored properties")


struct Emoji {
    var emojis = ["😀", "😃", "🙃"]    
}

let myEmoji = Emoji()
print(myEmoji) // Emoji(emojis: ["😀", "😃", "🙃"])


struct SomePlayer{
    var name: String = "noname"
    var exp: Int = 0
    var level: Int = 0
}
var lampard = SomePlayer(name: "Lampard", exp: 0, level: 1)
print(lampard) // SomePlayer(name: "Lampard", exp: 0, level: 1)









class ProgrammingLanguage{
    let name: String
    var version: String
    var availableOnWindows: Bool = true
    var updatedTime: String?

    // class ถ้าไม่ได้กำหนด default จะไม่มี initializer ให้
    init(name: String, version: String){
        self.name = name
        self.version = version
    }

    func show(){
        print("name:",self.name,  "\nversion:", self.version, "\navailableOnWindows:", self.availableOnWindows, "\nupdatedTime:", self.updatedTime)
    }
}

var swiftLanguage = ProgrammingLanguage(name: "Swift", version: "1.0")
swiftLanguage.show()
/*
name: Swift 
version: 1.0 
availableOnWindows: true 
updatedTime: nil
*/


// swiftLanguage.name = "C++" // *error* let
swiftLanguage.version = "2.0"
swiftLanguage.updatedTime = "19.2.2022"
swiftLanguage.show()
/*
name: Swift 
version: 2.0 
availableOnWindows: true 
updatedTime: Optional("19.2.2022")
*/




//------------------------------------------
// Stored Properties of Constant Structure Instances
//------------------------------------------

    // สร้าง instance ของ struct แล้วถ้าทำให้เป็น let จะแก้ไขไม่ได้

    // let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
    // // this range represents integer values 0, 1, 2, and 3
    // rangeOfFourItems.firstValue = 6
    // // this will report an error, even though firstValue is a variable property

/*
This behavior is due to structures being value types.
When an instance of a value type is marked as a constant, so are all of its properties.
เมื่อ instance ของ value type ถูกกำหนดให้เป็น let ตัว properties ที่อยู่ข้างในก็จะเป็น constant ไปด้วย
ไม่เหมือนกับ referece type ต่อให้เป็น let ก็ยังสามารถแก้ไขค่าได้อยู่
*/




let constantInstanceOfStructureWithStoredProperties = StructureWithStoredProperties(fixedPropertiesInt: 3, reusablePropertiesInt: 4, reusablePropertiesString: "can not reused")
print(constantInstanceOfStructureWithStoredProperties)

// constantInstanceOfStructureWithStoredProperties.fixedPropertiesInt = 90 // *error* let
// constantInstanceOfStructureWithStoredProperties.reusablePropertiesInt = 90 // *error* let


let constantSwiftLanguage = ProgrammingLanguage(name:"Swift++", version: "1.2")
// constantSwiftLanguage.name = "Swift Ultra +" // *error* variable let
constantSwiftLanguage.version = "1.3"
constantSwiftLanguage.updatedTime = "99.99.99"
constantSwiftLanguage.show()
/*
name: Swift++ 
version: 1.3 
availableOnWindows: true 
updatedTime: Optional("99.99.99")
*/





//------------------------------------------
// Lazy Stored Properties
//------------------------------------------

/*
ถ้ากำหนด stored properties เป็น lazy จะยังไม่กำหนดค่าเริ่มต้น
เมื่อยังไม่ได้ใช้งาน ตอน init จะไม่ถูกกำหนดค่าจนกว่าจะมีกำหนดค่าเริ่มต้นให้
ฉะนั้นต้องทำเป็น var เพื่อให้แก้ไขค่าทีหลังได้
เพราะตอนสร้าง instance จะต้องมีการ initialize properties ค่าให้เรียบร้อยก่อนจะได้ instance ออกมา
ถ้าเป็น lazy จะยังไม่มีการกำหนดค่า จะได้ instance ออกมาก่อนแล้วค่อยอัพเดท lazy อีกทีหนึ่ง

    cant use lazy with let and computed properties
    ใช้ได้เฉพาะใน class, struct
*/

/*
class DataImporter {
    /*
    DataImporter is a class to import data from an external file.
    The class is assumed to take a nontrivial amount of time to initialize.
    */
    var filename = "data.txt"
    // the DataImporter class would provide data importing functionality here
}

class DataManager {
    lazy var importer = DataImporter()
    var data: [String] = []
    // the DataManager class would provide data management functionality here
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")

    print(manager.importer.filename)
    // the DataImporter instance for the importer property has now been created
    // Prints "data.txt"

*/




struct PersonWithLazyNoDefault{
    var name: String
    // lazy var Position: String? // *error* lazy properties must have an initializer
    lazy var Position: String? = nil
}

// var personWithLazyInstance = PersonWithLazyNoDefault(name: "Jojo") // *error* กำหนดค่าไม่ครบ
var personWithLazyInstance = PersonWithLazyNoDefault(name: "Jojo", Position:"Guard")
print(personWithLazyInstance)
// PersonWithLazyNoDefault(name: "Jojo", Position.storage: Optional(Optional("Guard")))


struct PersonWithLazyHaveDefault{
    var name: String = "Man"
    lazy var Position: String? = nil
}

var anotherPersonWithLazy = PersonWithLazyHaveDefault()
print(anotherPersonWithLazy)
// PersonWithLazyHaveDefault(name: "Man", Position.storage: nil)





struct LoadTheme{
    var name = "Main Theme"
    var version: String =  "10.2"
    
    func calSomething(integer data: Int, text: String) -> String{
        var data = data  + (data * 90)  / 2
        return "\(text) it's fine with \(data)"
    }
}

struct ThemeControl{
    var isNeedToUse: Bool?
    lazy var theme = LoadTheme()
}

var flowerTheme = ThemeControl()
print(flowerTheme)
// ThemeControl(isNeedToUse: nil, theme.storage: nil)

// เรียกใช้ Lazy
flowerTheme.isNeedToUse = true
print(flowerTheme.theme.name) // Main Theme
print(flowerTheme)
// ThemeControl(isNeedToUse: Optional(true), theme.storage: Optional(test.LoadTheme(name: "Main Theme", version: "10.2")))





struct IntroduceMyself {
    var name: String = "someone"
    var needToSayAboutSecret: Bool?
    
    // lazy let saySecret: String = { // *error* cant use let
    lazy var saySecret: String = {
        return "my real name is not \(name). it's Naj"
    }()
    lazy var sayNormal: String = {
        return "Hello! myname is \(name)"
    }()
}

var markTheLazyGuyWhoStillAlive = IntroduceMyself()
markTheLazyGuyWhoStillAlive.needToSayAboutSecret = true

if markTheLazyGuyWhoStillAlive.needToSayAboutSecret!{
    print(markTheLazyGuyWhoStillAlive.saySecret)
}else{
    print(markTheLazyGuyWhoStillAlive.sayNormal)
}
// my real name is not someone. it's Naj




class SomePersonClassWithLazy{
    var name = "noname"
    lazy var age = 1
}

let instanceSomePersonClassWithLazy = SomePersonClassWithLazy()
instanceSomePersonClassWithLazy.name = "Jotaro"
print(instanceSomePersonClassWithLazy.name) // Jotaro
print(instanceSomePersonClassWithLazy.age == 1) // true



class GPS{
    var location = "Somewhere 1013 Rd."
    var movement = "Forward"
    var range = "13m"
    
    func getLocation() -> (location: String, movement: String, range: String){
        return (location, movement, range)
    }
}

class Car{
    var brand = "Aston Martin"
    lazy var navigation = GPS()

    func useGPS() -> (location: String, movement: String, range: String){
        return (self.navigation.getLocation().location,
        self.navigation.getLocation().movement,
        self.navigation.range
        )
    }
}

let myCar = Car()

print(myCar.useGPS())
// (location: "Somewhere 1013 Rd.", movement: "Forward", range: "13m")



class Greeting{
    var name: String = "someone"
    lazy var greeting: String = "Hello \(self.name),"
    lazy var afterGreeting: String = "please have a seat"

    func say(){
        print(self.greeting, afterGreeting, ",", self.name)
    }
}

let myGreetingToSomeone = Greeting()
myGreetingToSomeone.say() // Hello someone, please have a seat , someone

let anotherGreeting = Greeting()
anotherGreeting.name = "Oreo"
anotherGreeting.say() // Hello Oreo, please have a seat , Oreo




//------------------------------------------
// Computed Properties
//------------------------------------------


/*
In addition to stored properties,
***classes, structures, and enumerations can define computed properties,***
which don’t actually store a value. Instead,
they provide a getter and an optional setter to retrieve and set other properties
and values indirectly.

เป็น properties ที่เอาไว้คำนวณ
จะมี set กับ get
*/
    // default init และ memberwise ถูกสร้าง
    struct Point {
        var x = 0.0, y = 0.0
    }
    struct Size {
        var width = 0.0, height = 0.0
    }
    struct Rect {
        var origin = Point()
        var size = Size()
        var center: Point { // เป็น computed properties ไม่เก็บข้อมูล
            get {
                let centerX = origin.x + (size.width / 2)
                let centerY = origin.y + (size.height / 2)
                return Point(x: centerX, y: centerY)
            }
            set(newCenter) {
                origin.x = newCenter.x - (size.width / 2)
                origin.y = newCenter.y - (size.height / 2)
            }
        }
    }
    var square = Rect(origin: Point(x: 0.0, y: 0.0),
                      size: Size(width: 10.0, height: 10.0))
    let initialSquareCenter = square.center
    // initialSquareCenter is at (5.0, 5.0)
    square.center = Point(x: 15.0, y: 15.0)
    print("square.origin is now at (\(square.origin.x), \(square.origin.y))")
    // Prints "square.origin is now at (10.0, 10.0)"




struct SomeKey{
    var _key: Bool = false
    var key: Bool{
        get{
            return self._key
        }
        set{
            self._key = newValue
        }
    }
}



struct Bicycle{
    var name: String
    let brand: String

    var bycyclename: String{
        get{
            return self.name
        }
        set(newName){
            self.name = newName
        }
    }
}


var giantBicycle = Bicycle(name: "Big Guy", brand:"Giant")

print(giantBicycle.bycyclename) // Big Guy
giantBicycle.bycyclename = "Big Guy Plus"
print(giantBicycle.bycyclename) // Big Guy Plus




class YenToBaht {
    var baht: Float = 1
    
    var toBaht: Float{
        get{
            return (self.baht)
        }
        set(yen){
            self.baht = (yen * 0.28)
        }
    }
    var toYen: Float{
        get{
            return (self.baht * 3.5714)
        }
        set(yen){
            self.baht = (yen * 0.28)
        }
    }
}
var OneThousandYen:Float = 10000.0
var oneBaht = YenToBaht()
print(oneBaht.toBaht) // 1.0
oneBaht.toBaht = OneThousandYen
print(oneBaht.toBaht) // 2800.0
print(oneBaht.toYen) // 9999.92



//------------------------------------------
// Shorthand Setter Declaration
//------------------------------------------


    struct AlternativeRect {
        var origin = Point()
        var size = Size()
        var center: Point {
            get {
                let centerX = origin.x + (size.width / 2)
                let centerY = origin.y + (size.height / 2)
                return Point(x: centerX, y: centerY)
            }
            set {
                origin.x = newValue.x - (size.width / 2)
                origin.y = newValue.y - (size.height / 2)
            }
        }
    }





struct Rent{
    var rent: Double = 0
    var elect: Double = 0
    var water: Double = 0
    var wifi: Double = 0
    
    var addRent: (Double, Double, Double, Double){
        get{
            return (rent, elect, water, wifi)
        }
        set{
            self.rent = newValue.0
            self.elect = newValue.1
            self.water = newValue.2
            self.wifi = newValue.3
        }
    }
    
    var calElect: Double{
        get{
            return elect * 15
        }
    }

    var calWater: Double{
        return water * 10
    }
    
    // let sum: Double{ // 'let' declarations cannot be computed properties
    // lazy var sum: Double{ //  'lazy' must not be used on a computed property
    var sum: Double{
        return (rent + calElect + calWater + wifi)
    }
}

var markHouse = Rent()
markHouse.addRent = (100, 20, 20, 5)
print(markHouse) // Rent(rent: 100.0, elect: 20.0, water: 20.0, wifi: 5.0)
print("This House Have to pay:")
print("Elect: \(markHouse.calElect)")
print("Water: \(markHouse.calWater)")
print("Sum: \(markHouse.sum)")
/*
This House Have to pay:
Elect: 300.0
Water: 200.0
Sum: 605.0
*/





struct BoxOfPencil{
    var listOfPencil = [String]()
    /*
    ประกาศ pencil แล้วใส่ค่าให้ self.pencil จะทำให้เกิด infinite recursion
    function call causes an infinite recursion
    var pencil: [String]{
        get{
            return self.pencil
        }
        set{
            self.pencil.append(contentsOf: newValue)
        }
    }
    */
    var pencil: [String]{
        get{
            return self.listOfPencil
        }
        set{
            self.listOfPencil.append(contentsOf: newValue)
        }
    }

}

var maliPencil = BoxOfPencil()
print(maliPencil.pencil) // []
maliPencil.pencil = ["Pizza"]
print(maliPencil.pencil) // ["Pizza"]
maliPencil.listOfPencil = ["Burger", "Cheese"]
print(maliPencil.pencil) // ["Burger", "Cheese"]





struct PokemonSkill{
    var name: [String] = ["Bite"]

    var skill: [String]{
        get{
            return name
        }
        set{
            self.name.append(contentsOf: newValue)
        }
    }
}


var flameSkillSet = PokemonSkill()
print(flameSkillSet.skill) // ["Bite"]
flameSkillSet.skill = ["Blaze", "Ember"]
print(flameSkillSet.skill) // ["Bite", "Blaze", "Ember"]



struct Pokemon{
    var name: String = "Noname"
    var level: Int = 1
    var ability = PokemonSkill()

    var changeSkill : PokemonSkill{
        get{
            return PokemonSkill(name: ability.name)
        }
        set{
            ability = newValue
        }
    }    
}

var lizadon = Pokemon()
print(lizadon)
// Pokemon(name: "Noname", level: 1, ability: test.PokemonSkill(name: ["Bite"]))

// เพิ่ม item to array โดยใช้ set ของ PokemonSkill
lizadon.ability.skill = ["Fire Kick"]

// แสดงข้อมูลของ ability
print(lizadon.ability.skill) // ["Bite", "Fire Kick"]
print(lizadon.changeSkill) // PokemonSkill(name: ["Bite", "Fire Kick"])

// เอาข้อมูลใน PokemonSkill มาใส่แทนข้อมูลชุดเดิม
lizadon.changeSkill = flameSkillSet

// แสดงข้อมูลของ ability
print(lizadon.ability.skill) // ["Bite", "Blaze", "Ember"]
print(lizadon.changeSkill) // PokemonSkill(name: ["Bite", "Blaze", "Ember"])




class Time{
    var seconds = 0.0

    init(seconds: Double){
        self.seconds = seconds
    }

    var minites: Double{
        get{
            return (seconds / 60)
        }
        set{
            self.seconds = (newValue * 60)
        }
    }

    var hours: Double{
        get{
            return (seconds / (60 * 60))
        }
        set{
            self.seconds = (newValue * (60 * 60))
        }
    }

    var days: Double{
        get{
            return (seconds / (60 * 60 * 24))
        }
        set{
            self.seconds = (newValue * (60 * 60 * 24))
        }
    }
}


let myClock = Time(seconds: 60)
let someMinite = myClock.minites
print(someMinite) // 1.0
print("Time \(myClock.days):days \(myClock.hours):hours \(myClock.minites):minites \(myClock.seconds):seconds")
// Time 0.000694444444444444:days 0.0166666666666667:hours 1.0:minites 60.0:seconds

myClock.hours = 1
let someHour = myClock.hours
print(someHour) // 1
print("Time \(myClock.days):days \(myClock.hours):hours \(myClock.minites):minites \(myClock.seconds):seconds")
// Time 0.5:days 12.0:hours 720.0:minites 43200.0:seconds

myClock.days = 6
let someDay = myClock.days
print(someDay) // 6 
print("Time \(myClock.days):days \(myClock.hours):hours \(myClock.minites):minites \(myClock.seconds):seconds")
// Time 6.0:days 144.0:hours 8640.0:minites 518400.0:seconds


let newClockTime = myClock
newClockTime.days = 20
print("Time \(myClock.days):days \(myClock.hours):hours \(myClock.minites):minites \(myClock.seconds):seconds")
// Time 20.0:days 480.0:hours 28800.0:minites 1728000.0:seconds





//------------------------------------------
// Shorthand Getter Declaration
//------------------------------------------

    // struct CompactRect {
    //     var origin = Point()
    //     var size = Size()
    //     var center: Point {
    //         get {
    //             Point(x: origin.x + (size.width / 2),
    //                   y: origin.y + (size.height / 2))
    //         }
    //         set {
    //             origin.x = newValue.x - (size.width / 2)
    //             origin.y = newValue.y - (size.height / 2)
    //         }
    //     }
    // }



/*
Omitting the return from a getter follows the same rules as omitting return
from a function, as described in Functions With an Implicit Return.
*/



//------------------------------------------
// Read-Only Computed Properties
//------------------------------------------

/*
ถ้าอยากจะให้อ่านข้อมูลอย่างเดียวก็ไม่ต้องใส่ set และสามารถละ get ได้
*/

    struct Cuboid {
        var width = 0.0, height = 0.0, depth = 0.0
        var volume: Double { // omit get
            return width * height * depth
        }
    }
    let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
    print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")
    // Prints "the volume of fourByFiveByTwo is 40.0"



class Rectangle{
    var width: Int = 0
    var height: Int = 0

    var volume: Int{
        return width * height
    }

    var area: (Int, Int){
        get{
            return (width, height)
        }
        set{
            self.width = newValue.0
            self.height = newValue.1
        }
    }
}


var myRectangle = Rectangle()
myRectangle.width = 20
myRectangle.height = 20
print("Volume of this rectangle = \(myRectangle.volume)")
// Volume of this rectangle = 400

print(myRectangle.area) // (20, 20)
myRectangle.area = (10, 10)
print(myRectangle.area) // (10, 10)


struct Student{
    let studentID: Int
    let firstname: String
    let lastname: String
    
    var profile: String{
        return "Student ID: \(studentID), Name: \(firstname) \(lastname)"
    }
}


var konthai = Student(studentID: 1, firstname: "Konthai", lastname: "Siam")
print(konthai.profile) // Student ID: 1, Name: Konthai Siam




//------------------------------------------
// Property Observers
//------------------------------------------

/*
    จะคอยสังเกตค่าของ properties ว่าเกิดอะไรขึ้นบ้าง
    สามารถใช้ได้กับ
    Stored properties that you define
    Stored properties that you inherit
    Computed properties that you inherit

    ***ไม่สามาถใช้กับ lazy ได้***

You have the option to define either or both of these observers on a property:

มีสองตัวคือ
    willSet is called just before the value is stored.
    ก่อนที่จะเปลี่ยนแปลงค่าอยากจะให้ทำอะไรสามารถกำหนดได้ใน willSet

    didSet is called immediately after the new value is stored.
    หลังจาก set ค่าแล้ว จะให้ทำอะไรสามารถกำหนดได้ใน didSet

ภายใน willSet, didSet จะมี newValue, oldValue ให้ใช้

*/


    class StepCounter {
        var totalSteps: Int = 0 {
            willSet(newTotalSteps) {
                print("About to set totalSteps to \(newTotalSteps)")
            }
            didSet {
                if totalSteps > oldValue  {
                    print("Added \(totalSteps - oldValue) steps")
                }
            }
        }
    }
    let stepCounter = StepCounter()
    stepCounter.totalSteps = 200
    // About to set totalSteps to 200
    // Added 200 steps
    stepCounter.totalSteps = 360
    // About to set totalSteps to 360
    // Added 160 steps
    stepCounter.totalSteps = 896
    // About to set totalSteps to 896
    // Added 536 steps





var storedProperties: Int = 0 {
    willSet(newValue) {
        if newValue != storedProperties{
            print("\(storedProperties) will change to \(newValue)")
        }else{
            print("you already have \(storedProperties)")
        }
        
    }
    didSet {
        if storedProperties == oldValue{
            print("\(storedProperties) == \(oldValue)")
        }else{
            print("\(oldValue) change to \(storedProperties)")
        }
    }
}
typeOf(storedProperties)
storedProperties = 0 
/*
you already have 0
0 == 0
*/
storedProperties = 1
/*
0 will change to 1
0 change to 1
*/


var computedProperties: Int{
    get{
        return storedProperties
    }
    set{
        storedProperties = newValue
    }
}
typeOf(computedProperties) // Int
print(computedProperties) // 1
computedProperties = 3
/*
1 will change to 3
1 change to 3
*/





struct Boat{
    var color: String = "Red" {
        willSet{
            print("\(newValue) will add instead \(color)")
        }
        didSet{
            print("Success to change \(oldValue) to \(color)")
        }
    }
}

var elizabethBoat = Boat()
print(elizabethBoat.color) // Red
elizabethBoat.color = "Blue"
/*
Blue will add instead Red
Sucess to change Red to Blue
*/

print(elizabethBoat.color) // Blue




struct FruitBasket{
    var fruits: [String] = []{
        willSet{
            // fruits.append(contentsOf: newValue)
            /* warning: attempting to store to property 'fruits' within its own willSet, 
            which is about to be overwritten by the new value
            */
            print("I will put \(newValue) to Basket")
        }
        didSet{
            print("Ok. we have \(fruits) now let's get more fruits")
        }
    }    
}

var mangoBasket = FruitBasket()
mangoBasket.fruits = ["Mango"]
/*
I will put ["Mango"] to Basket
Ok. we have ["Mango"] now let's get more fruits
*/
mangoBasket.fruits = ["Banana"]
/*
I will put ["Banana"] to Basket
Ok. we have ["Banana"] now let's get more fruits
*/

print(mangoBasket.fruits) // ["Banana"]
for i in mangoBasket.fruits{
    print(i)
}
// Banana

mangoBasket.fruits.append("Yellow")
/*
I will put ["Banana", "Yellow"] to Basket
Ok. we have ["Banana", "Yellow"] now let's get more fruits
*/
print(mangoBasket.fruits) // ["Banana", "Yellow"]






//------------------------------------------
// Property Wrappers
//------------------------------------------

/*
ใช้ในการตรวจเช็คเงื่อนไขก่อนจะเก็บ
เวลาที่จะสร้าง property wrapper จะต้องสร้าง properties ที่ชื่อ wrappedValue เพื่อให้สามารถทำงานในแบบที่ต้องการได้
*/
    // สร้างตัวที่จะใช้เช็คเงื่อนไขและกำหนดเป็น @propertyWrapper
    // @propertyWrapper
    // struct TwelveOrLess {
    //     private var number = 0
    //     var wrappedValue: Int { /* แทนที่จะ set ค่าให้ number ตรงๆ ก็มา set ค่าให้ wrappedValue แทนก่อน */
    //         get { return number }
    //         set { number = min(newValue, 12) }
    //     }
    // }



    // struct SmallRectangle {
    //     @TwelveOrLess var height: Int 
    //     @TwelveOrLess var width: Int
    /* ถึงแม้จะไม่ได้กำหนด default แต่ถูกครอบด้วย wrappedValue
    แต่ก็เหมือนกำลังสร้าง height,width ที่เป็น instance ของ TwelveOrLess เก็บไว้เป็น private */
    // }

    // var rectangle = SmallRectangle()
    // print(rectangle.height)
    // // Prints "0"

    // rectangle.height = 10
    // print(rectangle.height)
    // // Prints "10"

    // rectangle.height = 24
    // print(rectangle.height)
    // // Prints "12"


/*
    หน้าตาแบบเขียนเต็มยศของ @TwelveOrLess
    struct SmallRectangle {
        private var _height = TwelveOrLess()
        private var _width = TwelveOrLess()
        var height: Int {
            get { return _height.wrappedValue }
            set { _height.wrappedValue = newValue }
        }
        var width: Int {
            get { return _width.wrappedValue }
            set { _width.wrappedValue = newValue }
        }
    }

*/


// เขียนเต็มยศแบบไม่ใช้ wrappedValue
struct ModByTen{
    private var number = 0
    var modTen: Int{
        get{ return number}
        set{
             self.number = newValue % 10
        }
    }
}

struct SmallValue{
    private var _number = ModByTen()
        var number: Int{
            get{
                return _number.modTen
            }
            set{
                 _number.modTen = newValue
            }
        }
}

var mySmallValue = SmallValue()
print(mySmallValue.number) // 0
mySmallValue.number = 75
print(mySmallValue.number) // 5




// ใช้ propertyWrapper

/*
@propertyWrapper
struct DoubleValue{
    private var number = 0
    var wrappedValue: Int {
        get{ return self.number }
        set{
            self.number = (newValue * 2)
        }
    }
}

struct DoubleValueByTwo{
    @DoubleValue var number: Int
}

var myDoubleValue = DoubleValueByTwo()
print(myDoubleValue.number) // 0

myDoubleValue.number = 20 
print(myDoubleValue.number) // 40
*/


//------------------------------------------
// Setting Initial Values for Wrapped Properties
//------------------------------------------

/*
    // สร้างเงื่อนไขเป็น propertyWrapper
    @propertyWrapper
    struct SmallNumber {
        private var maximum: Int
        private var number: Int

        var wrappedValue: Int {
            get { return number }
            set { number = min(newValue, maximum) }
        }

        init() {
            maximum = 12
            number = 0
        }
        init(wrappedValue: Int) {
            maximum = 12
            number = min(wrappedValue, maximum)
        }
        init(wrappedValue: Int, maximum: Int) {
            self.maximum = maximum
            number = min(wrappedValue, maximum)
        }
    }



    struct ZeroRectangle {
    @SmallNumber var height: Int
    @SmallNumber var width: Int
    }

    var zeroRectangle = ZeroRectangle()
    print(zeroRectangle.height, zeroRectangle.width)
    // Prints "0 0"


    // เรียกใช้ initializer ของ SmallNumber โดยมีการกำหนดค่าเริ่มต้นไว้ที่ 1
    // จะเหมือนสร้าง instance ของ SmallnNumber แล้วส่ง wrappedValue เป็น 1
    // โดยตัวที่รับจะต้องเป็นชื่อ wrappedValue(จะเป็นทั้ง label และ argument)
    struct UnitRectangle {
        @SmallNumber var height: Int = 1
        @SmallNumber var width: Int = 1
    }

    var unitRectangle = UnitRectangle()
    print(unitRectangle.height, unitRectangle.width)
    // Prints "1 1"

    // 
    struct NarrowRectangle {
        @SmallNumber(wrappedValue: 2, maximum: 5) var height: Int
        @SmallNumber(wrappedValue: 3, maximum: 4) var width: Int
    }

    var narrowRectangle = NarrowRectangle()
    print(narrowRectangle.height, narrowRectangle.width)
    // Prints "2 3"

    narrowRectangle.height = 100
    narrowRectangle.width = 100
    print(narrowRectangle.height, narrowRectangle.width)
    // Prints "5 4"



    struct MixedRectangle {
        @SmallNumber var height: Int = 1
        @SmallNumber(maximum: 9) var width: Int = 2
    }

    var mixedRectangle = MixedRectangle()
    print(mixedRectangle.height)
    // Prints "1"

    mixedRectangle.height = 20
    print(mixedRectangle.height)
    // Prints "12"



*/




@propertyWrapper
struct Capitalized {
    private var value: String
    var wrappedValue: String {
        get { self.value } 
        set {
            value = newValue.uppercased()
        }
    }
    init(){
        value = "untitled"
    }
    // ถ้า set ชื่อจะเสียความสามารถในการละ label
    // init(myValue: String) { 
    //     value = myValue.uppercased()
    init(wrappedValue: String) {
        value = wrappedValue.uppercased()
    }
}

// เหมือนสร้าง instance ของ Capitalized
struct BookNoDefault {
    // private var title = Capitalized(wrappedValue: "title")
    @Capitalized var title: String
}


print("=============")


var myBookNoDefault = BookNoDefault()
print(myBookNoDefault.title) // untitled
myBookNoDefault.title = "My title"
print(myBookNoDefault.title) // MY TITLE


// มีการ set default value ให้ มันจะไปเรียก initializer ของ Capitalized ที่จะ set uppercased
// เนื่องจากกำหนด parameter ของ init เป็น wrapperValue จึงสามารถเขียนโดยละ argument label ได้

struct BookWithDefault{
    // @Capitalized var title = "set default" // *error
    // @Capitalized(myValue: "not use wrapped") var title: String // ใช้ได้
    @Capitalized var title: String
}

// var myBookWithDefault = BookWithDefault(title: "my value")
var myBookWithDefault = BookWithDefault()
print(myBookWithDefault.title) // SET DEFAULT



// set แบบเต็มยศ
struct BookWithWrappedValue{
    @Capitalized(wrappedValue: "my default value") var title: String

}

var myBookwithWrappedValue = BookWithWrappedValue()
print(myBookwithWrappedValue.title) // MY DEFAULT VALUE


print("=============")



@propertyWrapper
struct LimitStringLength{
    private var maximum: Int
    var wrappedValue: Int{
        get{ return self.maximum }
        set{
            self.maximum = newValue
        }
    }

    init(){
        self.maximum = 4
    }

    init(wrappedValue: Int){
        self.maximum = wrappedValue
    }
}

@propertyWrapper
struct TruncateWrap{
    private var data: String
    private var maximumLength: Int
    var wrappedValue: String {
        get{
            return self.data }
        set{
           self.data = limitString(text: newValue)
        }
    }
    
    mutating func setLimit(to newLimit: Int){
        guard newLimit >= 0 else {
            return
        }
        maximumLength = newLimit
    }

    func limitString(text: String) -> String{
        var text = text
        if text.count > self.maximumLength{
                let myLimit = (text.count - self.maximumLength)
                text = String(text.dropLast(myLimit))
        }
        return text
    }

    init(){
        self.data = "none"
        self.maximumLength = 4
    }
    
     // ต้องเป็นชื่อ wrappedValue ถ้าต้องการให้เรียกใช้งานอัตโนมัติ
    init(wrappedValue: String){
        self.data = wrappedValue
        self.maximumLength = 4
        self.data = limitString(text: wrappedValue)
    }
    init(wrappedValue: String, maximum: Int){
        self.data = wrappedValue
        self.maximumLength = maximum
        self.data = limitString(text: wrappedValue)
    }
}


var myTruncateWrap = TruncateWrap(wrappedValue: "12345678")
print(myTruncateWrap.wrappedValue) // 1234


print("==============================")



// เหมือน instance ของ TruncateWrap
struct MaximumStringNoDefault{
    @TruncateWrap var text: String
}


// var myStringLimitNoDefault = MaximumStringNoDefault(data: "12345", maximumLength: 6) // *error*
// var myStringLimitNoDefault = MaximumStringNoDefault(text: "12345678") // *error*
// var myStringLimitNoDefault = MaximumStringNoDefault(text: "12345678", maximum: 5) // *error*
// var myStringLimitNoDefault = MaximumStringNoDefault(wrappedValue: "12345678") // *error*
// var myStringLimitNoDefault = MaximumStringNoDefault(wrappedValue: "12345678", maximum: 5) // *error*

var myStringLimitNoDefault = MaximumStringNoDefault() 
print(myStringLimitNoDefault.text) // none
myStringLimitNoDefault.text = "123456"
print(myStringLimitNoDefault.text) // 1234


struct MaximumStringHaveDefaultLimitBySix{
    @TruncateWrap(wrappedValue: "default value in MaximumStringDefault", maximum: 6) var text: String
    @TruncateWrap (maximum: 12) var longText: String = "long long long"
}


var myMaximumStringHaveDefault = MaximumStringHaveDefaultLimitBySix()
print(myMaximumStringHaveDefault.text) // defaul
myMaximumStringHaveDefault.text = "newValue"
print(myMaximumStringHaveDefault.text) // newVal



print(myMaximumStringHaveDefault.longText) // long long lo
myMaximumStringHaveDefault.longText = "winter is coming"
print(myMaximumStringHaveDefault.longText) // winter is co




print("=============")




@propertyWrapper
struct NotZero{
    private var number: Int{
        willSet{
            print("new value is coming")
        }
        didSet{
            print("success to added \(number)")
        }
    }
    var wrappedValue: Int{
        get{return self.number}
        set{
            if (newValue > 0){
                self.number = newValue
            }
        }
    }
    
    init(){
        number = 1
    }
    init(wrappedValue: Int){
        var newValue = 1
        if (wrappedValue > 0){
            newValue = wrappedValue
        }
        self.number = newValue
    }
}

@propertyWrapper
struct MemberName{
    private var name: String
    var wrappedValue: String{
        get{return self.name}
        set{
            self.name = newValue
        }
    }

    init(){
        name = "Noname"
    }
    init(wrappedValue: String){
        self.name = wrappedValue
    }
}

struct BankWrap{
    @MemberName var name: String
    @NotZero var money: Int
}

var alexBankAccount = BankWrap()
print("Owner: \(alexBankAccount.name)") // Owner: Noname
print("Have Money: \(alexBankAccount.money)") // Have Money Number: 1

alexBankAccount.name = "Sir Alex"
alexBankAccount.money = 120
/*
new value is coming
success to added 120
*/

alexBankAccount.money = -1 
print("Owner: \(alexBankAccount.name)") // Owner: Sir Alex
print("Have Money: \(alexBankAccount.money)") // Have Money: 120


print("=============")



//------------------------------------------
// Projecting a Value From a Property Wrapper
//------------------------------------------


/*
สามารถ project ค่าจาก property wrapper ได้
สามารถติดตามได้ ก่อนที่จะเก็บจริงมีการ update ก่อนเก็บหรือไม่
projecting value จะเป็น type อะไรก็ได้ เช่น class, self

    @propertyWrapper
    struct SmallNumber {
        private var number: Int
        private(set) var projectedValue: Bool // ให้ set เป็น private ไม่ให้คนอื่น set

        var wrappedValue: Int {
            get { return number }
            set {
                if newValue > 12 {
                    number = 12
                    projectedValue = true
                } else {
                    number = newValue
                    projectedValue = false
                }
            }
        }

        init() {
            self.number = 0
            self.projectedValue = false
        }
    }
    struct SomeStructure {
        @SmallNumber var someNumber: Int
    }
    var someStructure = SomeStructure()

    someStructure.someNumber = 4
    print(someStructure.$someNumber)
    // Prints "false"

    someStructure.someNumber = 55
    print(someStructure.$someNumber)
    // Prints "true"



    enum Size {
    case small, large
    }

    struct SizedRectangle {
        @SmallNumber var height: Int
        @SmallNumber var width: Int

        mutating func resize(to size: Size) -> Bool {
            switch size {
            case .small:
                height = 10
                width = 20
            case .large:
                height = 100
                width = 100
            }
            return $height || $width
        }
    }


*/




@propertyWrapper
struct OptionalArrayPropertyWrapper{
    private var optionalArray: [String]?
    private(set) var projectedValue: Bool // ต้องใช้ชื่อ projectedValue

    var wrappedValue: [String]?{
        get{return self.optionalArray}
        set{
            guard let newValue = newValue else{
                projectedValue = false
                return
            }
            projectedValue = true
            optionalArray = newValue
        }
    }
    
    init(){
        self.optionalArray = nil
        self.projectedValue = false
    }
}

var assumeBox = OptionalArrayPropertyWrapper()

print(assumeBox.wrappedValue) // nil
assumeBox.wrappedValue = ["string", "sating"]
print(assumeBox.wrappedValue) // Optional(["string", "sating"])
assumeBox.wrappedValue = ["a"]
print(assumeBox.wrappedValue) // Optional(["a"])


struct BoxWithProjectingValue{
    @OptionalArrayPropertyWrapper var array: [String]?
}

var optionalBox = BoxWithProjectingValue()
print(optionalBox.$array) // false
print(optionalBox.array) // nil

// assign
optionalBox.array = ["Grape"]
print(optionalBox.$array) // true
print(optionalBox.array) // Optional(["Grape"])




@propertyWrapper
struct ClockTick{
    private var tick: Int
    private(set) var projectedValue: Int

    var wrappedValue: Int{
        get{return self.tick}
        set{
            self.tick += newValue
            projectedValue += 1
        }
    }
    init(){
        self.tick = 1
        self.projectedValue = 0
    }
}

struct someClock{
    @ClockTick var tiktok: Int
}

var nalika = someClock()
print(nalika.tiktok) // 1
nalika.tiktok = 300
nalika.tiktok = 500
nalika.tiktok = 900
print(nalika.$tiktok) // 3
print(nalika.tiktok) // 1701




struct ProjectedStruct{
    var boxOfItem = (count: 0, data: [String]())
}
var myProjectedStruct = ProjectedStruct()

@propertyWrapper
struct IceCream{
    var items: String
    var projectedValue: ProjectedStruct

    var wrappedValue: String{
        get{return items}
        set{
            items = newValue
            projectedValue.boxOfItem.count += 1
            projectedValue.boxOfItem.data.append(newValue)
        }
    }
    init(){
        items = ""
        projectedValue = myProjectedStruct

    }
}

struct IceCreamFridge{
    @IceCream var flavors: String
}

var fridge = IceCreamFridge()
fridge.flavors = "Chocolate"
fridge.flavors = "Strawberry"

print(fridge.flavors) // Strawberry
print(fridge.$flavors) // ProjectedStruct(boxOfItem: (count: 2, data: ["Chocolate", "Strawberry"]))




@propertyWrapper
struct TriangleValue{
    private var number: Int
    private(set) var projectedValue: String
    var wrappedValue: Int{
        get{return number}
        set{
            var newValue = newValue
            if (newValue <= 0){
                newValue = 1
                projectedValue = "Value <= 0"
            }else{
                projectedValue = "pass"
            }
            number = newValue
        }
    }

    init(){
        self.number = 1
        self.projectedValue = "none"
    }
}

enum ScaleTriangle{
    case upScale, downScale
}

struct Triangle{
    @TriangleValue var base: Int
    @TriangleValue var height: Int
    var area: Int{
        get{
            return (base * height) / 2
        }
    }

    mutating func resize(to scale: ScaleTriangle){
        switch scale{
            case .upScale:
                base += 10
                height += 10
            case .downScale:
                base -= 10
                height -= 10
        }
    }

}


var myTriangle = Triangle()
print(myTriangle.base) // 1
print(myTriangle.height) // 1
print(myTriangle.$height) // none
myTriangle.resize(to: .downScale)
print(myTriangle.base) // 1
print(myTriangle.height) // 1
print(myTriangle.$height) // Value <= 0
myTriangle.resize(to: .upScale)
print(myTriangle.base) // 11
print(myTriangle.height) // 11
print(myTriangle.$height) // pass

print(myTriangle.area) // 60


print("==========================")



//------------------------------------------
// Global and Local Variables
//------------------------------------------

/*

ใช้ propertiy wrapper ให้กับตัวแปรที่เป็น local stored variable ได้
แต่ไม่สามารถทำกับ globalm computed variable ได้

ตัวอย่าง
    func someFunction() {
        @SmallNumber var myNumber: Int = 0

        myNumber = 10
        // now myNumber is 10

        myNumber = 24
        // now myNumber is 12
    }

*/



@propertyWrapper
struct MaxTen {
    private var maximum: Int
    private var number: Int

    var wrappedValue: Int {
        get { return number }
        set { number = max(newValue, maximum) }
    }

    init() {
        maximum = 10
        number = 0
    }
    init(wrappedValue: Int) {
        maximum = 10
        number = min(wrappedValue, maximum)
    }
    init(wrappedValue: Int, maximum: Int) {
        self.maximum = 10
        number = max(wrappedValue, maximum)
    }
}

func multiplyByTen(from number:Int) -> Int{
    @MaxTen var ten: Int = 500

    return (number * ten)
}

print(multiplyByTen(from: 10)) // 100




// Global
// @MaxTen var MyMaxTen : Int = 600 // *error* property wrappers are not yet supported in top-level code





func setValue(to number:Int) -> Int{
    @NotZero var number = number
    return number
}

var oneHundred = 100
print(setValue(to: oneHundred)) // 100
var minusOneHundred = -100
print(setValue(to: minusOneHundred)) // 1
print(setValue(to: -900)) // 1



print("==============")



//------------------------------------------
// Type Properties
//------------------------------------------



//------------------------------------------
// Type Property Syntax
//------------------------------------------


/*
จะถือเป็น properties ของ class, struct, enum จะมีเพียง copy เดียว ไม่ได้มีไปให้ instance แต่ละตัว
เพราะไม่ใช่ properties ของ instance เป็นของ type

****เนื่องจากเป็น properties ของ type จึงจะไม่มี initializer มากำหนดค่าเริ่มต้นให้กับ type properties****

storedTypeProperty ตอน init จะเป็น lazy

//ของเก่า
storedTypeProperty สามารถเป็น var, let ได้
computedTypeProperty  ต้องเป็น var เสมอ

*/

/*
    struct SomeStructure {
        static var storedTypeProperty = "Some value."
        static var computedTypeProperty: Int {
            return 1
        }
    }
    enum SomeEnumeration {
        static var storedTypeProperty = "Some value."
        static var computedTypeProperty: Int {
            return 6
        }
    }
    class SomeClass {
        static var storedTypeProperty = "Some value."
        static var computedTypeProperty: Int {
            return 27
        }
        // เป็น computed properties เพราะ class สามารถ inherit ได้
        // sub class จึงสามารถ override properies ตัวนี้ได้
        // ถ้าใส่ class ไว้ข้างหน้าจะหมายถึงการยอมให้ sub class เอา properties ไป override ได้

        class var overrideableComputedTypeProperty: Int {
            return 107
        }
    }

*/


//------------------------------------------
// Querying and Setting Type Properties
//------------------------------------------

/*
    // เวลาเขาถึง ต้องเรียกชื่อ Type เช่น ชื่อ struct/ชื่อ class

    print(SomeStructure.storedTypeProperty)
    // Prints "Some value."
    SomeStructure.storedTypeProperty = "Another value."
    print(SomeStructure.storedTypeProperty)
    // Prints "Another value."
    print(SomeEnumeration.computedTypeProperty)
    // Prints "6"
    print(SomeClass.computedTypeProperty)
    // Prints "27"



    
    struct AudioChannel {
        static let thresholdLevel = 10
        static var maxInputLevelForAllChannels = 0
        var currentLevel: Int = 0 {
            didSet {
                if currentLevel > AudioChannel.thresholdLevel {
                    // cap the new audio level to the threshold level
                    currentLevel = AudioChannel.thresholdLevel
                }
                if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                    // store this as the new overall maximum input level
                    AudioChannel.maxInputLevelForAllChannels = currentLevel
                }
            }
        }
    }


    var leftChannel = AudioChannel()
    var rightChannel = AudioChannel()

    leftChannel.currentLevel = 7
    print(leftChannel.currentLevel)
    // Prints "7"
    print(AudioChannel.maxInputLevelForAllChannels)
    // Prints "7"

    rightChannel.currentLevel = 11
    print(rightChannel.currentLevel)
    // Prints "10"
    print(AudioChannel.maxInputLevelForAllChannels)
    // Prints "10"



*/


struct AndroidOreo{
    static var _version = "8.1.0_r93 (OSN1.210329.015) / October 4, 2021"
    static var version: String{
        get{
            return self._version
        }
        set{
            _version = newValue
        }
    }
    
    static func getVersion(){
        print(_version)
    }
}

var samsungVersion8 = AndroidOreo()
// ไม่มี copy ส่งไปยัง instance
// print(samsungVersion8.version) // *error*  static member 'version' cannot be used on instance of type 'AndroidOreo'
// samsungVersion8.getVersion() // *error* static member 'getVersion' cannot be used on instance of type 'AndroidOreo'

print(AndroidOreo.version) // 8.1.0_r93 (OSN1.210329.015) / October 4, 2021
print(AndroidOreo.version) // 8.1.0_r93 (OSN1.210329.015) / October 4, 2021
AndroidOreo.getVersion() // 8.1.0_r93 (OSN1.210329.015) / October 4, 2021

// assign value
AndroidOreo._version = "9"
print(AndroidOreo.version) // 9

AndroidOreo.version = "10"
AndroidOreo.getVersion() // 10






class GreetingMainClass{
    static var greetingStoredProperties: String = "Hi"
    static var greetingComputedProperties: String{
        return "Hello"
    }

    class var overrideGetStoredProperties: String{
        return greetingStoredProperties
    }
    class var overrideGetComputedProperties: String{
        return greetingComputedProperties
    }

    static func funcGetStoredProp() -> String{
        return greetingStoredProperties
    }

    static func funcGetComputedProp() -> String{
        return greetingComputedProperties
    }

    class func sayCatOverrideFunction() -> String{
        return "Cat"
    }
}

class GreetingSubClass: GreetingMainClass{
    var greetingStoredProperties: String = "Hi Sub"

    override class var overrideGetStoredProperties: String{
        return "Hi Subclass"
    }
    override class var overrideGetComputedProperties: String{
        return "Hello Subclass"
    }
    override class func sayCatOverrideFunction() -> String{
        return "Dog"
    }
}

var greetingMain = GreetingMainClass()

// ใช้ instance เรียก storeProperties
// print(greetingMain.greetingStoredProperties)
// print(overrideGetStoredProperties())
// print(greetingMain.funcGetStoredProp()) // static member 'funcGetStoredProp' cannot be used on instance of type 'GreetingMainClass'
// print(greetingMain.sayCatOverrideFunction()) // static member 'sayCatOverrideFunction' cannot be used on instance of type 'GreetingMainClass'

// ใช้ class เรียก storeProperties
print(GreetingMainClass.greetingStoredProperties) // Hi
print(GreetingMainClass.overrideGetStoredProperties) // Hi
print(GreetingMainClass.funcGetStoredProp()) // Hi
print(GreetingMainClass.sayCatOverrideFunction()) // Cat

// ใช้ instance เรียก compuetedProperties
// print(greetingMain.greetingComputedProperties) // static member 'greetingComputedProperties' cannot be used on instance of type 'GreetingMainClass'
// print(greetingMain.overrideGetComputedProperties())
// print(greetingMain.funcGetComputedProp())

// ใช้ class เรียก storeProperties
print(GreetingMainClass.greetingComputedProperties) // Hello
print(GreetingMainClass.overrideGetComputedProperties) // Hello
print(GreetingMainClass.funcGetComputedProp()) // Hello


print("Subclass")

// สร้าง instance Subclass
var myGreetingSubClass = GreetingSubClass()
// print(myGreetingSubClass.overrideGetStoredProperties) // static member 'overrideGetStoredProperties' cannot be used on instance of type 'GreetingSubClass'
// print(myGreetingSubClass.overrideGetComputedProperties) // error: static member 'overrideGetComputedProperties' cannot be used on instance of type 'GreetingSubClass'
// print(myGreetingSubClass.sayCatOverrideFunction())


print(GreetingSubClass.overrideGetStoredProperties) // Hi Subclass
print(GreetingSubClass.overrideGetComputedProperties) // Hello Subclass
print(GreetingSubClass.sayCatOverrideFunction()) // Dog


// เรียกใช้ตัวแปรชื่อเดียวกันใน SubClass
print(myGreetingSubClass.greetingStoredProperties) // Hi Sub
print(GreetingSubClass.greetingStoredProperties) // Hi


// แก้ไขค่า
GreetingMainClass.greetingStoredProperties = "Edit Hi"
print(GreetingMainClass.greetingStoredProperties) // Edit Hi
print(GreetingMainClass.funcGetStoredProp()) // Edit Hi

print(GreetingSubClass.overrideGetStoredProperties) // Hi Subclass

// GreetingMainClass.greetingComputedProperties = "Edit Hello" // cannot assign to property: 'greetingComputedProperties' is a get-only property




struct Dog {
    static var noise = "Bark!"
}

print(Dog.noise) // Bark!

class Animal {
    class var noise: String {
        return "Animal noise"
    }
}
class Bird: Animal {
    override class var noise: String {
        return "jib jib"
    }
}

print(Bird.noise) // jib jib





struct HappyBirthDay{
    static let msg = "Happy BrithDay!"
}

enum February: String{
    static var month = "February"
    case feb
}

class Drogba{
    static var name = "Drogba"
    
    func myBirthDayNotStatic() -> String{
        return ("Hello! \(Drogba.name) born @\(February.month) then.. say \(HappyBirthDay.msg) me now!")
    }
    static func myBirthDayStatic() -> String{
        return ("Hello! \(Drogba.name) born @\(February.month) then.. say \(HappyBirthDay.msg) me now!")
    }
    
    func changeName(to name: String){
        Drogba.name = name
    }
}

print(Drogba.myBirthDayStatic()) // Hello! Drogba born @February then.. say Happy BrithDay! me now!

var drogba = Drogba()
print(drogba.myBirthDayNotStatic()) // Hello! SAAA Drogba born @February then.. say Happy BrithDay! me now!

drogba.changeName(to: "Baba")
print(Drogba.myBirthDayStatic()) // Hello! Baba born @February then.. say Happy BrithDay! me now!
print(drogba.myBirthDayNotStatic()) // Hello! Baba born @February then.. say Happy BrithDay! me now!







struct Level {
    private static var highestLevel: Int = 5
    lazy var playerName: String = "Noname"
    private var _playerLevel: Int = 1
    private var unlocked: Bool = false{
        willSet{
            print("gonna assign value to unlocked")
        }
        didSet{
            if unlocked{
                print("unlock completed: Player Name '\(playerName)'")
            }else{
                print("unlocked have set to false")
            }
        }
    }
    var playerLevel: Int{
        get{
            if (self.playerLevel > 0){
                return self._playerLevel
            }else{
                print("invalid Player Level")
                return 0
            }
        }
    }
    mutating func upLevel(){
        if (self._playerLevel < Level.highestLevel) && (self.unlocked == true){
            _playerLevel += 1
            print("\(playerName) up to level \(_playerLevel)")
        }
        self.unlocked = false
    }
    
    mutating func forceUnlock(){
        self.unlocked = !unlocked
    }
}


var playerAqua = Level()
playerAqua.playerName = "Aqua"
playerAqua.upLevel()
/*
gonna assign value to unlocked
unlocked have set to false
*/

// Level.unlocked = true // *error* private
// playerAqua.unlocked = true // *error* private

playerAqua.forceUnlock()
/*
gonna assign value to unlocked
unlock completed: Player Name 'Aqua'
*/

print("-------")
playerAqua.upLevel()
/*
Aqua up to level 2
gonna assign value to unlocked
unlocked have set to false
*/

// print(Level.playerName) // *error* lazy  / instance member 'playerName' cannot be used on type 'Level'
// print(Level.highestLevel) // *error* private


//------------------------------------------
// 
//------------------------------------------




