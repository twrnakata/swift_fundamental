//------------------------------------------
// Automatic Reference Counting
//------------------------------------------

/*
    [unowned self] เมื่อ self ต้องไม่เป็น nil

    [weak self] เมื่อ self มีโอกาสเป็น nil 
*/

//------------------------------------------
// How ARC Works
//------------------------------------------

/*
ปกติเวลาสร้าง instance ของ class คือกำลังสร้าง reference ที่กำลังชี้ไปยัง instance ของ class
โดย reference ที่สร้างโดย default จะเป็น strong reference
*/

//------------------------------------------
// ARC in Action
//------------------------------------------

/*
    class Person {
        let name: String
        init(name: String) {
            self.name = name
            print("\(name) is being initialized")
        }
        deinit {
            print("\(name) is being deinitialized")
        }
    }


// สร้าง instance ขึ้นมาเพื่อชี้ไปที่เดียวกัน
    var reference1: Person?
    var reference2: Person?
    var reference3: Person?

    reference1 = Person(name: "John Appleseed")
    // Prints "John Appleseed is being initialized"

    reference2 = reference1
    reference3 = reference1

//  instance ของ Person ยังอยู่ถึงแม้จะกำหนดให้ refecence1 เป็น nil เพราะยังมี reference2, reference3 ชี้อยู่
// จนกระทั่ง reference ทั้ง 3 เป็น nil Person ถึงจะถูกคืนพื้นที่
    reference1 = nil

    reference2 = nil
    reference3 = nil
    // Prints "John Appleseed is being deinitialized"

*/

//------------------------------------------
// Strong Reference Cycles Between Class Instances
//------------------------------------------

/*
ปัญหาจะเกิดขึ้นเพราะ strong reference ชี้กันไปชี้กันมา

    class Person {
        let name: String
        init(name: String) { self.name = name }
        var apartment: Apartment?
        deinit { print("\(name) is being deinitialized") }
    }

    class Apartment {
        let unit: String
        init(unit: String) { self.unit = unit }
        var tenant: Person?
        deinit { print("Apartment \(unit) is being deinitialized") }
    }


// john และ unit4A ที่ถูกสร้างขึ้นมาเป็น Strong reference
    var john: Person?
    var unit4A: Apartment?


    john = Person(name: "John Appleseed")
    unit4A = Apartment(unit: "4A")

    john!.apartment = unit4A
    unit4A!.tenant = john

// ปัญหาคือถ้า john = nil จะต้องคืนพื้นที่ แต่ unit4A ยังชี้มายัง Apartment ของ john อยู่ ทำให้ยังคืนพื้นที่ไม่ได้
    john = nil
    unit4A = nil
// ถึงแม้ unit4A = nil ก็จะคืนไม่ได้ เพราะ strong ref ของ john ยังชี้ไปที่ unit4A อยู่
// การชี้กันไปชี้กันมาเรียกว่า Strong Reference Cycles
// วิธีแก้ปัญหาคือ ต้องทำให้ตัวใดตัวนึงไม่เป็น strong ref(week, unowned)

*/





class Chicken{
    let name = "Chicken"
    var egg: Egg?
    init(){}
    
    deinit{
        print("\(name) is dead")
    }
}

class Egg{
    var number = 10
    var hen: Chicken?

    deinit{
        print("Total egg \(number) has been deleted")
    }
}

var chic: Chicken? = Chicken()
var eight: Egg? = Egg()

// ยังไม่ผูกกัน
print(chic?.egg?.number) // nil
chic!.egg = eight
print(chic!.egg!.number) // 10
print(eight?.hen?.name) // nil

chic = nil
// Chicken is dead
print(chic?.egg?.number) // nil
eight = nil
// Total egg 10 has been deleted

// นำมาผูกกัน
chic = Chicken()
eight = Egg()
chic!.egg = eight
eight!.hen = chic
print(chic?.egg?.number) // Optional(10)
print(eight?.hen?.name) // Optional("Chicken")
chic = nil
eight = nil
// nothing happen




class BirdClass{
    var canFly: Bool = false
    var chicken: Chicken?

    init(){}

    deinit{
        print("some bird has dead")
    }
}

var someBird: BirdClass? = BirdClass()
someBird!.chicken = chic

print(someBird?.chicken?.egg?.number) // nil
someBird = nil
// some bird has dead

someBird = BirdClass()
var anotherChic: Chicken? = Chicken()
var anotherEgg: Egg? = Egg()

anotherChic!.egg = anotherEgg
someBird!.chicken = anotherChic

print(someBird!.chicken!.egg!.number) // 10
anotherEgg = nil
print(someBird!.chicken!.egg!.number) // 10
anotherChic = nil
print(someBird!.chicken!.name) // Chicken

someBird = nil
/*
some bird has dead
Chicken is dead
Total egg 10 has been deleted
*/


class NewBirdClass{
    var canFly: Bool = false
    var chicken: Chicken?
    var farm: Farm?

    init(){}

    deinit{
        print("some bird has dead")
    }
}

class Farm{
    var bird: NewBirdClass?
    init(){}

    deinit{
        print("no more farm")
    }
}

var newBird: NewBirdClass? = NewBirdClass()
var newFarm: Farm? = Farm()
var newChick: Chicken? = Chicken()
var newEgg: Egg? = Egg()

newChick!.egg = newEgg
newEgg!.hen = newChick
newBird!.chicken = newChick

newBird!.farm = newFarm
newFarm!.bird = newBird


print(newFarm!.bird!.chicken!.egg!.number) // 10
newFarm = nil
newEgg = nil
newChick = nil
newBird = nil
// nothing happen





//------------------------------------------
// Resolving Strong Reference Cycles Between Class Instances
//------------------------------------------

/*
Weak References จะชี้ไปที่ nil ได้
unowned reference จะไม่สามารถเป็น nil ได้


//------------------------------------------
// Weak References(เป็น nil ได้)
//------------------------------------------


    class Person {
        let name: String
        init(name: String) { self.name = name }
        var apartment: Apartment?
        deinit { print("\(name) is being deinitialized") }
    }

    class Apartment {
        let unit: String
        init(unit: String) { self.unit = unit }
        **weak var tenant: Person?
        deinit { print("Apartment \(unit) is being deinitialized") }
    }


    var john: Person?
    var unit4A: Apartment?

    john = Person(name: "John Appleseed")
    unit4A = Apartment(unit: "4A")

// strong ชี้ไปที่ weak
    john!.apartment = unit4A
    unit4A!.tenant = john

    // ไม่มี strong ชี้มา john สามารถคืนพื้นที่ได้
    john = nil
    // Prints "John Appleseed is being deinitialized"
// unit4A ไม่ได้ชี้ไปที่ Apartment ของ john แล้ว


    unit4A = nil
    // Prints "Apartment 4A is being deinitialized"

// ถ้าให้ unit4A เป็น nil ก่อน john ตัว unit4A จะคืนไม่ได้เพราะมี strong ref ของ john ชี้อยู่
// john ยังสามารถใช้งาน apartment ได้อยู่ จนกกว่า john จะเป็น nil ทั้งคู่ถึงจะถูกคืนพื้นที่

*/



class Person{
    var name = "Person"

    // error: 'weak' may only be applied to class and class-bound protocol types, not '[Person]'
    // weak var friend: [Person]?
    weak var friend: Person?

    init(){}
    init(name: String){
        self.name = name
    }

    deinit{
        print("Person name \(name) die")
    }

}

var mark: Person? = Person(name: "Mark")
var naj: Person? = Person(name: "Naj")
// mark!.friend = Person(name: "Naj")
mark!.friend = naj
naj!.friend = mark

print(mark!.name)
print(mark?.friend?.name) // Optional("Naj")
print(naj?.friend?.name) // Optional("Mark")
naj = nil // Person name Naj die
print(mark?.friend?.name) // nil


class Student{
    var id: String = "1"
    var student: Person?
    init(id: String){
        self.id = id
    }

    deinit{
        print("delete Student ID \(self.id)")
    }
}

var newStudent: Student? = Student(id: "123")
var kan: Person? = Person(name: "Kan")
// สร้างตัวใหม่ ยังไม่ได้ลบตัวเก่า
mark = Person(name: "Mark") // Person name Mark die
naj = Person(name: "Naj")

mark!.friend = naj

kan!.friend = mark
newStudent!.student = kan

print(newStudent!.student!.name) // Kan

kan = nil // nothing happen

newStudent = nil
/*
delete Student ID 123
Person name Kan die
*/

print(mark?.friend?.name) // Optional("Naj")
mark = nil // Person name Mark die





class ArrayPerson{
    var name = "Person"
    
    var friend: [Person]? = nil

    init(){}
    init(name: String){
        self.name = name
    }

    deinit{
        print("Person name \(name) die")
    }
}

var somchai: ArrayPerson? = ArrayPerson(name: "Somchai")

somchai!.friend = [Person(name: "Som")]
print(somchai!.friend![0].name) // Som

somchai!.friend?.append(Person(name: "Yam"))
somchai!.friend?.append(Person(name: "Oom"))

var angle: Person? = Person(name: "Angle")
somchai!.friend?.append(angle!)

for friend in somchai!.friend!{
    print(friend.name)
}
/*
Som
Yam
Oom
Angle
*/

angle = nil // nothing happen

for friend in somchai!.friend!{
    print(friend.name)
}
/*
Som
Yam
Oom
Angle
*/


somchai = nil
/*
Person name Somchai die
Person name Som die
Person name Yam die
Person name Oom die
Person name Angle die
*/




//------------------------------------------
// Unowned References(ไม่สามารถเป็น nil)
//------------------------------------------


/*
    class Customer {
        let name: String
        var card: CreditCard?
        init(name: String) {
            self.name = name
        }
        deinit { print("\(name) is being deinitialized") }
    }

    class CreditCard {
        let number: UInt64
        **unowned let customer: Customer
        init(number: UInt64, customer: Customer) {
            self.number = number
            self.customer = customer
        }
        deinit { print("Card #\(number) is being deinitialized") }
    }

    var john: Customer?
    john = Customer(name: "John Appleseed")
    john!.card = CreditCard(number: 1234_5678_9012_3456, customer: john!)

// พอ john คืนพื้นที่ ทั้งตัว john และ card จะถูกคืนพื้นที่ทันที
    john = nil
    // Prints "John Appleseed is being deinitialized"
    // Prints "Card #1234567890123456 is being deinitialized"

*/




/*




class Engine{
    var type: String = "Electic"
    unowned var car: Car

    init(type: String, car: Car){
        self.type = type
        self.car = car
    }

    deinit{
        print("throw engine \(type)")
    }
}

class Car{
    var brand: String
    var engine: Engine?
    init(brand: String){
        self.brand = brand
    }

    deinit{
        print("delete car brand \(brand)")
    }
}


var someCar: Car? = Car(brand: "New Day")
var someEngine: Engine? = Engine(type: "Chicken", car: someCar!)
someCar!.engine = someEngine

print(someEngine!.type) // Chicken
print(someCar!.engine!.type) // Chicken
someEngine = nil // nothing happen
print(someCar!.engine!.type) // Chicken
print(someEngine?.type) // nil



var newCar: Car? = Car(brand: "Someday")
newCar!.engine = Engine(type: "Bird", car: newCar!)

newCar = nil
/*
delete car brand Someday
throw engine Bird
*/




class Teacher: Person{
    var teacherName: String
    var student: Person?
    weak var otherJob: Job?

    override init(name: String){
        self.teacherName = name

        super.init()
        self.name = teacherName
    }

    deinit{
        print("no more Teacher name : \(self.name)")
    }
}

class Job{
    var name: String
    unowned var workBy: Person

    init(name: String, workBy: Person){
        self.name = name
        self.workBy = workBy
    }

    deinit{
        print(workBy.name, "quit the job name : \(self.name)")
    }
}

var yoda: Teacher? = Teacher(name: "Yoda")
var anakin: Person? = Person(name: "Anakin")
var whiteMan: Person? = Person(name: "WhiteMan")
var delivery: Job? = Job(name: "Delivery", workBy: anakin!)
var programmer: Job? = Job(name: "Programmer", workBy: yoda!)

anakin!.friend = whiteMan
whiteMan!.friend = anakin
yoda!.friend = whiteMan


yoda!.otherJob = programmer
yoda!.student = anakin

print(yoda?.friend?.name) // Optional("WhiteMan")
print(yoda?.student?.name) // Optional("Anakin")
print(yoda?.otherJob?.name) // Optional("Programmer")
print(anakin?.friend?.name) // Optional("WhiteMan")


// ลบ anakin แต่ anakin ยังอยู่ในใจทุกคนตลอดไป
anakin = nil // strong ref to Teacher
print(yoda?.student?.name) // Optional("Anakin")
print(whiteMan?.friend?.name) // Optional("Anakin")
print(anakin?.friend?.name) // nil
print(delivery?.workBy.name) // Optional("Anakin")


whiteMan = nil // Person name WhiteMan die

yoda = nil
/*
no more Teacher name : Yoda
Person name Yoda die
Person name Anakin die
*/

print(whiteMan?.friend?.name) // nil

// Anakin เคย dellocate ไปแล้ว error
//  Attempted to read an unowned reference but object 0x564dfd65b250 was already deallocatedCurrent stack trace:
// delivery = nil

// error เหมือนกัน เพราะ yoda เคย deallocate ไปแล้ว
// programmer = nil


*/


//------------------------------------------
// Unowned Optional References
//------------------------------------------

/*
unowned สามารถเป็น optional ได้

    class Department {
        var name: String
        var courses: [Course]
        init(name: String) {
            self.name = name
            self.courses = []
        }
    }

    class Course {
        var name: String
        unowned var department: Department
        unowned var nextCourse: Course?
        init(name: String, in department: Department) {
            self.name = name
            self.department = department
            self.nextCourse = nil
        }
    }


    let department = Department(name: "Horticulture")

    let intro = Course(name: "Survey of Plants", in: department)
    let intermediate = Course(name: "Growing Common Herbs", in: department)
    let advanced = Course(name: "Caring for Tropical Plants", in: department)

    intro.nextCourse = intermediate
    intermediate.nextCourse = advanced
    department.courses = [intro, intermediate, advanced]

*/

/*
class Dungeon{
    var name: String
    var monsters: [Monster]?

    init(name: String){
        self.name = name
        self.monsters = []
    }
    
    deinit{
        print("Delete dungeon \(self.name)")
    }
}

class Monster{
    var name: String
    unowned var boss: Boss?
    
    init(name: String){
        self.name = name
    }
    
    deinit{
        print("Monster \(self.name) is dead")
    }
}

class Boss{
    var bossName: String
    unowned var servant: Monster

    init(name: String, servant: Monster){
        self.bossName = name
        self.servant = servant
    }
    
    deinit{
        print("Boss \(self.bossName) is dead")
    }
}



var newDungeon: Dungeon? = Dungeon(name: "Galleon")
var ajax: Monster? = Monster(name: "Ajax")
var bodia: Monster? = Monster(name: "Bodia")
newDungeon!.monsters?.append(ajax!)
newDungeon!.monsters?.append(bodia!)
var kam: Boss? = Boss(name: "Kam", servant: ajax!)
ajax!.boss = kam

print(ajax!.boss?.bossName) // Optional("Kam")
print(bodia!.boss?.bossName) // nil
print(kam!.servant.name) // Ajax

for monster in newDungeon!.monsters!{
    print(monster.name)
}
/*
Ajax
Bodia
*/

ajax = nil // nothing happen
print("ajax = nil")

for monster in newDungeon!.monsters!{
    print(monster.name)
}
/*
Ajax
Bodia
*/

ajax = Monster(name: "New Ajax")
// สร้าง ajax ขึ้นมาใหม่

// newDungeon และ kam ยังเก็บค่าของ Ajax เก่าไว้
print(kam!.servant.name) // Ajax


// คืนพื้นที่ให้กับ kam ที่ผูกกับ ajax
kam = nil
// Boss Kam is dead

// จะเหลือ newDungeon ที่ยังผูกกับ ajax เก่าไว้

newDungeon = nil
/*
Delete dungeon Galleon
Monster Ajax is dead
*/

// Ajax ถูกคืนพื้นที่หลัง newDungeon ถูกเซ็ตเป็น nil



*/



//------------------------------------------
// Unowned References and Implicitly Unwrapped Optional Properties
//------------------------------------------

/*
    class Country {
        let name: String
        var capitalCity: City!
        init(name: String, capitalName: String) {
            self.name = name
            self.capitalCity = City(name: capitalName, country: self)
        }
    }

    class City {
        let name: String
        unowned let country: Country
        init(name: String, country: Country) {
            self.name = name
            self.country = country
        }
    }

    var country = Country(name: "Canada", capitalName: "Ottawa")
    print("\(country.name)'s capital city is called \(country.capitalCity.name)")
    // Prints "Canada's capital city is called Ottawa"


*/



/*



class PetOwner{
    var ownerName: String
    var pet: Pet!
    init(name: String, petName: String){
        // phase 1
        self.ownerName = name

        // phase 2
        self.pet = Pet(name: petName, owner: self)
    }

    deinit{
        print("no more PetOwner")
    }
}

class Pet{
    var name: String
    unowned var owner: PetOwner

    init(name: String, owner: PetOwner){
        self.name = name
        self.owner = owner
    }
    
    deinit{
        print("Pet \(name) is dead")
    }
}

var villa: PetOwner? = PetOwner(name: "Villa", petName: "Mark")
print(villa!.pet.name) // Mark

var bill: Pet? = Pet(name: "Bill", owner: villa!)

print(bill?.owner.ownerName) // Optional("Villa")


villa = nil
/*
no more PetOwner
Pet Mark is dead
*/


// Fatal error: Attempted to read an unowned reference but object 000000000e1e2b50 was already deallocated
// print(bill?.owner.ownerName) // error

bill = nil // Pet Bill is dead




class NewPerson{
    var name: String
    weak var friend: AnotherPerson!

    init(name: String){
        self.name = name
    }

    deinit{
        print("delete NewPerson")
    }
}


class AnotherPerson{
    var name: String
    var friend: NewPerson
    init(name: String, friendName: String){
        self.name = name
        friend = NewPerson(name: friendName)
        friend.friend = self

    }

    deinit{
        print("delete AnotherPerson")
    }
}

var loan: AnotherPerson? = AnotherPerson(name: "Loan", friendName: "Kan")
print(loan!.friend.name) // Kan
loan = nil
/*
delete AnotherPerson
delete NewPerson
*/






class Player{
    var name: String
    var weapon: Weapon!

    init(name: String){
        self.name = name
    }
    init(name: String, weapon: Weapon){
        self.name = name
        self.weapon.owner = self
        self.weapon.weaponName = weapon.weaponName
    }

    deinit{
        print("no more Player name \(self.name)")
    }
}

class Slayer: Player{
    unowned var monster: Monster?
    func killMonster(){
        self.monster = nil
    }
    
    deinit{
        print("Slayer has gone")
    }

}

class Weapon{
    var weaponName: String
    unowned var owner: Player!

    init(name: String, owner: Player){
        self.weaponName = name
        self.owner = owner

        // self.owner = Player(name: owner.name, weapon: self)
// warning: instance will be immediately deallocated because property 'owner' is 'unowned'
    }

    deinit{
        print("weapon \(weaponName) is broke")
    }
}


// var grim: Slayer? = Slayer(name: "Grim", weapon: Weapon(name: "Gunslinger", owner: grim!)) // error
print(":")
var grim: Slayer? = Slayer(name: "Grim")
var gunslinger: Weapon? = Weapon(name: "Gunslinger", owner: grim!)
grim!.weapon = gunslinger
print(gunslinger?.owner.name) // Optional("Grim")

var goblin: Monster? = Monster(name: "Goblin")
// ผูก monstre ให้ grim
grim!.monster = goblin

// grim เป็น nil แต่ weapon ที่มี unowned เป็น Player กับ monster ที่ถูก Slayer ทำเป็น unowned? ยังไม่ถูกคืนพื้นที่
grim = nil
/*
Slayer has gone
no more Player name Grim
*/

//Fatal error: Attempted to read an unowned reference but object 0x55f53fffe390 was already deallocatedCurrent stack trace:
// print(gunslinger?.owner.name) 

var layton: Slayer? = Slayer(name: "Layton")
// เปลี่ยนเจ้าของอาวุธจาก grim ที่ถูกคืนพื้นที่ไปแล้วเป็น layton
gunslinger!.owner = layton

// ผูก monster ให้ layton
layton!.monster = goblin

// เรียกใช้ self.monster = nil
layton!.killMonster()
// nothing happen

gunslinger = nil // weapon Gunslinger is broke
layton = nil
/*
Slayer has gone
no more Player name Layton
*/
print("")
goblin = nil
/*
Monster Goblin is dead
*/


*/



//------------------------------------------
// Strong Reference Cycles for Closures
//------------------------------------------

/*
    class HTMLElement {

        let name: String
        let text: String?

        // closure asHTML จะเป็น ref ชี้ไปยัง closure และถ้าภายใน closure มี self
        // self ก็จะมี strong ref ชี้กลับมาที่ class

        lazy var asHTML: () -> String = {
            // กรณีที่ closure อ้างถึง properties ต้องใช้ self
            // เพื่อป้องกันกรณี capture ค่า ไม่ให้ผิดพลาด
            // เมื่อ closure อ้างถึง self หมายความว่ามี strong ref ชี้กลับไปยัง instalce ของ class
            if let text = self.text {
                return "<\(self.name)>\(text)</\(self.name)>"
            } else {
                return "<\(self.name) />"
            }
        }

        init(name: String, text: String? = nil) {
            self.name = name
            self.text = text
        }

        deinit {
            print("\(name) is being deinitialized")
        }

    }

// สร้าง instance ชื่อ heading
    let heading = HTMLElement(name: "h1")
    let defaultText = "some default text"

    // กำหนดค่า closure asHTML ให้เป็นตัวใหม่ ที่ไม่ใช่ default
    heading.asHTML = {
        return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
    }
    // asHTML ถูก update เป็นค่าใหม่

    // เรียกใช้ closure
    print(heading.asHTML())
    // Prints "<h1>some default text</h1>"

// สร้าง instance ของ HTMLElement ขึ้นมาใหม่ ทำเป็น optional
    var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")

    // เรียกใช้ asHTML ที่เป็น closure จากค่า default
    print(paragraph!.asHTML())

    // asHTML มี self ฉะนั้นจะมี strong ref ชี้กลับไปยัง instance ของ class
    // Prints "<p>hello, world</p>"

    paragraph = nil

    // ทำให้เกิด strong ref cycles วิธีแก้คือทำเป็น capture list

*/




/*






class PersonWithClosure {
    var name = "White"

    var sayHelloTo: ((String) -> Void) = { name in
        print("Hi \(name)")
    }

    lazy var changeName: (String) -> Void = { name in
        self.name = name
    }
    
    init(){}

    deinit {
        print("PersonWithClosure \(name) is dead")
    }
}

var white: PersonWithClosure? = PersonWithClosure()

white!.sayHelloTo("Max") // Hi Max
print(white!.name)
// เรียกใช้ closure ที่มี self จะทำให้ชี้ strong ref กลับไปหา instance ของ class
white!.changeName("Ten")
print(white!.name)


// white เป็น nil แต่จะยังไม่ถูกคืนค่า ต้องทำให้ closure เป็น unowned หรือ weak
white = nil
// nothing happen

print(white?.name) // nil



*/






//------------------------------------------
// Resolving Strong Reference Cycles for Closures
//------------------------------------------
//------------------------------------------
// Defining a Capture List
//------------------------------------------

/*
    lazy var someClosure = {
        // capture list ให้ใส่ก่อน parameter ของ closure และก็กำหนดว่าจะให้เป็น unowned หรือ weak

        [unowned self, weak delegate = self.delegate]
        (index: Int, stringToProcess: String) -> String in
        // closure body goes here
    }

    lazy var someClosure = {
        // ถ้าไม่มี parameter ก็เขียน capture list ก่อนที่จะ in

        [unowned self, weak delegate = self.delegate] in
        // closure body goes here
    }

*/

//------------------------------------------
// Weak and Unowned References
//------------------------------------------

/*
    class HTMLElement {

        let name: String
        let text: String?

        lazy var asHTML: () -> String = {
            // ใส่ capture list ให้เป็น unowned
            [unowned self] in
            if let text = self.text {
                return "<\(self.name)>\(text)</\(self.name)>"
            } else {
                return "<\(self.name) />"
            }
        }

        init(name: String, text: String? = nil) {
            self.name = name
            self.text = text
        }

        deinit {
            print("\(name) is being deinitialized")
        }

    }

    var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
    print(paragraph!.asHTML())
    // Prints "<p>hello, world</p>"

// closure ที่มี self ชี้กลับเป็น unowned 
    paragraph = nil
    // Prints "p is being deinitialized"


*/



/*


class PersonWithClosureAndUnowned{
    var name: String


    lazy var changeName: (String) -> Void = { [unowned self] name in
        self.name = name
    }

    lazy var getName: () -> String = { [weak self] in
        if let name = self?.name{
            return name
        }
        return "noname"
    }
    
    init(name: String){
        self.name = name
    }

    deinit {
        print("PersonWithClosureAndUnowned \(name) is dead")
    }
}

var relic: PersonWithClosureAndUnowned? = PersonWithClosureAndUnowned(name: "Relic")

print(relic!.name) // Relic
relic!.changeName("New Relic")
print(relic!.name) // New Relic
print(relic!.getName()) // New Relic

relic = nil // PersonWithClosureAndUnowned New Relic is dead

class SuperCar{
    var name: String
    var owner: PersonWithClosureAndUnowned?

    init(name: String){
        self.name = name
    }

    func showOwner(){
        let ownerName = { [weak owner, unowned self] in
            if let name = owner?.name{
                print("Super Car name \(self.name) have owner name \(name)")
            }else{
                print("[No owner]")
            }
        }

        ownerName()
    }

    deinit{
        print("Super Car \(name) was deleted")
    }
}


var astonMartin: SuperCar? = SuperCar(name: "Aston Martin")
print(astonMartin!.name) // Aston Martin
print(astonMartin!.owner) // nil
astonMartin!.showOwner() // [No owner]

var kure: PersonWithClosureAndUnowned? = PersonWithClosureAndUnowned(name: "Kure")
print(kure!.getName()) // Kure

astonMartin!.owner = kure

print(astonMartin!.owner?.name) // Optional("Kure")
astonMartin!.showOwner() // Super Car name Aston Martin have owner name Kure

// astonMartin ยังผูกอยู่กับ kure
kure = nil

astonMartin!.showOwner() // Super Car name Aston Martin have owner name Kure

astonMartin = nil
/*
Super Car Aston Martin was deleted
PersonWithClosureAndUnowned Kure is dead
*/



*/

