//------------------------------------------
// Generics
//------------------------------------------

//------------------------------------------
// The Problem That Generics Solve
//------------------------------------------

/*
ปัญหาของวิธีการเดิมคือ
ถ้าต้องการสร้างฟังก์ชั่นสลับค่าของ Int ก็ต้องสร้างขึ้นมา 1 ฟังก์ชั่น
แต่ถ้าต้องการสลับค่าตัวแปรชนิดอื่นก็ต้องสร้างเพิ่มอีกฟังก์ชั่น
    func swapTwoInts(_ a: inout Int, _ b: inout Int) {
        let temporaryA = a
        a = b
        b = temporaryA
    }

    var someInt = 3
    var anotherInt = 107
    swapTwoInts(&someInt, &anotherInt)
    print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
    // Prints "someInt is now 107, and anotherInt is now 3"

เขียนฟังก์ชั่นเพื่อรองรับ data type เป็น string
func swapTwoStrings(_ a: inout String, _ b: inout String) {
    let temporaryA = a
    a = b
    b = temporaryA
}

*/

//------------------------------------------
// Generic Functions
//------------------------------------------

/*
Generic จะแก้ปัญหาตรงนี้ โดยจะสร้างทีเดียวแล้วจะใช้ type อะไรก็ได้
    func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
        let temporaryA = a
        a = b
        b = temporaryA
    }

    func swapTwoInts(_ a: inout Int, _ b: inout Int)
    func swapTwoValues<T>(_ a: inout T, _ b: inout T)

    var someInt = 3
    var anotherInt = 107
    swapTwoValues(&someInt, &anotherInt)
    // someInt is now 107, and anotherInt is now 3

    var someString = "hello"
    var anotherString = "world"
    swapTwoValues(&someString, &anotherString)
    // someString is now "world", and anotherString is now "hello"

*/

func printInArray<T>(_ array: [T]) -> Void{
    for item in array{
        print(item, terminator: " ")
    }
    print()
}

let someStringArray =  ["A", "Wings", "Flash", "Fast"]
printInArray(someStringArray) // A Wings Flash Fast 
let someIntArray = [1, 0, 569, -1]
printInArray(someIntArray) // 1 0 599 -1


func arrayBackward<Element>(of array: [Element]) -> [Element] {
    return array.reversed()
}

print(arrayBackward(of: [1, 3, 5, 6 ,7, 80, 12, 20].sorted()))
// [80, 20, 12, 7, 6, 5, 3, 1]




func getGreaterElement<T: Comparable>(_ first: T, _ second: T) -> T{
    if (first > second){
        return first
    }
    return second
}

var imGreatest: Any = getGreaterElement(80, 1)
print(imGreatest) // 80
imGreatest = getGreaterElement("Z", "C")
print(imGreatest) // Z

struct Fish: Comparable{
    let name: String
    var age = 1
    static func < (first: Fish, second: Fish) -> Bool{
        return first.age < second.age
    }
}

let listOfFish = [Fish(name: "Mark", age: 50), Fish(name: "Naj", age: 90)]

imGreatest = getGreaterElement(listOfFish[0], listOfFish[1])
print((imGreatest as! Fish).name) // Naj



class GenericClass<T>{
    var _data: T
    var data: T{
        get { return self._data}
        set{
            self._data = newValue
        }
    }

    init(data: T){
        self._data = data
    }
}

let intInstanceForGeneric = GenericClass(data: 3)
print(type(of:intInstanceForGeneric.data)) // Int
print(intInstanceForGeneric.data) // 3

let stringInstanceForGeneric = GenericClass(data: "Generic")
print(stringInstanceForGeneric.data) // Generic

let someDoubleInstanceButAssignInt = GenericClass<Double>(data: 9)
print(type(of:someDoubleInstanceButAssignInt.data)) // Double
print(someDoubleInstanceButAssignInt.data) // 9.0




//------------------------------------------
// Type Parameters
//------------------------------------------

/*
the placeholder type T is an example of a type parameter. 
*/

//------------------------------------------
// Naming Type Parameters
//------------------------------------------

/*
ควรจะตั้งชื่อให้มีความหมาย เช่นใน Dictionary ใช้ชื่อ <Key> และ <Value> ในการแยกความหมายของ Element
แต่หากไม่มีความจำเป็นที่จะต้องตั้งชื่อก็จะใช้ตัวอักษร
T, U, and V, such as T in the swapTwoValues(_:_:) function above.
*/

//------------------------------------------
// Generic Types
//------------------------------------------

/*
โดยปกติถ้าจะทำ data structures เช่น Stack จะต้องกำหนด data type ที่ต้องการสร้างแยกกันตามความต้องการ
    struct IntStack {
        var items: [Int] = []
        mutating func push(_ item: Int) {
            items.append(item)
        }
        mutating func pop() -> Int {
            return items.removeLast()
        }
    }

แต่เมื่อนำ Generic มาใช้ก็สามารถใช้เพียง 1 structure ได้ ดังตัวอย่างด้านล่างจะเก็บเป็น Array ของ Element
    struct Stack<Element> {
        var items: [Element] = []
        mutating func push(_ item: Element) {
            items.append(item)
        }
        mutating func pop() -> Element {
            return items.removeLast()
        }
    }

เวลาที่จะสร้าง instance ของ Generic type ต้องระบุว่าอยากให้ type เป็นอะไร
ดังตัวอย่างด้านล่างจะมี Type เป็น String
    var stackOfStrings = Stack<String>()
    stackOfStrings.push("uno")
    stackOfStrings.push("dos")
    stackOfStrings.push("tres")
    stackOfStrings.push("cuatro")
    // the stack now contains 4 strings

    let fromTheTop = stackOfStrings.pop()
    // fromTheTop is equal to "cuatro", and the stack now contains 3 strings

*/

struct Plant<T>{
    var plant: T

    init(plant: T){
        self.plant = plant
    }

    func getPlant() -> T{
        return self.plant
    }
}

struct Moss{
    var name = "Moss"
    var price = 100

    func showMoss() -> Void{
        print("name: \(self.name), price: \(self.price)")
    }
}

struct Oak{
    let name = "Oak"
    var branch = 500

    func showOak() -> Void{
        print("name: \(self.name), branch: \(self.branch)")
    }
}

class AppleTree{
    let kingdom = "Platae"
    var isFruit = false

    func showAppleTree() -> Void{
        print("kingdom: \(self.kingdom), isFruit: \(self.isFruit)")
    }
}
class AppleFruit: AppleTree{
    var name = "Apple"
    var price = 30
    
    override init(){
        super.init()
        self.isFruit = true
    }

    func showAppleFruit() -> Void{
        super.showAppleTree()
        print("name: \(self.name), price: \(self.price)")
    }
}

let plantFromMoss = Plant<Moss>(plant: Moss())
let plantFormOak = Plant(plant: Oak())
let plantFormAppleTree = Plant(plant: AppleTree())
let plantFormAppleFruit = Plant(plant: AppleFruit())

plantFromMoss.plant.showMoss() // name: Moss, price: 100
plantFormOak.plant.showOak() // name: Oak, branch: 500
plantFormAppleTree.plant.showAppleTree() // kingdom: Platae, isFruit: false
plantFormAppleFruit.plant.showAppleFruit()
/*
kingdom: Platae, isFruit: true
name: Apple, price: 30
*/

plantFormAppleFruit.plant.price = 80
plantFormAppleFruit.plant.showAppleFruit()
/*
kingdom: Platae, isFruit: true
name: Apple, price: 80
*/



let plantFormAppleFruitButCreateToAppleTree = Plant<AppleTree>(plant: AppleFruit())

// error: value of type 'AppleTree' has no member 'showAppleFruit'
// plantFormAppleFruitButCreateToAppleTree.plant.showAppleFruit()

plantFormAppleFruitButCreateToAppleTree.plant.showAppleTree() // kingdom: Platae, isFruit: true
plantFormAppleFruit.plant.showAppleTree() // kingdom: Platae, isFruit: true


//------------------------------------------
// Extending a Generic Type
//------------------------------------------

/*
เวลาจะ extension ไม่ต้องระบุ type
    extension Stack {
        var topItem: Element? {
            return items.isEmpty ? nil : items[items.count - 1]
        }
    }

    if let topItem = stackOfStrings.topItem {
        print("The top item on the stack is \(topItem).")
    }
    // Prints "The top item on the stack is tres."

*/

extension Plant: Equatable where T: Equatable {
    static func == (first: Plant, second: Plant) -> Bool {
        return first.plant == second.plant
    }
}

//  note: requirement from conditional conformance of 'Plant<AppleTree>' to 'Equatable'
// print(plantFormAppleTree == plantFormAppleFruitButCreateToAppleTree)

extension AppleTree: Equatable{
    static func == (first: AppleTree, second: AppleTree) -> Bool {
        return first.kingdom == second.kingdom
    }
}

print(plantFormAppleTree == plantFormAppleFruitButCreateToAppleTree) // true

// error: binary operator '==' cannot be applied to operands of type 'Plant<AppleFruit>' and 'Plant<AppleTree>'
// print(plantFormAppleFruit == plantFormAppleTree) // 


print(plantFormAppleFruit == plantFormAppleFruit) // true





class Electronic<T>{
    var item: T
    init(item: T){
        self.item = item
    }

    func show(){
        print("Electronic")
    }
}
class Bluetooth<T>: Electronic<T>{
    func say(){
        print("Bluetooth")
    }
}

class Computer{
    var ram = 1
    init(){}
    func show(){
        print("Computer")
    }
    func getRam() -> Int{
        return self.ram
    }
}

class Phone: Bluetooth<Computer>{}

let someElectronic = Electronic(item: "elec elec")
let someComputer = Computer()

let somePhone = Phone(item: someComputer)
somePhone.show() // Electronic
// print(somePhone.getRam()) // error: value of type 'Phone' has no member 'getRam'

class SmartPhone: Bluetooth<Computer>{
    override func show(){
        print("SmartPhone")
    }
}
let someSmartPhone = SmartPhone(item: someComputer)
someSmartPhone.show() // SmartPhone


class Harddisk{
    var spin = 1000
}

// error: cannot convert value of type 'Computer' to expected argument type 'Harddisk'
// let electronicFromHarddisk = Electronic<Harddisk>(item: someComputer)

let electronicFromHarddisk = Electronic<Harddisk>(item: Harddisk())
print(type(of:electronicFromHarddisk)) // Electronic<Harddisk>
electronicFromHarddisk.show() // Electronic

// error: value of type 'Electronic<Harddisk>' has no member 'spin'
// print(electronicFromHarddisk.spin) 

class Camera{
    var canRecord = true
}
class Printer: Camera{
    var canPrint = true
}
class XPad: Bluetooth<Printer>{
    
    override func show(){
        print("Not Ipad")
    }
}

//error: cannot convert value of type 'Electronic<String>' to expected argument type 'Printer'
// let newXpad = XPad(item: someElectronic)
let newXpad = XPad(item: Printer())
print(type(of:(newXpad))) // XPad
newXpad.say() // Bluetooh
newXpad.show() // Not Ipad

// error: value of type 'XPad' has no member 'canPrint'
// print(newXpad.canPrint)

enum Sandwich<Ingredient>{
    case banana
    case customerChoice(Ingredient)
    
    var serve: String{
        switch self{
            case .customerChoice(let ingredients):
                return "Sandwich with \(ingredients)"

            case .banana:
                return "Banana Sandwich"
        }
    }

}


let mySandwich = Sandwich.customerChoice("🥥").serve
print(mySandwich) // Sandwich with 🥥



//------------------------------------------
// Type Constraints
//------------------------------------------

/*
ตัวอย่าง dictionary มี key, value โดยที่ key จะต้อง hashable(conform to hashable protocol)
เพราะฉะนั้นเมื่อจะทำเป็น type constriant ว่า key จะต้องเป็น hashable
*/

//------------------------------------------
// Type Constraint Syntax
//------------------------------------------

/*
จากตัวอย่างด้านล่าง T inherit จาก SomeClass ส่วน U conform to SomeProtocol protocol
    func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
        // function body goes here
    }
*/

//------------------------------------------
// Type Constraints in Action
//------------------------------------------

/*
    func findIndex(ofString valueToFind: String, in array: [String]) -> Int? {
        for (index, value) in array.enumerated() {
            if value == valueToFind {
                return index
            }
        }
        return nil
    }


    let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
    if let foundIndex = findIndex(ofString: "llama", in: strings) {
        print("The index of llama is \(foundIndex)")
    }
    // Prints "The index of llama is 2"


parameter ที่รับเข้ามาไม่รู้ว่าเป็นตัวแปรอะไร ถ้าเป็น instance ของ class ที่ class นั้นไม่ได้เตรียมการเปรียบเทียบเอาไว้
จะต้อง overload operator == เอาไว้
แต่ถ้าเขียนแค่ Generic type "T" ก็ไม่มีทางรู้ว่า instance ตัวนั้นจะทำ overload operator ไว้หรือเปล่า
    func findIndex<T>(of valueToFind: T, in array:[T]) -> Int? {
        for (index, value) in array.enumerated() {
            if value == valueToFind {
                return index
            }
        }
        return nil
    }


ฉะนั้นเพื่อไม่ให้เกิดความกังวลว่า instance ที่รับเข้ามาจะ overload operator รับรองไว้ไหม ก็ทำการใส่ contraint เข้าไป
เพื่อระบุว่า Type T จะต้อง conform to Equatable protocol

    func findIndex<T: Equatable>(of valueToFind: T, in array:[T]) -> Int? {
        for (index, value) in array.enumerated() {
            if value == valueToFind {
                return index
            }
        }
        return nil
    }

    let doubleIndex = findIndex(of: 9.3, in: [3.14159, 0.1, 0.25])
    // doubleIndex is an optional Int with no value, because 9.3 isn't in the array
    let stringIndex = findIndex(of: "Andrea", in: ["Mike", "Malcolm", "Andrea"])
    // stringIndex is an optional Int containing a value of 2


*/

let listOfIntArray = [3, 4, 5, 7, 8, 2, 1, 5]

func findItem<T: Equatable>(of target: T, in array: [T]) -> Int?{
    for (index, item) in array.enumerated(){
        if (item == target){
            return index
        }
    }
    return nil
}

print(listOfIntArray) // [3, 4, 5, 7, 8, 2, 1, 5]
print(findItem(of: 3, in: listOfIntArray)) // Optional(0)
print(findItem(of: 0, in: listOfIntArray)) // nil

func midElementInArray<Element: Comparable>(array: [Element]) -> Element?{
    guard !(array.isEmpty) else { return nil }
    return array.sorted()[ (array.count - 1) / 2]
}


let sortedAndGetMidIntArray = midElementInArray(array: listOfIntArray)
print(sortedAndGetMidIntArray) // Optional(4)



protocol SumProtocol{
    static func +(first: Self, second: Self) -> Self
}

extension Int: SumProtocol{}

func addGeneric<T: SumProtocol>(_ first: T,_ second: T) -> T{
    return first + second
}

let resultFromFunctionAddGeneric = addGeneric(9, 10)
print(resultFromFunctionAddGeneric) // 19



class Bread{
    var price = 100
}
class Burger: Bread{
    var name = "Burger"
}
protocol SellProtocol{
    var sell: Int { get }
}

extension Bread: SellProtocol{
    var sell: Int{
        return price
    }
    func changePrice(to value: Int){
        self.price = value
    }
}

func sellBread<T: Bread>(bread: T){
    print("sell to ", bread.sell)
}

let someBurger = Burger()
someBurger.changePrice(to: 900)

sellBread(bread: someBurger) // sell to  900
sellBread(bread: Bread()) // sell to  100




//------------------------------------------
// Associated Types
//------------------------------------------

/*
 An associated type gives a placeholder name to a type that’s used as part of the protocol. 
*/

//------------------------------------------
// Associated Types in Action
//------------------------------------------

/*
ถ้าอยากสร้าง protocol ให้มี func/property เป็น type อะไรก็ได้โดยใช้ associatedtype
โดยควรตั้งชื่อให้มีความหมาย
    protocol Container {
        associatedtype Item
        mutating func append(_ item: Item)
        var count: Int { get }
        subscript(i: Int) -> Item { get }
    }

    struct IntStack: Container {
        // original IntStack implementation
        var items: [Int] = []
        mutating func push(_ item: Int) {
            items.append(item)
        }
        mutating func pop() -> Int {
            return items.removeLast()
        }
        // conformance to the Container protocol
        typealias Item = Int
        mutating func append(_ item: Int) {
            self.push(item)
        }
        var count: Int {
            return items.count
        }
        subscript(i: Int) -> Int {
            return items[i]
        }
    }

นำมาเขียนใหม่เป็น generic
    struct Stack<Element>: Container {
        // original Stack<Element> implementation
        var items: [Element] = []
        mutating func push(_ item: Element) {
            items.append(item)
        }
        mutating func pop() -> Element {
            return items.removeLast()
        }
        // conformance to the Container protocol
        mutating func append(_ item: Element) {
            self.push(item)
        }
        var count: Int {
            return items.count
        }
        subscript(i: Int) -> Element {
            return items[i]
        }
    }

*/


protocol AddItemProtocol{
    associatedtype Item

    var items: [Item] { get set}
    mutating func add(item: Item)
}

extension AddItemProtocol{
    mutating func add(item: Item){
        items.append(item)
    }
}

struct Library<Item>: AddItemProtocol{
    var items = [Item]()
}
var library = Library<String>()
library.add(item: "a Book")
library.add(item: "b Book")
print(library.items) // ["a Book", "b Book"]



protocol PartProtocol{
    associatedtype Part
    var part: Part? { get set }
    mutating func changePart(to: Part)
}


class Vehicle<Part>: PartProtocol{
    internal var part: Part?

    init(part: Part){
        self.part = part
    }
    
    func getPart() -> Part?{
        guard let part = self.part else { return nil }
        return part
    }

    func changePart(to value: Part){
        self.part = nil
        self.part = value
    }
}

class Battery{
    var name = "Battery"
    var batteryLevel = 100
}

let newBattery = Vehicle<Battery>(part: Battery())

print(newBattery.getPart()!.name) // Battery
print(newBattery.getPart()!.batteryLevel) // 100


let newVehicle = Vehicle<[String]>(part: ["Camera, Seat"])
print(newVehicle.getPart()!) // ["Camera, Seat"]
newVehicle.changePart(to: ["Camera, Seat", "Window", "Door"])
print(newVehicle.getPart()!) // ["Camera, Seat", "Window", "Door"]


class Door<Int>: Vehicle<Int>{
    var door = 4


    // typealias Part = Int
    override func getPart() -> Int?{
        return self.door as? Int
    }
}

let someDoorButGetBatteryInstance = Door(part: newBattery)
print(type(of:someDoorButGetBatteryInstance)) // Door<Vehicle<Battery>>
print(type(of:someDoorButGetBatteryInstance.part)) // Optional<Vehicle<Battery>>
// print(someDoorButGetBatteryInstance.part.name) // 'Vehicle<Battery>?' has no member 'name'

print(type(of:someDoorButGetBatteryInstance.door)) // Int
print(someDoorButGetBatteryInstance.door) // 4
print(someDoorButGetBatteryInstance.getPart()) // nil

let someRealDoor = Door(part : 9)
print(type(of:someRealDoor)) // Door<Int>
print(someRealDoor.part) // Optional(9)
print(someRealDoor.getPart()) // Optional(4)
print(someRealDoor.door) // 4



//------------------------------------------
// Extending an Existing Type to Specify an Associated Type
//------------------------------------------

/*
ตัว array มี properties ที่ container protocol มีครบอยู่แล้ว เลยไม่ต้อง implement อะไรเพิ่มเติม
extension Array: Container {}
*/

protocol Description{
    associatedtype Item
    var description: Item { get }
}

extension Int: Description{}
var someIntDescription = 9.description
print(someIntDescription) // 9

//------------------------------------------
// Adding Constraints to an Associated Type
//------------------------------------------

/*
    protocol Container {
        associatedtype Item: Equatable
        mutating func append(_ item: Item)
        var count: Int { get }
        subscript(i: Int) -> Item { get }
    }

*/

protocol Identify {
    associatedtype ID: Hashable, Comparable
    var id: ID { get set }
    var name: String { get set }
}

struct Profile: Identify{
    var id: ID
    var name: String
    typealias ID = Int

    // static func == (first: Profile, second: Profile) -> Bool{
    //     return first.id == second.id
    // }
    // func hash(into hasher: inout Hasher){
    //     hasher.combine(id)
    // }
}

let anakinProfile = Profile(id: 123, name: "Anakin")
print(anakinProfile.id.hashValue)
print(anakinProfile.name.hashValue)
let obiwanProfile = Profile(id: 120, name: "Obiwan")
print(anakinProfile.id > obiwanProfile.id) // true

// let boxOfProfile = [anakinProfile: "1", obiwanProfile: "2"]



//------------------------------------------
// Using a Protocol in Its Associated Type’s Constraints
//------------------------------------------

/*

SuffixableContainer adopt Container มาอีกที

    protocol SuffixableContainer: Container {
        // Suffix จะต้อง conform to SuffixableContainer โดยมีเงื่อนไขว่า Suffix.Item(associatedtype)
        // จะต้องเป็น Type เดียวกัน
        associatedtype Suffix: SuffixableContainer where Suffix.Item == Item
        func suffix(_ size: Int) -> Suffix
    }

    extension Stack: SuffixableContainer {
        func suffix(_ size: Int) -> Stack {
            var result = Stack()
            for index in (count-size)..<count {
                result.append(self[index])
            }
            return result
        }
        // Inferred that Suffix is Stack.
    }
    var stackOfInts = Stack<Int>()
    stackOfInts.append(10)
    stackOfInts.append(20)
    stackOfInts.append(30)
    let suffix = stackOfInts.suffix(2)
    // suffix contains 20 and 30



    extension IntStack: SuffixableContainer {
        func suffix(_ size: Int) -> Stack<Int> {
            var result = Stack<Int>()
            for index in (count-size)..<count {
                result.append(self[index])
            }
            return result
        }
        // Inferred that Suffix is Stack<Int>.
    }


*/

protocol DetailProtocol: Identify{
    associatedtype T: DetailProtocol where T.ID == ID
    
    func getDetail(id: ID) -> T?
}

extension Profile: DetailProtocol{
    func getDetail(id: ID) -> Profile?{
        guard (id == self.id) else { return nil }
        return self
    }
}

print(anakinProfile.getDetail(id: 122)) // nil
print(anakinProfile.getDetail(id: 123)!.name) // Anakin


protocol SpeedProtocol{
    associatedtype Speed
    associatedtype Velocity
    var speed: Speed { set get }
    func getSpeedPerSec(of: Speed) -> Velocity
}

struct CarStruct: SpeedProtocol{
    typealias Speed = Float
    typealias Velocity = String

    var speed: Speed

    func getSpeedPerSec(of: Speed) -> Velocity{
        return String(self.speed)
    }
}

protocol CarCollection{
    associatedtype Garage
    associatedtype Car: SpeedProtocol

    mutating func addCar(_ car: Car)
    // func getCar(number: Int) -> Car
    func getGarage() -> Garage
}


struct CarGarage: CarCollection{
    typealias Garage = [CarStruct]
    typealias Car = CarStruct

    var garage: Garage

    mutating func addCar(_ car: Car){
        self.garage.append(car)
    }
    func getCar(number value: Int) -> Car{
        return garage[value]
    }
    func getGarage() -> Garage{
        return self.garage
    }
    func show(){
        for car in garage{
            print(car, terminator: " ")
        }
        print()
    }
}


let papCar = CarStruct(speed: 500)
var myGarage = CarGarage(garage: [papCar, CarStruct(speed: 600)])
myGarage.addCar(CarStruct(speed: 1))

myGarage.show()
// CarStruct(speed: 500.0) CarStruct(speed: 600.0) CarStruct(speed: 1.0) 








//------------------------------------------
// Generic Where Clauses
//------------------------------------------

/*

ฟังก์ชั่นนี้มีเงื่อนไขว่า
C1, C2 ต้อง conform to Container protocol
Item ของ C1, C2 ต้องเหมือนกัน
โดยที่ Item ของ C1 conform to Equatable

    func allItemsMatch<C1: Container, C2: Container>
        (_ someContainer: C1, _ anotherContainer: C2) -> Bool
        where C1.Item == C2.Item, C1.Item: Equatable {

            // Check that both containers contain the same number of items.
            if someContainer.count != anotherContainer.count {
                return false
            }

            // Check each pair of items to see if they're equivalent.
            for i in 0..<someContainer.count {
                if someContainer[i] != anotherContainer[i] {
                    return false
                }
            }

            // All items match, so return true.
            return true
    }

    var stackOfStrings = Stack<String>()
    stackOfStrings.push("uno")
    stackOfStrings.push("dos")
    stackOfStrings.push("tres")

    var arrayOfStrings = ["uno", "dos", "tres"]

    if allItemsMatch(stackOfStrings, arrayOfStrings) {
        print("All items match.")
    } else {
        print("Not all items match.")
    }
    // Prints "All items match."

*/



func compareCarStruct<FirstCar: SpeedProtocol, SecondCar: SpeedProtocol>(_ car1: FirstCar, _ car2: SecondCar) -> String
    where FirstCar.Speed == SecondCar.Speed, FirstCar.Speed: Comparable{
    let result = (car1.speed > car2.speed) ? "The First One is Faster at \(car1.speed) > \(car2.speed)" : "The Second One is Faster @ \(car2.speed) > \(car1.speed)"
    return result
}

let whoFaster = compareCarStruct(CarStruct(speed: 500), CarStruct(speed: 520))
print(whoFaster) // The Second One is Faster @ 520.0 > 500.0




func showCar<X: CarCollection>(in array: X) -> Void
    where X.Garage: Sequence{
    for car in array.getGarage(){
        print(car)
    }
}

showCar(in: myGarage)
/*
CarStruct(speed: 500.0)
CarStruct(speed: 600.0)
CarStruct(speed: 1.0)
*/



// สร้าง struct ที่ไม่ใช่ Array แต่มี Sequence
struct AnotherCar: CarCollection{
    typealias Garage = String
    typealias Car = CarStruct

    var currentSpeed: Garage
    var currentCar: Car

    mutating func addCar(_ car: Car){
        self.currentCar = car
        self.currentSpeed = String(currentCar.speed)
    }
    func getGarage() -> Garage{
        return self.currentSpeed
    }
}

let anotherCarInstance = AnotherCar(currentSpeed: "100", currentCar: CarStruct(speed: 500))

showCar(in: anotherCarInstance)
/*
1
0
0
*/

// showCar(in: CarStruct(speed: 200))


// extend และสร้าง default กำหนดเงื่อนไข Type ของ Garage ต้องเป็น String
extension CarCollection where Garage == String{
    func getSpeedString() -> String{
        return getGarage()
    }
}

print(anotherCarInstance.getSpeedString()) // 100

// error: 'CarGarage.Garage' (aka 'Array<CarStruct>') is not convertible to 'String'
// print(myGarage.getSpeedString())



extension SpeedProtocol where Speed == Float{
    func reduceSpeedInFloat(){
        // Cast '100' เป็น Type เดียวกับ Speed
        if (self.speed >= Speed(100)){
            print("Slow Down")
        }
    }
}


anotherCarInstance.currentCar.reduceSpeedInFloat()
// Slow Down





//------------------------------------------
// Extensions with a Generic Where Clause
//------------------------------------------

/*
สามารถกำหนดเงื่อนไข where clause ใน extension ได้
เช่น ตัวอย่างด้านล่างกำหนดให้ Element conform to Equatable protocol
โดยที่ฟังก์ชั่น isTop คนที่จะมาใช้งานได้นั้น Element จะต้อง conform to Equatable protocol

    extension Stack where Element: Equatable {
        func isTop(_ item: Element) -> Bool {
            guard let topItem = items.last else {
                return false
            }
            return topItem == item
        }
    }


    if stackOfStrings.isTop("tres") {
        print("Top element is tres.")
    } else {
        print("Top element is something else.")
    }
    // Prints "Top element is tres."

    struct NotEquatable { }
    var notEquatableStack = Stack<NotEquatable>()
    let notEquatableValue = NotEquatable()
    notEquatableStack.push(notEquatableValue)
    notEquatableStack.isTop(notEquatableValue)  // Error



สามารถใช้ where เพื่อกำหนดเงื่อนไขของ extension ทั้งหมดที่สร้างขึ้นมาได้

    extension Container where Item: Equatable {
        func startsWith(_ item: Item) -> Bool {
            return count >= 1 && self[0] == item
        }
    }

    if [9, 9, 9].startsWith(42) {
        print("Starts with 42.")
    } else {
        print("Starts with something else.")
    }
    // Prints "Starts with something else."

    extension Container where Item == Double {
        func average() -> Double {
            var sum = 0.0
            for index in 0..<count {
                sum += self[index]
            }
            return sum / Double(count)
        }
    }
    print([1260.0, 1200.0, 98.6, 37.0].average())
    // Prints "648.9"

*/



protocol MoneyProtocol{
    associatedtype Currency
    // associatedtype Price
    var currency: Currency{ get }
    var amount: Float { set get }
    func getMoney() -> Float
    func sum<M: MoneyProtocol>(in: M) -> Float
        where M.Currency == Currency
}

protocol TradableProtocol{
    associatedtype Item
    // associatedtype Price
    var item: Item{set get}
    var price: Float { set get}

    func getItem() -> Item
    func getPrice() -> Float
}

protocol MarketProtocol{
    func buy<T: TradableProtocol, M: MoneyProtocol>(product: T, with money: M) -> T?
        // where M.Price == T.Price
    func sell<T: TradableProtocol, M: MoneyProtocol>(product: T, for money: inout M)
        // where M.Currency: TradableProtocol
}

struct BahtCurrency: MoneyProtocol{
    typealias Currency = String
    typealias Price = Float

    var currency: Currency
    var amount: Price

    func getMoney() -> Price{
        return self.amount
    }
    func sum<M: MoneyProtocol>(in bag: M) -> Price{
        return self.getMoney() + bag.getMoney()
    }
}

struct ItemForSell: TradableProtocol{
    internal var item: String
    var price: Float

    func getItem() -> String{
        return self.item
    }
    func getPrice() -> Float{
        return self.price
    }
}

extension MoneyProtocol{
    mutating func changeAmount(to value: Float){
        self.amount = value
    }
}

struct MiniMart<Item>:MarketProtocol{
    var item = [Item]()


    func buy<T: TradableProtocol, M: MoneyProtocol>(product: T, with money: M) -> T? {
        guard (money.getMoney() > product.getPrice()) else{ return nil }
        return product
    }
    
    func sell<T: TradableProtocol, M: MoneyProtocol>(product: T, for money: inout M){
        money.changeAmount(to: product.getPrice() + money.getMoney())
    }
    
    func getItem(number: Int) -> Item{
        return item[number]        
    }
}

extension MoneyProtocol where Currency == String{
    func showMoney(){
        print(amount)
    }
}




var thaiBaht = BahtCurrency(currency: "Baht", amount: 1000)
thaiBaht.showMoney() // 1000.0

var someMiniMart = MiniMart(item: [ItemForSell(item: "Hamburger", price: 30), ItemForSell(item: "Pizza", price: 120)])

let someHamburger = someMiniMart.getItem(number: 0)
print(someHamburger) // ItemForSell(item: "Hamburger", price: 30.0)

if let basketMiniMart = someMiniMart.buy(product: someHamburger, with: thaiBaht){
    print(basketMiniMart) //ItemForSell(item: "Hamburger", price: 30.0)
} 

someMiniMart.sell(product: someHamburger, for: &thaiBaht)
thaiBaht.showMoney() // 1030.0




protocol OperatorProtocol{
    associatedtype Element
    func powerTwoInt() -> Self
    func sumInt() -> Int
}

extension Array: OperatorProtocol where Element == Int{
    func powerTwoInt() -> Array{
        let result = self.map{ $0 * 2}
        return result
    }
    func sumInt() -> Int{
        // return reduce(0) { ($0 as Int) + ($1 as Int) }
        return reduce(0) { $0 + $1 }
    }
}

let multiplyIntArray = [1, 2, 3].powerTwoInt()
print(multiplyIntArray) // [2, 4, 6]

let sumOfArrayInt = [1, 2, 3].sumInt()
print(sumOfArrayInt) // 6


extension Array where Element == String{
    func countCharInString() -> Int{
        return reduce(0, { $0 + $1.count })
    }
}

print(["a", "bc", "de", "f", "ghe"].countCharInString()) // 9

extension Array where Element == String {
    func wordCountPerChar() -> [Int]{
        let result:[Int] = self.map{ $0.count }
        return result
    }
}

print(["a", "bc", "de", "f", "ghe"].wordCountPerChar()) // [1, 2, 2, 1, 3]



//------------------------------------------
// Contextual Where Clauses
//------------------------------------------

/*
หรือจะแยก where ไว้ในแต่ละตัวฟังก์ชั่นที่เขียนเพิ่มขึ้นมาก็ทำได้
    extension Container {
        func average() -> Double where Item == Int {
            var sum = 0.0
            for index in 0..<count {
                sum += Double(self[index])
            }
            return sum / Double(count)
        }
        func endsWith(_ item: Item) -> Bool where Item: Equatable {
            return count >= 1 && self[count-1] == item
        }
    }
    let numbers = [1260, 1200, 98, 37]
    print(numbers.average())
    // Prints "648.75"
    print(numbers.endsWith(37))
    // Prints "true"


If you want to write this code without using contextual where clauses,
you write two extensions, one for each generic where clause.
The example above and the example below have the same behavior.

    extension Container where Item == Int {
        func average() -> Double {
            var sum = 0.0
            for index in 0..<count {
                sum += Double(self[index])
            }
            return sum / Double(count)
        }
    }
    extension Container where Item: Equatable {
        func endsWith(_ item: Item) -> Bool {
            return count >= 1 && self[count-1] == item
        }
    }


*/


extension Array{
    func reverseAll() -> [String] where Element == String{
        return self.map { String($0.reversed())}
    }
    func reverseAll() -> [Int] where Element == Int{
        return self.reversed()
    }
}

print([1, 2, 3, 4 ,5].reverseAll()) // [5, 4, 3, 2, 1]
print(["1, 2, 3, 4 ,5"].reverseAll()) // ["5, 4 ,3 ,2 ,1"]



//------------------------------------------
// Associated Types with a Generic Where Clause
//------------------------------------------

/*
    protocol Container {
        associatedtype Item
        mutating func append(_ item: Item)
        var count: Int { get }
        subscript(i: Int) -> Item { get }

// associatedtype สามารถใส่ where clause ได้
        associatedtype Iterator: IteratorProtocol where Iterator.Element == Item
        func makeIterator() -> Iterator
    }

// หรืออย่างในตัวอย่าง protocol inherit protocol
// โดยมีเงื่อน Item ต้อง conform to Comparable ก็สามารถใช้ where clause กำหนดได้
    protocol ComparableContainer: Container where Item: Comparable { }

*/

protocol AnimalProtocol{
    associatedtype Food where Food == String
    associatedtype Life
    var size: Int { get }
    func eat() -> Food
}

protocol DogProtocol: AnimalProtocol where Life == String{
    associatedtype Owner
    func walkWith() -> Owner
}

struct DogStruct: DogProtocol{
    typealias Food = String
    typealias Life = String
    typealias Owner = String

    
    var name: Life
    var weight: Int
    var food: Food
    var owner: Owner
    var size: Int{
        return self.weight
    }

    func eat() -> Food{
        return self.food
    }

    func walkWith() -> Owner{
        return self.owner
    }
}


struct MyIterator<T>: Sequence, IteratorProtocol{
    var list:[T]
    var start: Int
    var count: Int{
        return list.count
    }

    mutating func makeIterator() -> MyIterator{
        start = 0
        return self
    }

    mutating func append(_ element: T){
        list.append(element)
    }

    mutating func remove(){
        self.list.removeLast()
    }

    mutating func next() -> T?{
        if (start < list.count){
            let oldPosition = start
            start += 1
            return list[oldPosition]
        }
        return nil
    }
}


class Animal: AnimalProtocol{
    typealias Food = String
    typealias Life = MyIterator<String>

    var life: Life
    var food: Food = "Grass"
    var size: Int{
        return self.life.count
    }
    
    init(life: Life){
        self.life = life
    }

    func eat() -> Food{
        return self.food
    }

}


let someDog = DogStruct(
            name: "Valon", weight: 20, food: "Beef", owner: "Susan"
            )

print(someDog.size) // 20
print(someDog.walkWith()) // Susan
print(someDog.eat()) // Beef

var farmAnimal = MyIterator(list: ["Dog", "Car", "Pig", someDog.name], start: 0)


var someAnimal = Animal(life: farmAnimal)
someAnimal.life.append("Bird")

while let num = someAnimal.life.next() { 
    print(num)
}
/*
Dog
Car
Pig
Valon
Bird
*/





//------------------------------------------
// Generic Subscripts
//------------------------------------------

/*
Indices ต้อง conform to Sequence protocol โดยมีเงื่อนไขว่า Indices.Iterator.Element เป็น Int
    extension Container {
        subscript<Indices: Sequence>(indices: Indices) -> [Item]
            where Indices.Iterator.Element == Int {
                var result: [Item] = []
                for index in indices {
                    result.append(self[index])
                }
                return result
        }
    }

*/


struct MyDictionary<Key: Hashable, Value>{
    var data: [Key: Value]

    subscript<S>(key: Key) -> S?{
        get{
            return data[key] as? S
        }
        // set(newValue){
        //     data[key] = newValue as! Value
        // }
    }
}

let someStringData = MyDictionary(data: ["A": "Alien", "B": "Ball", "C": "Cat"])
// if let result = someStringData["B"]{
//     print(result)
// }

print(someStringData["B"]!) 

protocol GenericSubscriptProtocol{
    associatedtype ElementType
    subscript(index: Int) -> ElementType { get }
}

struct GenericCanSubscript<T>: GenericSubscriptProtocol{
    var data: [T]

    subscript (index: Int) -> T{
        return data[index]
    }
}

var gasContainer = GenericCanSubscript(data: ["Methane", "Ethane", "Propane"])
print(gasContainer[2]) // Propane

var gasContainerHaveInt = GenericCanSubscript(data: ["Methane", 2, "Propane"])
print(gasContainerHaveInt[1]) // 2



struct Matrix<ElementType>: GenericSubscriptProtocol{
    var data: [[ElementType]]
    
    subscript(x: Int) -> ElementType{
        get{
            // return first element
            return data[0][0]
        }
    }
    subscript(x: Int, y: Int) -> ElementType{
        get{
            return data[x][y]
        }
        set{
            data[x][y] = newValue
        }
    }
}

var someMatrix = Matrix(
    data: [[1, 2], [3, 4], [5, 6]]
    )

print(someMatrix[1, 1]) // 4
someMatrix[1, 1] = 90
print(someMatrix[1, 1]) // 90




protocol StorageProtocol{
    associatedtype Item
    var items: [Item] { set get }
    var size: Int { get }

    mutating func add(item: Item)
    mutating func remove() -> Item
    func showCurrentItem() -> [Item]
    subscript(index: Int) -> Item { get }

    associatedtype List: IteratorProtocol where List.Element == Item
    func makeIterator() -> List
}

extension StorageProtocol{
    subscript(c: Character) -> Item?{
        return nil
    }

    subscript(key: String) -> Item?
        where Item == String{
        for (index, item) in showCurrentItem().enumerated(){
            if (key == item){
                return self[index]
            }
        }
        return nil
    }

    subscript<Indices: Sequence>(indices: Indices) -> [Item]
        where Indices.Iterator.Element == Int{
            var result = [Item]()
            for index in indices{
                result.append(self.items[index])
            }
            return result
    }
}


struct Storage: StorageProtocol{
    typealias Item = String
    typealias List = MyIterator<String>

    var items: [Item]
    var list: List
    var size: Int{
        return items.count
    }

    init(item: [Item]){
        self.items = item
        self.list = MyIterator(list: item, start: 0)
    }

    mutating func add(item: Item){
        self.items.append(item)
        self.list.append(item)
    }

    mutating func remove() -> Item{
        let result = self.items.removeLast()
        self.list.remove()
        return result
    }

    func showCurrentItem() -> [Item]{
        return self.items
    }

    subscript(index: Int) -> Item{
        return items[index]
    }

    func makeIterator() -> List{
        return list
    }

}   

var someStorage = Storage(item: ["Melon", "Mango", "Apple"])
someStorage.add(item: "Banana")
someStorage.add(item: "Coconut")
let removeFromStorage = someStorage.remove()
print(removeFromStorage) // Coconut

while let item = someStorage.list.next(){
    print(item)
}
/*
Melon
Mango
Apple
Banana
*/


print(someStorage[1]) // Mango
print(someStorage[[1, 2]]) // ["Mango", "Apple"]
if let item = someStorage["Apple"]{
    print(item)
}
// Apple