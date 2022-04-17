//------------------------------------------
// Structures and Classes
//------------------------------------------
func typeOf(_ data:Any) -> () {
    print(type(of:data))
}

//------------------------------------------
// Comparing Structures and Classes
//------------------------------------------


/*
Structures and classes in Swift have many things in common. Both can:

    Define properties to store values
    Define methods to provide functionality
    Define subscripts to provide access to their values using subscript syntax
    Define initializers to set up their initial state
    Be extended to expand their functionality beyond a default implementation
    Conform to protocols to provide standard functionality of a certain kind

*/


/*
***Classes*** have additional capabilities that structures don’t have:

    Inheritance enables one class to inherit the characteristics of another.
    Type casting enables you to check and interpret the type of a class instance at runtime.
    Deinitializers enable an instance of a class to free up any resources it has assigned.
    Reference counting allows more than one reference to a class instance.

class เป็น reference type
ฉะนั้นเวลาสร้าง instance ของ class คือ reference
*/



//------------------------------------------
// Definition Syntax
//------------------------------------------

    struct SomeStructure {
        // structure definition goes here
    }
    class SomeClass {
        // class definition goes here
    }

/*
properties ที่เก็บค่าได้คือ store properties
*/

    struct Resolution {
        var width = 0
        var height = 0
    }
    class VideoMode {
        var resolution = Resolution()
        var interlaced = false
        var frameRate = 0.0
        var name: String? // optional -> nil
    }

/*
ตัวอย่างด้านบนมีการกำหนดค่า default ให้กับแต่ละตัว และเมื่อมีการกำหนดค่า default ให้ทุกตัวครบ ทั้ง class, struct
จะมีการจะมีการสร้าง initializer ให้อัตโนมัติ เป็น default init
*/




//------------------------------------------
// Structure and Class Instances
//------------------------------------------


    let someResolution = Resolution() // เรียกใช้ default initializer
    let someVideoMode = VideoMode() // เรียกใช้ default initializer




//------------------------------------------
// Accessing Properties
//------------------------------------------

    print("The width of someResolution is \(someResolution.width)")
    // Prints "The width of someResolution is 0"

    print("The width of someVideoMode is \(someVideoMode.resolution.width)")
    // Prints "The width of someVideoMode is 0"


    someVideoMode.resolution.width = 1280
    print("The width of someVideoMode is now \(someVideoMode.resolution.width)")
    // Prints "The width of someVideoMode is now 1280"




//------------------------------------------
// Memberwise Initializers for Structure Types
//------------------------------------------

/*
struct นอกจากจะมี default init ยังมี memberwise initilizer ให้อัตโนมัติ (class จะไม่มี)
memberwise initilizer เป็นตัวที่จะรับ parameter เท่ากับจำนวน properties ที่สร้างขึ้น
แต่ถึงแม้จะไม่มี default init แต่ structure ยังมี memberwise ให้กำหนดค่าเริ่มต้นได้
*/

let vga = Resolution(width: 640, height: 480)
// vga เป็น instance ของ Resolution มีการใช้ memberwise รับค่า width กับ height เข้ามา



//------------------------------------------
// Structures and Enumerations Are Value Types
//------------------------------------------

/*
Value types คือการก็อปปี้ค่าจริงๆ ไม่ต้องกังวลว่าเมื่อมีตัวใดตัวหนึ่งเปลี่ยน อีกตัวจะเปลี่ยนตาม
*/

    let hd = Resolution(width: 1920, height: 1080)
    var cinema = hd

    cinema.width = 2048

    print("cinema is now \(cinema.width) pixels wide")
    // Prints "cinema is now 2048 pixels wide"


    print("hd is still \(hd.width) pixels wide")
    // Prints "hd is still 1920 pixels wide"



    enum CompassPoint {
        case north, south, east, west
        mutating func turnNorth() {
            self = .north
        }
    }
    var currentDirection = CompassPoint.west
    let rememberedDirection = currentDirection
    currentDirection.turnNorth()

    print("The current direction is \(currentDirection)")
    print("The remembered direction is \(rememberedDirection)")
    // Prints "The current direction is north"
    // Prints "The remembered direction is west"





//------------------------------------------
// Classes Are Reference Types
//------------------------------------------


    let tenEighty = VideoMode()
    tenEighty.resolution = hd
    tenEighty.interlaced = true
    tenEighty.name = "1080i"
    tenEighty.frameRate = 25.0


    let alsoTenEighty = tenEighty
    alsoTenEighty.frameRate = 30.0


//------------------------------------------
// Identity Operators
//------------------------------------------

/*
    Identical to (===)
    Not identical to (!==)

*/
    if tenEighty === alsoTenEighty {
        print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
    }
    // Prints "tenEighty and alsoTenEighty refer to the same VideoMode instance."



//------------------------------------------
// Testing - Struct, Enum
//------------------------------------------



    // ไม่ได้กำหนด default แต่สามารถใช้ memberwise ได้
struct Person {
    var name: String
    var age: Int
    var money: Double

    func showMoney() -> Void{
        print(money)
    }
    func showPerson(){
        print("name: \(self.name), age: \(age), money: \(self.money)")
    }
}

    // memberwise intializer
var lukeSkywalker = Person(name: "Luke Skywalker", age: 10, money: 10.0_1)
print(lukeSkywalker) // Person(name: "Luke Skywalker", age: 10, money: 10.01)
print(lukeSkywalker.money) // 10.01
typeOf(lukeSkywalker) // Person

// var yoda = Person(name: "Yoda") // *error* กำหนดค่าไม่ครบไม่ได้ เพราะตัว Person ไม่มี default และไม่มี init
var yoda = Person(name: "Yoda", age: 99, money: 1)
yoda.showPerson() // name: Yoda, age: 99, money: 1.0


    // กำหนด default value ให้ struct
struct AstonMartin{
    var model: String = "DB"
    let brand = "Aston Martin"
    var price: Int = 120_000
    var doors = 4
    
    func getAstonMartinValue() -> (model: String, brand: String, price: Int, doors: Int){
        // return (model, brand, price, doors)
        return (self.model, self.brand, self.price, self.doors)
    }
}

let astonMartinDB = AstonMartin() // เรียก instance ของ SportCar
print(astonMartinDB) // AstonMartin(model: "DB", brand: "Aston Martin", price: 120000, doors: 4)


// var astonMartinDBX = AstonMartin(model: "DBX", brand: "Aston Martin2", price: 200_000, doors: 2) // *error* brand เป็น let แก้ไม่ได้
var astonMartinDBX = AstonMartin(model: "DBX", price: 200_000, doors: 2)
print(astonMartinDBX) // (AstonMartin(model: "DBX", brand: "Aston Martin", price: 200000, doors: 2)




    // มี default ไม่ครบ
struct Theme {
    var name: String
    var color = Color()
    
    func showTheme() -> () {
        print("name:", name)
        print("color:", color)
    }
}

struct Color {
    var colorName = ""

    mutating func setColor(value: String){
        self.colorName = value
    }
}

    // มี default ไม่ครบ เรียกใช้ instance ไม่ได้
// var myTheme = Theme() // *error*
    // ต้องกำหนด value ให้แต่ละตัวแปรเอง
var myTheme = Theme(name: "Main Theme", color: Color(colorName:"Red"))
typeOf(myTheme) // Theme

print(myTheme)
// (Theme(name: "Main Theme", color: chapter9_StructuresandClasses.Color(colorName: "Red"))
myTheme.showTheme()
/*
name: Main Theme
color: Color(colorName: "Red")
*/



struct Anpan{
    let name = "Anpan"
    var type = "Bread"

    struct Size{
        var size: Int = 1
    }
}


// ไม่มี Size
var someBread = Anpan()
print(someBread) // Anpan(name: "Anpan", type: "Bread")
typeOf(someBread) // Anpan


// ไม่มี Anpan
// var anotherBread = Anpan(name:"Banana", type:"Bread", Size())
var anotherBread = Anpan.Size()
typeOf(anotherBread) // Size
// anotherBread.name = "a" // *error*
anotherBread.size = 3
print(anotherBread) // Size(size: 3)







    // แก้ไขค่าของ struct แต่ละตัว
var takeLukeMoney = lukeSkywalker.money
typeOf(takeLukeMoney) // Double

lukeSkywalker.money = 500
print("lukeSkywalker.money :", lukeSkywalker.money, " takeLukeMoney :", takeLukeMoney)
// lukeSkywalker.money : 500.0  takeLukeMoney : 10.01
// astonMartinDB.model = astonMartinDBX.model // *error* astonMartinDB เป็น let


var newAstonCarDB = astonMartinDB
print(newAstonCarDB)
// AstonMartin(model: "DB", brand: "Aston Martin", price: 120000, doors: 4)

let valueInNewCar = newAstonCarDB.getAstonMartinValue()
print("valueInNewCar:")
print("Model: ", valueInNewCar.model)
print("Brand: ", valueInNewCar.brand)
print("Price: ", valueInNewCar.price)
print("Doors: ", valueInNewCar.doors)
/*
valueInNewCar:
Model:  DB
Brand:  Aston Martin
Price:  120000
Doors:  4
*/



myTheme.name = "Main Theme 2"
myTheme.color.colorName = "Blue"
myTheme.showTheme()
/*
name: Main Theme 2
color: Color(colorName: "Blue")
*/

myTheme.color.setColor(value: "Green")
myTheme.showTheme()
/*
name: Main Theme 2
color: Color(colorName: "Green")
*/




    // enum
    // enum CompassPoint {
    //     case north, south, east, west
    //     mutating func turnNorth() {
    //         self = .north
    //     }
    // }
    // var currentDirection = CompassPoint.west
    // let rememberedDirection = currentDirection
    // currentDirection.turnNorth()

    // print("The current direction is \(currentDirection)")
    // print("The remembered direction is \(rememberedDirection)")
    // // Prints "The current direction is north"
    // // Prints "The remembered direction is west"


    // enum ไม่มี memberwise
enum MoveDirection{
    case forward
    case backward
    case left
    case right
    mutating func moveLeft(){
        self = .left
    }
    // func moveRight(){ // *error* method 'mutating' to make 'self' mutable
    mutating func moveRight(){
        self = .right
    }

    func show(){
        print(self)
    }
}

// var movement = MoveDirection() // *error* ไม่มี initializer
var movement = MoveDirection.forward
movement.show() // forward
var oldMovement = movement
typeOf(oldMovement) // MoveDirection
oldMovement.show() // forward


    // แก้ไขค่าใน enum
movement.moveLeft()
oldMovement = MoveDirection.backward
movement.show() // left
print(oldMovement) // backward






//------------------------------------------
// Testing - Class
//------------------------------------------



    // ถ้าไม่มีการกำหนดค่า default จะไม่มี initializer ให้เรียกใช้
class Singer {
    var name: String
    var age: Int

    // ต้องสร้าง initializer เอง
    init(name: String, age: Int){
        self.name = name
        self.age = age
    }
    func sing() {
        print("you have to breathe")
    }
}

// var taylor = Singer() // *error* ไม่มีค่า default ให้เรียกใช้ และ class ไม่มี memberwise
var taylor = Singer(name: "Taylor", age: 10)
typeOf(taylor) // Singer
print("name:",taylor.name) // name: Taylor
print("age:",taylor.age) // 10

taylor.sing() // you have to breathe

    // กำหนด default value ให้แต่ละตัว
class Student {
    var studentName: String = ""
    var studentID: Int = 0

    func getStudentInfo() -> (){
        print("Student Name: \(self.studentName)")
        print("Student ID: \(self.studentID)") 
    }
}

let studentLuke = Student() // let
let studentYoda = Student() // let

studentLuke.studentID = 101
print("Student ID: \(studentLuke.studentID)") // Student ID: 101

studentYoda.studentID = 102
print("Student ID: \(studentYoda.studentID)") // Student ID: 102



// แก้ไขค่าใน class
taylor.name = "Taylor Swift"
print(taylor.name)
print("name:",taylor.name) // name: Taylor Swift
print("age:",taylor.age) // 10



studentLuke.studentName = "Luke"
print(studentLuke.studentName) // Luke

studentYoda.studentName = studentLuke.studentName
print(studentYoda.studentName) // Luke

studentYoda.studentName = "Yoda"
print(studentYoda.studentName) // Yoda
print(studentLuke.studentName) // Luke



//------------------------------------------
// Classes Are Reference Types
//------------------------------------------


let newStudent = studentLuke
print( (newStudent === studentLuke) ? "Yes Equal" : "Not Equal" ) // Yes Equal

newStudent.getStudentInfo()
/*
Student Name: Luke
Student ID: 101
*/

newStudent.studentName = "Han Solo"
newStudent.studentID = 103
newStudent.getStudentInfo()
/*
Student Name: Han Solo
Student ID: 103
*/

studentLuke.getStudentInfo()
/*
Student Name: Han Solo
Student ID: 103
*/



//------------------------------------------
// Class And Struct combine
//------------------------------------------


struct PersonHaveDefault{
    var name: String = "No One"
    var age: Int = 10

    func showPerson(){
    print("name: \(self.name), age: \(age)")
    }
    mutating func setName(_ name:String){
        self.name = name
    }
}

var metatron = PersonHaveDefault(name: "Metatron", age: 40)


class Jedi{
    var jediProfile = PersonHaveDefault()
    var items: [String] = []


    init() {} // default initializer
    init(name: String, age: Int, item: String) {
        self.jediProfile.name = name
        self.jediProfile.age = age
        self.items.append(item)
    }

    func showJediInfo(){
        print("Jedi: \(jediProfile.name), Age: \(jediProfile.age)")
        print("Items: \(items)")
    }
    
    func addItems(item: String?){
        guard let item = item else{return}
        items.append(item)
    }

    func setAge(_ age:Int){
        self.jediProfile.age = age
    }
}

var kenobi = Jedi()
kenobi.showJediInfo()
/*
Jedi: No One, Age: 10
Items: []
*/

kenobi.jediProfile.name = "Kenobi"
kenobi.setAge(90)
kenobi.addItems(item: "Saber")
kenobi.showJediInfo()
/*
Jedi: Kenobi, Age: 90
Items: ["Saber"]
*/

var obiwan = Jedi(
    name: "Obiwan", age: 2, item: "Gun"
)

obiwan.showJediInfo()
/*
Jedi: Obiwan, Age: 2
Items: ["Gun"]
*/


print("===============")

    // สร้าง Struct ที่เก็บ Class ซึ่งภายใน Class เก็บ Struct
struct JediHall{
    var hallOfJedi = Jedi()
    var badge: Int = 0

    func showJediHall() -> (){
        print("Jedi: \(self.hallOfJedi.jediProfile.name)")
        print("Age:", hallOfJedi.jediProfile.age)
        print("Item:", hallOfJedi.items)
        print("Badge:", self.badge)
    }
}

var jediHallOfKenobi = JediHall()
jediHallOfKenobi.showJediHall()
/*
Jedi: No One
Age: 10
Item: []
Badge: 0
*/

jediHallOfKenobi.hallOfJedi = kenobi
print(jediHallOfKenobi.hallOfJedi.jediProfile) // PersonHaveDefault(name: "Kenobi", age: 90)

jediHallOfKenobi.showJediHall()
/*
Jedi: Kenobi
Age: 90
Item: ["Saber"]
Badge: 0
*/

print("=============")

//------------------------------------------
// Structures and Enumerations Are Value Types ************ BUT CLASS is NOT!
//------------------------------------------


var anotherjediHallOfKenobi = jediHallOfKenobi

anotherjediHallOfKenobi.showJediHall()
/*
Jedi: Kenobi
Age: 90
Item: ["Saber"]
Badge: 0
*/

anotherjediHallOfKenobi.hallOfJedi.addItems(item: "Water-Gun") // แก้ค่าในคลาส
anotherjediHallOfKenobi.hallOfJedi.jediProfile.name = "new-Kenobi" // แก้ค่าในคลาส
anotherjediHallOfKenobi.badge = 12500 // แก้ค่าใน struct
anotherjediHallOfKenobi.showJediHall()

/*
Jedi: new-Kenobi
Age: 90
Item: ["Saber", "Water-Gun"]
Badge: 12500
*/

jediHallOfKenobi.showJediHall()
/*
Jedi: new-Kenobi
Age: 90
Item: ["Saber", "Water-Gun"]
Badge: 0
*/

    // ค่าที่ถูกเก็บใน Class จะถูกเปลี่ยนแปลง ถึงแม้ภายในคลาสจะเก็บเป็น struct
    // สรุป Class In Struct - pass by reference


    // ถ้าเป็น Class ที่เก็บ Struct

var anotherObiwan = obiwan
obiwan.showJediInfo()
/*
Jedi: Obiwan, Age: 2
Items: ["Gun"]
*/
anotherObiwan.showJediInfo()
/*
Jedi: Obiwan, Age: 2
Items: ["Gun"]
*/

anotherObiwan.addItems(item: "Laser-Gun")
anotherObiwan.jediProfile.setName("New Obiwan")
anotherObiwan.jediProfile.age =  88
anotherObiwan.showJediInfo()


// ข้อมูลถูกเปลี่ยน
/*
Jedi: New Obiwan, Age: 88
Items: ["Gun", "Laser-Gun"]
*/

obiwan.showJediInfo()
/*
Jedi: New Obiwan, Age: 88
Items: ["Gun", "Laser-Gun"]
*/

print("=============")


//------------------------------------------
// Class And Enum
//------------------------------------------



class Element{
    var element: EnumType = EnumType.Wind
    enum EnumType{
        case Fire
        case Water
        case Earth
        case Wind
    }

    func viewElement(){
        switch element{
            case .Fire:
                print("Hello Fire")
            case .Water:
                print("Some kind of Water")
            case .Earth:
                print("God Earth")
            case .Wind:
                print("Sound Wind")
        }
    }

}


    // สร้างและเปรียบเทียบการ copy value ระหว่างข้อมูลภายใน Class ด้วยกัน โดยมี datatype เป็น enum
var elementObject = Element()
print(elementObject.element) // Wind
elementObject.viewElement() // Sound Wind

var copyElementObject = elementObject
typeOf(elementObject) // Element
typeOf(copyElementObject) // Element
copyElementObject.viewElement() // Sound Wind

copyElementObject.element = Element.EnumType.Fire
copyElementObject.viewElement() // Hello Fire
elementObject.viewElement() // Hello Fire
    // ข้อมูลถูกเปลี่ยน


// สร้างและเปรียบเทียบการ copy value แต่สร้างจาก Enum ภายใน Class
let fireElement = Element.EnumType.Fire
print(fireElement) // Fire

var newFireElement = fireElement
print(newFireElement) // Fire
newFireElement = Element.EnumType.Water 
print(newFireElement) // Water
print(fireElement) // Fire
    // ข้อมูลไม่ถูกเปลี่ยน



// สร้าง enum และ class แยกกัน
enum NewEnumType: String{
    case Dark = "Dark"
    case Light = "Light"
}

class NewElement{
    var element = NewEnumType.Dark
}

var myNewElement = NewElement()

func viewElement(_ element: NewEnumType) -> (){
    switch element{
        case .Dark:
            print("Good Dark")
        case .Light:
            print("Good Light")
    }
}

viewElement(myNewElement.element) // Good Dark


var copyMyNewElement = myNewElement

copyMyNewElement.element = NewEnumType.Light

viewElement(copyMyNewElement.element) // Good Light
viewElement(myNewElement.element) // Good Light
    // ข้อมูลถูกเปลี่ยน


//------------------------------------------
// Struct And Enum
//------------------------------------------


    // สร้าง enum ไว้ภายใน struct
struct Volume {
   var volume: Scale = .low

   enum Scale: Int{
       case high = 3
       case medium = 2
       case low = 1
   }

   func showVolume(){
        switch volume{
            case .low:
                print("Low")
            case .medium:
                print("Medium")
            case .high:
                print("High")
        }
    }
 }


var newVolume = Volume()
typeOf(newVolume) // Volume
newVolume.showVolume() // low

var copyNewVolume = newVolume
typeOf(copyNewVolume) // Volume
copyNewVolume.showVolume() // Low

copyNewVolume.volume = Volume.Scale.high
copyNewVolume.showVolume() // High
newVolume.showVolume() // low

    // ข้อมูลไม่เปลี่ยนแปลง

print("====== End ======")