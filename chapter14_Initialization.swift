//------------------------------------------
// Initialization
//------------------------------------------

/*
ตอนที่จะสร้าง instance ตัว stored properties ทั้ง class, struct ต้องถูก set ให้เรียบร้อย
*/




//------------------------------------------
// Setting Initial Values for Stored Properties
//------------------------------------------

/*
Initializers
    init() {
        // perform some initialization here
    }

    struct Fahrenheit {
        var temperature: Double
        init() {
            temperature = 32.0
        }
    }
    var f = Fahrenheit()
    print("The default temperature is \(f.temperature)° Fahrenheit")
    // Prints "The default temperature is 32.0° Fahrenheit"

*/


struct FlashDrive{
    var name: String
    var storage: Int

    init(){
        name = "Flash Drive"
        storage = 64
    }
}

let miniFlashDrive = FlashDrive()
print("this \(miniFlashDrive.name) have \(miniFlashDrive.storage) GB")
// this Flash Drive have 64 GB



struct CosClass{
    var prefixCode: String
    var code: Int

    init(){
        prefixCode = "COS"
        code = 2212
    }

    var viewClass: String{
        return "\(prefixCode)" + "\(self.code)"

    }
}

let swiftLang = CosClass()
print(swiftLang.viewClass)
// COS2212



struct Cupcake{
    var name: String

    init(){
        name = "Chocolate Cupcake"
    }
    func printCupcake() -> (){
        print(self.name)
    }
}

let someCupcake = Cupcake()
someCupcake.printCupcake()
// Chocolate Cupcake



//------------------------------------------
// Default Property Values
//------------------------------------------

/*
    // จะมีทั้ง initializer และ memberwise
    struct Fahrenheit {
        var temperature = 32.0
    }

*/

struct FlashDriveWithDefault{
    var name: String = "Flash Drive"
    var storage: Int = 128
}

let chichiFlashDrive = FlashDriveWithDefault()
print("Chichi take \(chichiFlashDrive.name) that have \(chichiFlashDrive.storage) GB")
// Chichi take Flash Drive that have 128 GB


struct CarabaoDrink{
    var name = "Carabao", type = "Energy Drink"
    var price = 20
}

let energyDrink = CarabaoDrink()
print("\(energyDrink.name) is \(energyDrink.type) you can buy for \(energyDrink.price) baht")
// Carabao is Energy Drink you can buy for 20 baht


//------------------------------------------
// Customizing Initialization
//------------------------------------------

//------------------------------------------
// Initialization Parameters
//------------------------------------------

struct CurrencyConverterBahtYen{
    var money: Double

    init(fromBaht baht: Double){
        money = baht * 3.56
    }

    init(fromYen yen: Double){
        money = yen * 0.28
    }
}

let convertBahtToYen = CurrencyConverterBahtYen(fromBaht: 2_000)
print("2,000 baht to yen equal : \(convertBahtToYen.money)")

let convertYenToBaht = CurrencyConverterBahtYen(fromYen: 12_000)
print("12,000 yen to baht equal : \(convertYenToBaht.money)")




//------------------------------------------
// Parameter Names and Argument Labels
//------------------------------------------


struct Tree{
    var age, height: Int

    init(age: Int, height: Int){
        self.age = age
        self.height = height
    }
    init(seed: Int){
        self.age = seed
        self.height = seed
    }
}

let appleTree = Tree(age: 90, height: 200)
print("this tree have \(appleTree.age) and height = \(appleTree.height)")
// this tree have 90 and height = 200

let bean = Tree(seed: 0)
print("this tree have \(bean.age) and height = \(bean.height)")
// this tree have 0 and height = 0

// let someErrorTree = Tree(1, 1) // ไม่ได้ใส่ argument labels



struct Balloon{
    var name: String
    var haveGas: Bool
    var killometers: Int

    init(){
        name = "Ballon"
        haveGas = true
        killometers = 120
    }
    init(name: String, gas: Bool, km: Int){
        self.name = name
        self.haveGas = gas
        self.killometers = km
    }
}


//------------------------------------------
// Initializer Parameters Without Argument Labels
//------------------------------------------


struct Minute{
    var sec: Int
    
    init(_ min: Int){
        self.sec = (min * 60)
    }
}

let someMin = Minute(50)
print(someMin.sec) // 3000


struct Hello{
    var name: String

    init(_ name: String){
        self.name = name
    }

    var greet: String{
        return "Hello \(name)"
    }
}
let hiKante = Hello("Kante")
print(hiKante.greet)
// Hello Kante



enum Country{
    case br, th, jp
    init(_ value: String){
        switch value{
            case "Brazil":
                self = .br
            case "Thailand":
                self = .th
            default:
                self = .jp
        }
    }
}

var myCountry = Country("Brazil")
print(myCountry) // br




//------------------------------------------
// Optional Property Types
//------------------------------------------


class IDCard{
    var name: String
    var dateOfBirth: String?

    init(name: String){
        self.name = name
    }

    func showName(){
        print(self.name)
    }
    func showBirth(){
        if let date = self.dateOfBirth{
            print(date)
        }
    }
}

let makai = IDCard(name : "Makai")
makai.showName() // Makai

makai.showBirth() // ไม่แสดง
makai.dateOfBirth = "19/10/1000"
makai.showBirth() // 19/10/1000



class BottleOfCandy{
    var quantity: Int?

    func printQuantity() -> (){
        if let quantity = quantity{
            print(quantity)
        }else{
            print("No candy for you")
        }
    }
}


let sugarBear = BottleOfCandy()
sugarBear.printQuantity() // No candy for you

sugarBear.quantity = 100
sugarBear.printQuantity() // 100




//------------------------------------------
// Assigning Constant Properties During Initialization
//------------------------------------------

// ใช้ let ใน stored properties เพื่อกำหนดค่าตัวแปรเพียงครั้งเดียว
class Speaker{
    let driver: Int
    var frequency: String

    init(driver: Int, freq: String){
        self.driver = driver
        frequency = freq
    }
    func show(){
        print("driver: \(self.driver), frequency around \(frequency)")
    }
}

let microlabSpeaker = Speaker(driver: 2, freq: "15hz-20hz")
microlabSpeaker.show() // driver: 2, frequency around 15hz-20hz
microlabSpeaker.frequency = "20hz-30hz"
// microlabSpeaker.driver = 3 // *error let
microlabSpeaker.show() // driver: 2, frequency around 20hz-30hz



class Gender{
    let gender: String

    init(_ gender: String){
        self.gender = gender
    }
}

var femaleDragon = Gender("Female")
print(femaleDragon.gender) // Female
// var femaleDragon = Gender("Male") // cant change



//------------------------------------------
// Default Initializers
//------------------------------------------

class Weapon{
    var types = "Weapon-Type"
    var quantity = 1
    var canBuy = true

    func show(){
        print("Weapon :\(types), have \(quantity), can Buy this weapon? : \( (canBuy) ? "Yes" : "No")")
    }
}

let someSword = Weapon()
someSword.types = "Sword"
someSword.show()
// Weapon :Sword, have 1, can Buy this weapon? : Yes


class Dragon{
    var types = "Small"
    var size: String{
        return self.types
    }
}

let smallDragon = Dragon()
print(smallDragon.size) // Small



//------------------------------------------
// Memberwise Initializers for Structure Types
//------------------------------------------


    // ถ้าเกิด stored properties มีค่าครบแล้ว เวลาเรียกใช้ memberwise ก็ไม่จำเป็นต้องเรียกครบทุก properties
struct Electronic{
    var price = 10
    var quantity = 1   

    func getValue() -> String{
        return "price: \(price) and quantity: \(self.quantity)"
    }
}

let electronicPart = Electronic(price: 90)
print(electronicPart.getValue())
// price: 90 and quantity: 1

    // ถ้ามีครบทุกค่า สามารถสร้าง instance แบบไม่ต้องกำหนดค่าได้
let miniPart = Electronic()
print(miniPart.getValue())
// price: 10 and quantity: 1




//------------------------------------------
// Initializer Delegation for Value Types
//------------------------------------------

/*
สามารถเรียกการทำงานที่มีอยู่แล้วได้โดยไม่ต้องสร้างใหม่

    struct Size {
        var width = 0.0, height = 0.0
    }
    struct Point {
        var x = 0.0, y = 0.0
    }

    struct Rect {
        var origin = Point()
        var size = Size()
        init() {}
        init(origin: Point, size: Size) {
            self.origin = origin
            self.size = size
        }
        init(center: Point, size: Size) {
            let originX = center.x - (size.width / 2)
            let originY = center.y - (size.height / 2)
            self.init(origin: Point(x: originX, y: originY), size: size)
        }
    }


    let basicRect = Rect()
    // basicRect's origin is (0.0, 0.0) and its size is (0.0, 0.0)

    let originRect = Rect(origin: Point(x: 2.0, y: 2.0),
                          size: Size(width: 5.0, height: 5.0))
    // originRect's origin is (2.0, 2.0) and its size is (5.0, 5.0)

    let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
                          size: Size(width: 3.0, height: 3.0))
    // centerRect's origin is (2.5, 2.5) and its size is (3.0, 3.0)

*/




struct Company{
    var name: String = "Apple"
    var country = "Thailand"

    func getValue() -> String{
        return "Company Name: \(name) Made in: \(self.country)"
    }
}

struct SmartPhone{
    var name: String = "Nokia99"
    var description = Electronic()
    var manufacturer: Company = Company()

    init() {}
    init(name: String, desc: Electronic, brand: Company){
        self.name = name
        self.description = desc
        self.manufacturer = brand
    }

    init(name: String, promotion: Electronic, brand: Company){
        let salePrice = Int(Double(promotion.price) * 0.8)
        self.init(name: name,
        desc: Electronic(price: salePrice, quantity: promotion.quantity),
        brand: Company(name: brand.name, country: brand.country))
    }


    func show(){
        print("Smart Phone Name: \(self.name)")
        print(description.getValue())
        print(manufacturer.getValue())
    }

}


// สร้าง instance โดยใช้ default value
let najSmartPhone = SmartPhone()
najSmartPhone.show()
/*
Smart Phone Name: Nokia99
price: 10 and quantity: 1
Company Name: Apple Made in: Thailand
*/

// ใช้ init ตัวแรก
let markSmartPhone = SmartPhone(name: "iMark",
                                desc: Electronic(price: 9000, quantity: 1),
                                brand: Company(name: "Mark Store", country: "Thailand")
                                )

markSmartPhone.show()
/*
Smart Phone Name: iMark
price: 9000 and quantity: 1
Company Name: Mark Store Made in: Thailand
*/

// เรียกใช้ init ตัวที่สอง ที่มีการเรียกใช้ self.init
let talSmartPhone = SmartPhone(name: "noPhone",
                                promotion: Electronic(price: 1000, quantity: 1),
                                brand: Company(name: "Apple", country: "Amarica")
                                )

talSmartPhone.show()
/*
Smart Phone Name: noPhone
price: 800 and quantity: 1
Company Name: Apple Made in: Amarica
*/

print("======")





//------------------------------------------
// Class Inheritance and Initialization
//------------------------------------------


//------------------------------------------
// Designated Initializers and Convenience Initializers
//------------------------------------------


/*
หน้าที่หลักของ Designated กำหนดค่า(initialize) ค่าทุกๆ ตัวให้กับ stored properties
รวมทั้งเรียก initializer ตัว super class ด้วย
แต่ละคลาสต้องมีอย่างน้อย 1 designated init

Convenience Initializers
สามารถเรียกใช้ init ตัวอื่นที่อยู่ภายในคลาสเดียวกันได้ อยู่ที่ว่าอยากจะให้อัพเดท, กำหนดอะไรเพิ่มเติม
ซึ่ง Convenience ไม่จำเป็นต้องมีในคลาสก็ได้
*/


//------------------------------------------
// Syntax for Designated and Convenience Initializers
//------------------------------------------

/*
Designated
    init(parameters) {
        statements
    }


Convenience Initializers
    convenience init(parameters) {
        statements
    }


*/


//------------------------------------------
// Initializer Delegation for Class Types
//------------------------------------------

/*
init สำหรับ struct จะเป็นแค่เรียก init ที่อยู่ใน struct เดียวกันใช้งาน
แต่ถ้าเป็น class จะเกี่ยวข้องกับ class ที่ถูก inherit ลงมา จะมีกฎอยู่ 3 ข้อ
    กฎ 1 designated initializer จะต้องเรียกใช้ designated initializer ที่เป็น super class
inherit มาจากใครก็ต้องเรียกใช้ designated initializer ของ super class ด้วย
    กฎ 2 convenience initializer ต้องเรียกใช้ init ที่อยู่ในคลาสเดียวกัน ไม่ใช่เรียกขึ้นไป
    กฎ 3 convenience initializer ต้องเรียก designated initializer ในคลาสเดียวกัน

A simple way to remember this is:

    Designated initializers must always delegate up.
    Convenience initializers must always delegate across.(อยู่ในคลาสเดียวกันเท่านั้น)

*/


//------------------------------------------
// Two-Phase Initialization
//------------------------------------------
/*
การทำงานจะเป็นในรูปแบบของ 2 phase ตอน init
phase แรก stored properties แต่ละตัวจะต้องถูก initialize ค่าให้ครบทุกตัว ทั้งใน class ตัวเองและ super class
เหมือนกับการกำหนดค่า default ให้เรียบร้อยก่อน

หลังจากทุกตัวถูกกำหนดเรียบร้อย phase ที่ 2 ถึงจะเริ่มต้นขึ้น
initializer แต่ละตัวก็สามารถ update ค่าใน stored properties ได้***

พอครบ 2 phase การ initailize ก็จะสมบูรณ์ instance ก็จะพร้อมที่จะใช้งาน
การทำ 2 phase จะทำให้การ init value มีความปลอดภัย จะป้องกันไม่ให้ใครมีการเข้าถึง properties ก่อนการกำหนดค่าเริ่มต้น

เฟสที่ 1 จะทำการจองพื้นที่ในหน่วยความจำก่อน ขึ้นอยู่กับว่าเรียกใช้ designated หรือ convenience ภายในคลาส
ยังไม่สามารถเรียกใช้ self, methods, properties ได้
เฟสที่ 2 อัพเดทค่าต่างๆ จากบนลงมาล่าง สามารถเข้าถึง self, methods ได้แล้ว

** convenience init ต้องเรียกใช้ init ตัวอื่นให้เรียบร้อยก่อนที่จะมาอัพเดทค่าภายในตัวเอง
** สุดท้าย convenience จะต้องไปเรียก designated init (set ค่าให้กับตัเองและขึ้นไปถึง superclass บนสุด หลังจากนั้นถึงจะอัพเดทได้)



Swift’s compiler จะช่วยตรวจสอบความถูกต้องเพื่อให้มั่นใจว่า 2 phase init มีความถูกต้องสมบูรณ์


Safety check 1
    ก่อนที่จะขึ้นไปเรียก init ของ super ภายใน class ตัวเอง***ต้องมีการกำหนดค่า properties ให้ครบก่อน

Safety check 2
    ทำการ delegate up(ขึ้นไปหา super class) ขึ้นไปเรียก designated initializers ของ super class เพื่อที่จะกำหนดค่าให้ properties แต่ละตัว
    และการทำ delegate up จะต้องทำก่อนแก้ไขค่าอื่นใน class ตัวเอง ที่ไม่ใช่ค่าแรกเริ่ม

Safety check 3
    convenience initializer สามารถเรียกใช้ init ตัวอื่นได้

Safety check 4
    ถ้ายังอยู่ในช่วง first phase ตัว initilizer ไม่สามารถเรียกใช้ methods, properties, self จนกกว่าจะเสร็จ phase ที่ 1 ของการ init

instance ของ class จะยังไม่สามารถใช้ได้(valid) จนกว่าจะสิ้นสุด phase 1(เข้าถึง methods ต่างๆ เรียกใช้ self ได้)


ก่อนที่ convenience initializers จะอัพเดทค่าเป็นอย่างอื่น ต้องเรียกใช้ initializer ตัวอื่นให้ทำงานจนครบก่อน
*/


//------------------------------------------
// Initializer Inheritance and Overriding
//------------------------------------------

class Fruit{
    var name = "fruit"
    var description: String{
        return "This fruit is name \(name)"
    }
}


let myFruit = Fruit()
print(myFruit.description)
// This fruit is name fruit

class Apple: Fruit{
    // designated initializer
    // phase 1 กำหนดค่า ให้กับ properties ทุกตัวของ class ตัวเองก่อน แต่เนื่องจากไม่มี properties ก็เลยไปขั้นตอนถัดไป
    // คือการเรียก init ของ super class
    override init(){
        super.init()
        // เมื่อกำหนดค่าทุกตัวจนครบจะจบ phase 1 ก็สามารถอัพเดทค่าใหักับตัว properties ได้
        name = "Apple"
        // จบ phase 2
    }

    override var description: String{
        return super.description + " An apple is an edible fruit produced by an apple tree."
    }
}


let myApple = Apple()
print(myApple.description)
// This fruit is name Apple An apple is an edible fruit produced by an apple tree.

class Banana: Fruit{
    var color: String
    init(color: String){
        // set ค่าให้กับ properties ของตัวเองก่อน ขั้นต่อไปถึงจะเรียก init ของ super class
        // โดยจะเป็น init ตัวไหนก็ได้ เช่น default 
        self.color = color
        // หลังจากไปเรียก super ถ้าไม่ได้มีการอัพเดทอะไร จะสามารถละ super.init() ได้
        super.init()

    }

    override var description: String{
        return super.description + " yellow fruit with a thick skin and soft sweet flesh."
    }
}




class Wood{
    var types: String

    // designated
    init(){
        self.types = "[Unset]"
    }
    convenience init(types: String){
        self.init()
        self.types = "types: " + types
    }

    var wood: String{
        return "This Wood is \(types)"
    }
}


class Firewood: Wood{
    // Rule 1
    // ถ้า sub class ไม่มี** designated init อยู่เลย จะทำให้ตัว designated ที่อยู่ใน super class จะถูก inherit ลงมาทั้งหมด
}

let someFirewood = Wood()
print(someFirewood.types) // [Unset]

class Log: Wood{
    override init(){
        //  error: must call a designated initializer of the superclass 'Wood'
        // super.init(types: "SomeWood")

        super.init() // จบ phase 1
        types = "Log" // update ค่าใน phase 2
    }
}

let oldWood = Wood()
print(oldWood.types) // [Unset]

var someLog = Log()
print(someLog.types) // log


class TableWood: Log{
    var name: String
    
    override convenience init(){
        // กำหนดค่าให้ตัวเองก่อน
        self.init(name: "Noname")
        print("override convenience init() in TableWood ")
        // super.init() // super.init ถูกเรียกใน self.init(name) แล้ว
    }

    // designated
    init(name: String){
        self.name = "Samsung"
        super.init() // เรียก super designated
        print("init(name) in Tablewood \(self.wood)")
    }

}

let someTableWood = TableWood()
print("before call value in someTableWood")
/*
init(name) in Tablewood This Wood is Log
override convenience init() in TableWood 
before call value in someTableWood
*/

print(someTableWood.wood) // This Wood is Log
print(someTableWood.name) // Samsung






class Oil{
    var isBurn: Bool{
        willSet {
            print("\(newValue) is coming to set")
        }
        
        didSet {
            print("isBurn set to \(isBurn)")
        }
        
    }

    init(){
        self.isBurn = false
    }
     // convenience ไปเรียก init() ก่อนอัพเดทค่าในตัวเอง
    convenience init(burn: Bool){
        self.init()
        self.burn = burn
    }
    var burn: Bool{
        get{ return isBurn }
        set{
            self.isBurn = newValue
        }
    }
}


var convenienceOil = Oil(burn: true)
print(convenienceOil.isBurn)
/*
true is coming to set
isBurn set to true
true
*/


class Plastic: Oil{
    var types: String{
        didSet{
            print("types update to \(types)")
        }
    }

    override init(){
        // designated 
        // กำหนดค่าภายใน properties ตัวเองก่อน delegates up ไปยัง super class
        self.types = "Polycarbonate"
        super.init()
        // phase 2
        self.types = "Polycarbonate 2"
    }
    convenience init(burn: Bool, types: String){
        // super.init() // เรียกได้เฉพาะภายในคลาส
        // เรียกใช้ init ตัวอื่นก่อน มาใช้ convenience
        self.init()
        print("inside convenience init(burn, types) isBurn = ", self.isBurn)
        print("inside convenience init(burn, types) types = ", self.types)

        super.burn = burn
        self.types = types   
    }
}



let somePlastic = Plastic()
print(somePlastic.isBurn) // false
print(somePlastic.types) // Polycarbonate 2
print()

let anotherSomePlastic = Plastic(burn: true, types: "Polyethylene")
print(anotherSomePlastic.isBurn)
print(anotherSomePlastic.types)
/*
inside convenience init(burn, types) isBurn =  false
inside convenience init(burn, types) types =  Polycarbonate 2
true is coming to set
isBurn set to true
true
Polyethylene
*/


print("-------------------")


class Steel{
    var types: String{
        didSet{
            print("didSet form Steel was called")
        }
    }

    // convenience init ไปเรียก init(types) เพื่อกำหนดค่าให้ตัวเอง
    convenience init(){
        self.init(types: "Carbon Steel")
    }

    init(types: String){
        self.types = types
    }
}

let carbonSteel = Steel()
print(carbonSteel.types) // Carbon Steel

class Iron: Steel{
    var brand: String{
        didSet{
            print("didSet form Iron was called")
        }
    }
    // var brand = "IronMan"
    
    init(){
        // กำหนดค่าให้กับ designated ทีหลัง
        self.brand = "ion"


        // ลองให้ designated เรียก super convenience
        // error: must call a designated initializer of the superclass 'Steel'
        // super.init()

        // designated เรียก super designated
        super.init(types: "Alloy Steel")
    }
}


class Stainless: Steel{
    var brand = "Blackbox"{
        didSet{
            print("didSet form Stainless was called")
        }
    }

    init(){
        // เรียก designated ก่อน เนื่องจากได้มีการกำหนดค่า default value ให้กับ properties ของตัวเองไปก่อนแล้ว
        super.init(types: "Stainless Steel")

        // phase 2 อัพเดทค่า self
        self.brand = "Whitebox"
    }
}

print("-------")

let ironman = Iron()
print(ironman.types) // Alloy Steel
print(ironman.brand) // ion

let someStainless = Stainless()
print(someStainless.types) // Stainless Steel
print(someStainless.brand) // Whitebox






//------------------------------------------
// Automatic Initializer Inheritance
//------------------------------------------

/*
init ไม่ได้ inherit ลงมาโดยอัตโนมัติ ถ้าเงื่อนไขตรงกันถึงจะ inherit ลงมา

Rule 1
    ถ้า sub class ไม่มี** designated init อยู่เลย จะทำให้ตัว designated ที่อยู่ใน super class จะถูก inherit ลงมาทั้งหมด
Rule 2
    ถ้า sub class implement ตัว desinagted ทุกตัว**ของ super class โดยการ implement อาจจะขึ้นมาใหม่(implement เป็นได้ทั้ง designated, convenience)
    หรือได้มาจากกฎข้อที่ 1
ถ้ามาจากกฎข้อที่ 1 จะเหมือนกับ sub class implement ครบทุกตัวของ superclass
เมื่อเป็นกรณีดังกล่าว convenience init จะถูก inherit ลงมายัง subclass โดยอัตโนมัติ

*/


class Person{
    var name: String
    init(name: String){
        self.name = name
    }

    // default init ถูกทำเป็น convenience ซึ่งจะต้องเรียก init ตัวอื่นก่อน
    // ซึ่งสามารถเรียก init ได้แค่ภายในคลาสเดียวกันเท่านั้น
    // สุดท้าย convenience จะต้องไปเรียก designated
    convenience init(){
        // เรียก init(name) เพื่อกำหนดค่า default เป็น noname
        self.init(name: "noname")
    }

    var aboutMe: String{
        return "Hello My name is \(name)"
    }
}

let somePersonNoname = Person()
print(somePersonNoname.aboutMe)
// Hello My name is noname

let tanjiro = Person(name: "Tanjiro Yamada")
print(tanjiro.aboutMe)
// Hello My name is Tanjiro Yamada

class Sportman: Person{
    var position: String

    // designated 
    // ตามกฎจะต้องกำหนดค่าให้กับตัวเองให้ครบก่อน แล้วจึงจะเรียก init ของ super class
    init(name: String, position: String){
        self.position = position
        super.init(name: name)
    }
    
    // มี init อยู่แล้ว แต่อยากจะจัดการค่า properties ของตัวเองเมื่อเรียกใช้ init ด้วย
    // สร้าง convenience เป็น init(name) ที่ถูก override จาก super class ที่เป็น designated

    // เป็นการนำ designated ของ super class มา implement ครบทุกตัว ให้เข้ากับกฎที่กำหนดไว้
    // ในทีนี้มี 1 ตัว แปลว่า conveniece ของ superclass ก็จะถูก inherit ลงมาอัตโนมัติ
    override convenience init(name: String){
        // เรียกใช้ init ภายใน class ตัวเองที่เป็น desiganated
        self.init(name: name, position: "Center")
    }

    // จะมี init ที่เป็น cenvenience ของ Person ลงมาด้วย
    // init() {}

    // ทำให้ภายใน class นี้มี ini 3 ตัว

    override var aboutMe: String{
        return super.aboutMe + " Position: \(position)"
    }
}

let callSuperCalssInitInSubClass = Sportman()
print(callSuperCalssInitInSubClass.aboutMe)
// Hello My name is noname Position: Center

let callTwoInitNameInSubClassAndCallInSuperClass = Sportman(name: "Naj")
print(callTwoInitNameInSubClassAndCallInSuperClass.aboutMe)
// Hello My name is Naj Position: Center

let callInitInSubClassWithNormalMethod = Sportman(name: "Havartz", position: "Midfield")
print(callInitInSubClassWithNormalMethod.aboutMe)
// Hello My name is Havartz Position: Midfield


class FoolballPlayer: Sportman{
    var isPlayThisGame = false

    override var aboutMe: String{
        return super.aboutMe + " will play on this game? : \( (isPlayThisGame) ? "Yes" : "No" )"
    }

}

var chelseaTeam = [
                    // เรียกใช้ init ของ Super ที่ถูก inherit มาไว้ที่ subclass
                    FoolballPlayer(),
                    // เรียก conveninece init ก่อนไปเรียก init(name, position)
                    FoolballPlayer(name: "Mason Mount"),
                    // เรียก init(name, position)
                    FoolballPlayer(name: "Frank Lampard", position: "Midfield")
                    ]

chelseaTeam[0].name = "Lukaku"
chelseaTeam[0].isPlayThisGame = true

for player in chelseaTeam{
    print(player.aboutMe)
}
/*
Hello My name is Lukaku Position: Center will play on this game? : Yes
Hello My name is Mason Mount Position: Center will play on this game? : No
Hello My name is Frank Lampard Position: Midfield will play on this game? : No
*/






class Factory{
    var types: String = "Factory Types"

    init(){
        print("SUPER CLASS INIT() WAS CALLED FROM THE TOP")
    }
    convenience init(types: String){
        self.init()
        print("init(types) was called, \(types)")
    }
}


class ToyShop: Factory{
    var description: String

    // designated
    override init(){
        // self.types = "Toy Shop"
        // error: 'self' used in property access 'types' before 'super.init' call
        // ถึง Factory ถูกกำหนดค่า default แต่ไม่ได้เขียน init ไว้
        // ค่า types ของ Factory ถูกกำหนดหลังจากใช้งาน override init() ถ้าไม่ได้เรียก super.init()


        self.description = "Some Description"
        print("ToyShop init() was called the value is = ", self.description)
        super.init()
    }

    convenience init(desc: String){
        // phase 1 กำหนดค่าให้ properties ทุกตัวก่อน update
        self.init()

        // phase 2
        self.description = desc
    }

    // designated
    init(types: String, desc: String){
        // phase 1
        // กำหนดค่าให้ตัวเองก่อนเรียก super.init
        self.description = desc     
        super.init()
        
        // phase 2
        // update value
        self.types = types
    }

}

var someFactory = Factory(types: "Sad Factory")
// SUPER CLASS INIT() WAS CALLED FROM THE TOP
// init(types) was called, Sad Factory

var someToyShop = ToyShop(desc: "Candy Candy")
// ToyShop init() was called the value is =  Some Description
// SUPER CLASS INIT() WAS CALLED FROM THE TOP

let anotherSomeToyShop = ToyShop(types:"Candy Factory", desc:"One More Candy")
// SUPER CLASS INIT() WAS CALLED FROM THE TOP

class ToyWorker: ToyShop{
    var workername: String
    var age: Int
    /*
    ToyWaker implement designated ของ ToyShop คือ
    override init() และ init(types: String, desc: String)
    */

    // override super designated แล้วทำเป็น designated
    override init(){
        // phase 1
        self.workername = "override Worker"
        self.age = 100
        super.init()

        print("=======")
        show()
        print("=======")
    }

    // override super designated แล้วทำเป็น convenience
    // เมื่อ implement designated ครบทั้ง 2 ตัว จะทำให้ convenience บน ToyShop ลงมาด้วย
    override convenience init(types: String, desc: String){
        // phase 1
        self.init(desc: "my own convenience from ToyShop")
        
        // phase 2
        print("Inside override convenience init(types: String, desc: String)")
        print("description before assign = \(self.description)")

        self.types = types
        self.description = desc

        print("=======")
        show()
        print("=======")
    }

    convenience init(name: String, age: Int){
        self.init(types: "Choco Factory", desc:"Choco World", name: name, age: age)

        self.age = age * 2
        print("=======")
        show()
        print("=======")
    }

    init(types: String, desc: String, name: String, age: Int){
        // phase 1 กำหนดค่าให้ตัวเองก่อน
        self.workername = name
        self.age = age
        super.init(types: types, desc: desc)

        // phase 2
        self.types = types

        print("=======")
        show()
        print("=======")
    }

    func show(){
        print("types :\(self.types)| desc:\(self.description) | workername: \(self.workername) | age:\(self.age)")
    }

}

print("-----------")

let overrideInitWorker = ToyWorker()
/*
ToyShop init() was called the value is =  Some Description
SUPER CLASS INIT() WAS CALLED FROM THE TOP
=======
types :Factory Types| desc:Some Description | workername: override Worker | age:100
=======
*/

let overrideConInitWorker = ToyWorker(types: "override convenience init", desc: "second designated from super class")
/*
Inside override convenience init(types: String, desc: String)
description before assign = my own convenience from ToyShop
=======
types :override convenience init| desc:second designated from super class | workername: override Worker | age:100
=======
*/

print("*********************")
let conInitNameAgeWorker = ToyWorker(name: "own convenience", age: 900)
/*
SUPER CLASS INIT() WAS CALLED FROM THE TOP
=======
types :Choco Factory| desc:Choco World | workername: own convenience | age:900
=======
=======
types :Choco Factory| desc:Choco World | workername: own convenience | age:1800
=======
*/
print("*********************")

let normalWayWorker = ToyWorker(types: "Food Production", desc: "Companies that process raw wool", name: "Naj", age: 15)
/*
SUPER CLASS INIT() WAS CALLED FROM THE TOP
=======
types :Food Production| desc:Companies that process raw wool | workername: Naj | age:15
=======
*/









//------------------------------------------
// Failable Initializers
//------------------------------------------

/*
It’s sometimes useful to define a class, structure, or enumeration
for which initialization can fail.

You write a failable initializer by placing a question mark after the init keyword (init?).
*/


/*

    let wholeNumber: Double = 12345.0
    let pi = 3.14159

    if let valueMaintained = Int(exactly: wholeNumber) {
        print("\(wholeNumber) conversion to Int maintains value of \(valueMaintained)")
    }
    // Prints "12345.0 conversion to Int maintains value of 12345"

    let valueChanged = Int(exactly: pi)
    // valueChanged is of type Int?, not Int

    if valueChanged == nil {
        print("\(pi) conversion to Int doesn't maintain value")
    }
    // Prints "3.14159 conversion to Int doesn't maintain value"

*/

//------------------------------------------
// 
//------------------------------------------


struct Singer{
    var song = [String]()
    init?(songname: String){
        guard !songname.isEmpty else { return nil }
   
        self.song.append(songname)
    }
}


if let taylor = Singer(songname: "Spark Fly"){
    print(type(of:taylor)) // Singer เพราะ ทำ optional binding ไปแล้ว
    for songlist in taylor.song{
        print("taylor swift new album! : \(songlist)")
    }
}
// taylor swift new album! : Spark Fly

let bruno = Singer(songname: "")
print(type(of:bruno)) // Optional<Singer>
print(bruno) // nil




class IdentityCard{
    private var id: String

    init?(id: String){
        guard id.count == 11 else{ return nil }

        self.id = id
    }

    func getID() -> String{
        return self.id
    }
}

let joeIDCard = IdentityCard(id: "1251")
print(joeIDCard) // nil
print(type(of:joeIDCard)) // Optional<IdentityCard>

let johnIDCard = IdentityCard(id: "12345678910")
print(type(of:johnIDCard)) // Optional<IdentityCard>

if let getIDJohn = johnIDCard{
    print(getIDJohn.getID())
}
// 12345678910



print("=====")




//------------------------------------------
// Failable Initializers for Enumerations
//------------------------------------------

/*
    enum TemperatureUnit {
        case kelvin, celsius, fahrenheit
        init?(symbol: Character) {
            switch symbol {
            case "K":
                self = .kelvin
            case "C":
                self = .celsius
            case "F":
                self = .fahrenheit
            default:
                return nil
            }
        }
    }

    let fahrenheitUnit = TemperatureUnit(symbol: "F")
    if fahrenheitUnit != nil {
        print("This is a defined temperature unit, so initialization succeeded.")
    }
    // Prints "This is a defined temperature unit, so initialization succeeded."

    let unknownUnit = TemperatureUnit(symbol: "X")
    if unknownUnit == nil {
        print("This isn't a defined temperature unit, so initialization failed.")
    }
    // Prints "This isn't a defined temperature unit, so initialization failed."
*/

enum SpeedControl{
    case low, medium, high

    init?(_ speed: Int){
        switch speed{
            case 1...10:
                self = .low
            case 11...20:
                self = .medium
            case 21...30:
                self = .high
            default:
                return nil
        }
    }
}

if let guessMySpeed = SpeedControl(120){
    print(guessMySpeed)
}else{
    print("nil for sure")
}
// nil for sure

if let guessMySpeed = SpeedControl(25){
    print(guessMySpeed)
}else{
    print("nil for sure")
}
// high

print("=====")



//------------------------------------------
// Failable Initializers for Enumerations with Raw Values
//------------------------------------------

/*
    enum TemperatureUnit: Character {
        case kelvin = "K", celsius = "C", fahrenheit = "F"
    }

    let fahrenheitUnit = TemperatureUnit(rawValue: "F")
    if fahrenheitUnit != nil {
        print("This is a defined temperature unit, so initialization succeeded.")
    }
    // Prints "This is a defined temperature unit, so initialization succeeded."

    let unknownUnit = TemperatureUnit(rawValue: "X")
    if unknownUnit == nil {
        print("This isn't a defined temperature unit, so initialization failed.")
    }
    // Prints "This isn't a defined temperature unit, so initialization failed."

*/

// enum ที่มี rawvalue จะมี failable initializer ให้อยู่แล้ว สามารถ return nil ได้
enum Direction: String{
    case forward = "move Forward"
    case back = "move Backward"
    case left = "move Left"
    case right = "move Right"
}


if let orderMe = Direction(rawValue: "Move Forward"){
    print(orderMe)
}else{
    print("nil for sure")
}
// nil for sure

if let orderMe = Direction(rawValue: "move Left"){
    print(orderMe)
}else{
    print("nil for sure")
}
// left


print("=====")



//------------------------------------------
// Propagation of Initialization Failure
//------------------------------------------



class Account{
    let username: String
    private var password: String

    init?(username: String, password: String){
        guard !username.isEmpty , !password.isEmpty else { return nil }
        
        self.username = username
        self.password = password

    }

    var pass: String{
        let result = password.dropLast(5)
        return String(result)
    }
}

class UserAccount: Account{
    let email: String
    
    init?(username: String, password: String, email: String){
        guard !username.isEmpty , !password.isEmpty, email.count > 12 else { return nil }
        
        // phase 1
        self.email = email
        super.init(username: username, password: password)
    }
}

if let hawkeye = UserAccount(username: "hawkeye123", password: "1234567", email: "hawkeye@gmail.com"){
    print("Account :\(hawkeye.username) email:\(hawkeye.email) password start at:\(hawkeye.pass)")
}else{
    print("something wrong in this account")
}
// Account :hawkeye123 email:m@mail.com password start at:12

// nil ที่ subclasss
if let jonsnow = UserAccount(username: "john", password: "2123456", email: "jo@scom"){
    print("Account :\(jonsnow.username) email:\(jonsnow.email) password start at:\(jonsnow.pass)")
}else{
    print("something wrong in this account")
}
// something wrong in this account

// nil ที่ base class
if let bahamut = UserAccount(username: "bahamut", password: "", email: "bahamut@gmailcom"){
    print("Account :\(bahamut.username) email:\(bahamut.email) password start at:\(bahamut.pass)")
}else{
    print("something wrong in this account")
}
// something wrong in this account




//------------------------------------------
// Overriding a Failable Initializer
//------------------------------------------


/*

class Glass{
    var types: String?
    var isOneSideMirror: Bool?

    init(){}

    init?(types: String, oneSideMirror: Bool){
        guard !(types.isEmpty) else{ return nil }
        
        self.types = types
        self.isOneSideMirror = oneSideMirror
    }
    
    func getValue() -> String{
        if let types = self.types, let isOneSideMirror = self.isOneSideMirror{
            return "types: \(types), isOneSideMirror: \(isOneSideMirror)"
        }else{
            return ("have some nill in this class")
        }
    }
}

// เรียกใช้ non-failable
let defaultInitGlass = Glass()
print(defaultInitGlass.types) // nil
print(defaultInitGlass.isOneSideMirror) // nil

// assign value
defaultInitGlass.types = "Some Glass types"
print(defaultInitGlass.types) // Optional("Some Glass types")
print(defaultInitGlass.types!) // Some Glass types


// เรียกใช้ init ที่เป็น failable
if let someGlass = Glass(types: "glass", oneSideMirror: false), let nilGlass = Glass(types: "", oneSideMirror: false){
    print(someGlass.getValue())
    print(nilGlass.getValue())
}else{
    print("found nil instance")
}
// found nil instance

// เรียกใช้ init ที่เป็น failable
let someGlass = Glass(types: "glass", oneSideMirror: false)
print(someGlass!.types) // Optional("glass")
print(someGlass!.types!) // glass
print(someGlass!.isOneSideMirror) // Optional(false)
print(someGlass!.isOneSideMirror!) // false
print(someGlass!.getValue()) // types: glass, isOneSideMirror: false




class Laminated: Glass{
    var value: Int

    // non-failable init เรียกใช้ failable init
    override init(){
        
        // phase 1
        self.value = 100


        /*
        ถ้าไม่ force unwrapped
        note: propagate the failure with 'init?'
        override init(){

        super.init(types:"Laminated", oneSideMirror: false)
        */
        // failable init
        super.init(types:"Laminated", oneSideMirror: false)!
    }

    // failable init เรียกใช้ non-failable init
    convenience init?(value: Int){
        self.init()
        self.value = value
    }

    

    // non-failable init เรียกใช้ non-failable init
    init(types: String, oneSideMirror: Bool, value: Int){
        // phase 1
        self.value = value
        super.init()

        // phase 2
        self.types = types
        self.isOneSideMirror = oneSideMirror
    }
}

// non-failable init เรียกใช้ failable init
let someLaminated = Laminated()
print(someLaminated.types) // Optional("Laminated")
print(someLaminated.isOneSideMirror) // Optional(false)
print(someLaminated.value) // 100


// failable init เรียกใช้ non-failable init
let someFailableLaminated = Laminated(value: 12)
print(someFailableLaminated!.types) // Optional("Laminated")
print(someFailableLaminated!.isOneSideMirror) // Optional(false)
print(someFailableLaminated!.value) // 12



// non-failable init เรียกใช้ non-failable init
let myOwnAssignLaminated = Laminated(types: "My Laminated", oneSideMirror: false, value: 200)
print(myOwnAssignLaminated.types) // Optional("My Laminated")
print(myOwnAssignLaminated.types!) // My Laminated
print(myOwnAssignLaminated.isOneSideMirror) // Optional(false)
print(myOwnAssignLaminated.value) // 200




print("=======")



class TemperedGlass: Glass{
    override init(){
        super.init()
        self.types = "Tempered"
        self.isOneSideMirror = false
    }
    
    // base case เป็น failable แต่ override มาเป็น non-failable
    override init(types: String, oneSideMirror: Bool){
        // phase 1 กำหนดค่าและจองพื้นที่
        super.init()

        // phase 2 update value
        self.isOneSideMirror = oneSideMirror
        if types.isEmpty{
            self.types = "Tempered"
        }else{
            self.types = types
        }
    }

    // non-failable เรียก non-failable
    convenience init(brand: String){
        self.init()
        if brand == "Hi-Shield"{
            self.types = "SuperTempered Glass"
            self.isOneSideMirror = true
        }
    }
}





let someTemperedGlass = TemperedGlass()
print(someTemperedGlass.getValue())
// types: Tempered, isOneSideMirror: false

let emptyTypesTemGlass = TemperedGlass(types: "", oneSideMirror: false)
print(emptyTypesTemGlass.getValue())
// types: Tempered, isOneSideMirror: false

let anotherTemGlass = TemperedGlass(brand: "Gorilla Glass")
print(anotherTemGlass.getValue())
// types: Tempered, isOneSideMirror: false



let hishieldTemGlass = TemperedGlass(brand: "Hi-Shield")
print(hishieldTemGlass.getValue())
// types: SuperTempered Glass, isOneSideMirror: true

*/






//------------------------------------------
// The init! Failable Initializer
//------------------------------------------


/*

class Monster{
    var name: String?
    var level: Int?

    init(){}
    init?(name: String, lvl: Int){
        guard !(name.isEmpty), (lvl > 0) else{ return nil }
        self.name = name
        self.level = lvl
    }

    var monster: String{
        // if let name = name,
        // let level = level{
            return "Monster name: \(name) level: \(level)"
        // }else{
        //     return "[No Monster Data]"
        // }
    }
}


class WildMonster: Monster{
    var species: String
    
    // non-failable เรียก failable
    override init(){
        // phase 1
        self.species = "Wild"

        // failable init
        super.init(name:"Unreal", lvl: 20)!
    }
    
    override var monster: String{
        return super.monster + " Species: \(species)"
    }
}


class BeastMonster: Monster{
    var species: String

    // non-failable เรียก non-failable
    override init(){
        // phase 1
        self.species = "Beast"
        super.init()

        //phase 2
        self.name = "SuperMonster"
        self.level = 30
    }


    // implicitly unwrapped optional failable เรียก non-failable
    override init!(name: String, lvl: Int){
        guard !(name.isEmpty), (lvl > 0) else{ return nil }
  
        // phase 1 กำหนดค่าให้ตัวเองก่อน delegates up
        self.species = "BEAST"
        super.init()

        // phase 2 update value
        self.name = name
        self.level = lvl
    }

    // implicitly unwrapped optional failable เรียก failable
    init!(name: String, lvl: Int, species: String){
        guard !(name.isEmpty), (lvl > 0) else{ return nil }
        
        // phase 1
        self.species = species
        // failable init ไม่ต้องใส่ !
        super.init(name:"Mega Monster", lvl: 90)
    }


    override var monster: String{
        return super.monster + " Species: \(species)"
    }
}

// non-failable
let normalMonster = Monster()
print(normalMonster.name) // nil
print(normalMonster.level) // nil

// failable
if let someMonster = Monster(name: "OLD MONSTER", lvl : 10){
    print(someMonster.monster)
}
// Monster name: Optional("OLD MONSTER") level: Optional(10)

// non-failable เรียก failable
let wildMonster = WildMonster()
print(wildMonster.monster)
// Monster name: Optional("Unreal") level: Optional(20) Species: Wild


// non-failable เรียก non-failable
let beastMonster = BeastMonster()
print(beastMonster.monster)
// Monster name: Optional("SuperMonster") level: Optional(30) Species: Beast


// implicitly unwrapped optional failable เรียก non-failable
let impliciltyMonster = BeastMonster(name: "implicitly unwrapped optional failable", lvl: 999)
print(impliciltyMonster!.monster)
// Monster name: Optional("implicitly unwrapped optional failable") level: Optional(999) Species: BEAST

print(impliciltyMonster!.level) // Optional(999)
print(impliciltyMonster!.level!) // 999

let imMonsterLevel = impliciltyMonster!.level
print(imMonsterLevel) // Optional(999)

let unwrappedImMonsterLevel = impliciltyMonster!.level!
print(unwrappedImMonsterLevel) // 999



// implicitly unwrapped optional failable เรียก failable
let impliciltyMonsterCallFailable = BeastMonster(name: "Failable Monster", lvl: 1_000, species: "failable")
print(impliciltyMonsterCallFailable!.monster)
// Monster name: Optional("Mega Monster") level: Optional(90) Species: failable





*/



//------------------------------------------
// Required Initializers
//------------------------------------------

/*
บังคับให้ subclass มี init แบบ base class
แต่ถ้า subclass ไม่ได้ทำอะไร ก็ไม่ต้องเขียน required ก็ได้
*/

/*
class Engine{
    var engine: String

    init() {
        self.engine = "Electrical"
    }
    required init(engine: String){
        self.engine = engine
    }

    var info: String{
        return "Engine: \(engine)"
    }
}

class Vehicle: Engine {
    // ตามกฎข้อ 1 
    // ถ้า sub class ไม่มี*designated init อยู่เลย 
    // จะทำให้ตัว designated ที่อยู่ใน super class จะถูก inherit ลงมาทั้งหมด
}

class Car: Vehicle {
    var wheel: Int
    override init() {
        // phase 1
        self.wheel = 4
        super.init() // ถ้าไม่ได้แก้อะไร ไม่ต้องเขียนก็ได้
    }

    required init(engine: String){
        self.wheel = 4
        super.init(engine: engine)
        // self.engine = engine
    }

    required convenience init(engine: String, wheel: Int){
        // phase 1
        self.init()

        // phase 2
        self.engine = engine
        self.wheel = wheel
        
    }

    override var info: String{
        return super.info + " Wheel: \(self.wheel)"
    }
}

class MiniCar: Car{
    var gas: Int

    override init(){
        self.gas = 100
        super.init()
    }

    required convenience init(engine: String){
        // self.init()
        self.init(engine: engine, wheel: 4)

        // phase 2
        // self.engine = engine
    }

    // override - required convenience init(engine: String, wheel: Int)
    required init(engine: String, wheel:Int){
        self.gas = 100
        super.init()

        self.engine = engine
        self.wheel = wheel
    }

    override var info: String{
        return super.info + " Gas: \(gas)"
    }
}



let someCar = Car()
print(someCar.engine)

let someVehicle = Vehicle(engine: "Plasic")
print(someVehicle.engine) // Plasic


let hondaCar = Car(engine: "Go Honda", wheel: 6)
print(hondaCar.info) // Engine: Go Honda Wheel: 6

// required ของ Basecase: Vehicle
let miniCooper = MiniCar(engine: "S Cooper")
print(miniCooper.info) // Engine: S Cooper Wheel: 4 Gas: 100

// required ของ Car
let anotherMiniCar = MiniCar(engine: "L Cooper", wheel: 1)
print(anotherMiniCar.info) // Engine: L Cooper Wheel: 1 Gas: 100

*/





//------------------------------------------
// Setting a Default Property Value with a Closure or Function
//------------------------------------------

/*
ถ้าจะกำหนดค่าให้กับ store properties เป็นแบบ closure และ execute ภายในตัวเองเลยโดยการใช้ ()
สิ่งที่เขียนอยู่ใน closure ยังไม่จบ phase 1 สิ่งที่อยู่ใน closure จะไม่สามารถเรียก properties, method, self ได้


    class SomeClass {
        let someProperty: SomeType = {
            // create a default value for someProperty inside this closure
            // someValue must be of the same type as SomeType
            return someValue
        }()
    }



    struct Chessboard {
        let boardColors: [Bool] = {
            var temporaryBoard: [Bool] = []
            var isBlack = false
            for i in 1...8 {
                for j in 1...8 {
                    temporaryBoard.append(isBlack)
                    isBlack = !isBlack
                }
                isBlack = !isBlack
            }
            return temporaryBoard
        }()
        func squareIsBlackAt(row: Int, column: Int) -> Bool {
            return boardColors[(row * 8) + column]
        }
    }

    let board = Chessboard()
    print(board.squareIsBlackAt(row: 0, column: 1))
    // Prints "true"
    print(board.squareIsBlackAt(row: 7, column: 7))
    // Prints "false"


*/



struct MyType{
    var text = "[unset]"
    var fourPlusFour: Int = {
        let result = 4
        return result + result
    }()

    // ไม่ return, execute
    let sayHi = {
        print("oh Hello")
    }

    func getValue() -> String{
        return "String: \(text) Int: \(fourPlusFour)"
    }

    var addTwoNumbers: (Int, Int) -> Int = {
        return $0 + $1
    }
}

let instanceMyType = MyType()
print(instanceMyType.getValue())
// String: [unset] Int: 8

instanceMyType.sayHi() // oh Hello
// print(instanceMyType.sayHi)

print(instanceMyType.addTwoNumbers(instanceMyType.fourPlusFour, 2)) // 10

class MyClass{
    // get-only property
    var someText: String{
        return "SA TING"
    }
}

let instanceMyClass = MyClass()
print(instanceMyClass.someText) // SA TING


class AnotherMyClass{
    var someText: String = {
        let myText = "Value in SomeText"
        return myText
    }()

    init(){
        print("AnotherMyClass init called")
        self.someText = "Changed"
    }
}


let instanceAnotherMyClass = AnotherMyClass() // AnotherMyClass init called
print(instanceAnotherMyClass.someText) //Changed


class SubAnotherMyClass: AnotherMyClass{
    var sayHello: String = {
        return "HELLO"
    }()

    override init(){
        super.init()

        // phase 2
        someText = "NEW TEXT"
        sayHello = "HEEEEEEEEELOOOOOOOOOOOOOO"
    }
}


let instanceOfSubAnotherMyClass = SubAnotherMyClass() // AnotherMyClass init called
print(instanceOfSubAnotherMyClass.someText) // NEW TEXT
print(instanceOfSubAnotherMyClass.sayHello) // HEEEEEEEEELOOOOOOOOOOOOOO

