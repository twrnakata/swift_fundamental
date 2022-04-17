//------------------------------------------
// Access Control
//------------------------------------------

//------------------------------------------
// Modules and Source Files
//------------------------------------------

/*

Modules and Source Files

Modules เป็นกลุ่มของข้อมูล ของ code กลุ่มหนึ่ง อาจจะเป็น framework หรือ application ถ้าเกิดสร้างเป็น single unit
และ modules สามารถ import ไปใช้กับ modules อื่นๆ ได้

*/


//------------------------------------------
// Access Levels
//------------------------------------------

/*

Open access และ public access
สามารถเข้าถึงได้จาก source file ใดๆ ก็ได้ที่อยู่ใน module เดียวกัน แต่ module อื่นก็สามารถเข้าถึงได้ ถ้า import มา
ปกติจะใช้กับ class

Internal access
ภายใน module เดียวกัน สามารถเข้าถึงกันได้หมด โดย default จะเป็น Internal access

File-private access
ต้องอยู่ในไฟล์เดียวกันถึงจะเข้าถึงได้

Private access
ต้องอยู่ใน scope เดียวกันถึงจะเข้าถึงได้

*/



open class Person{
    fileprivate var name: String
    private var secretName: String?

    internal init(name: String){
        self.name = name
    }

    fileprivate init(name: String, secretName: String){
        self.name = name
        self.secretName = secretName
    }

    public func getName() -> String{
        return self.name
    }

    private func getSecretName() -> String{
        guard let secretName = self.secretName else {
            return "[unset]"
        }
        return secretName
    }
}


var naj = Person(name: "Naj")
print(naj.name) // Naj
print(naj.getName()) // Naj

var spyNaj = Person(name: "NAJ", secretName: "Moonlight Naj")
// print(spyNaj.secretName) //  error: 'secretName' is inaccessible due to 'private' protection level

//  error: 'getSecretName' is inaccessible due to 'private' protection level
// print(spyNaj.getSecretName())

extension Person{
    fileprivate func getRealName() -> String{
        return self.getSecretName()
    }
}

print(spyNaj.getRealName()) // Moonlight Naj




fileprivate struct Sword: Equatable {
    var swordName: String // internal

    func getSwordName() -> String{
        return self.swordName
    }

    public func isSameSword(with sword: Sword) -> Bool{
        if sword == self{
            return true
        }else{
            return false
        }

    }
}

// error: variable must be declared private or fileprivate because its type 'Sword' uses a fileprivate type
// var someSword = Sword(swordName: "Murasama")

fileprivate var someSword = Sword(swordName: "Murasama")
print(someSword.getSwordName())
print(someSword.isSameSword(with: someSword)) // true




//------------------------------------------
// Guiding Principle of Access Levels
//------------------------------------------

/*
โดยปกติ entity แต่ละตัว จะไม่นิยาม entity ใน term ของ entity อื่นๆ ที่ access level ต่ำกว่า
เช่น ถ้าสร้างฟังก์ชั่น ไม่สามารถมี access level สูงไปกว่า parameter กับ return types ของตัวฟังก์ชั่น
ตัวอย่าง ถ้าฟังก์ชั่น parameter และ return types เป็น private ตัวฟังก์ชั่นจะเป็น public ไม่ได้
*/




fileprivate struct Product: Equatable{
    let name: String
    var price: Double
}

/*
// ไม่มีปัญหา
fileprivate struct Cart{
    public var product: [Product] = []
*/
public struct Cart{
    // error: property must be declared fileprivate because its type uses a fileprivate type
    // public var product: [Product] = []
    
    fileprivate var product: [Product] = []
    
    func calculatePrice() -> Double{
        return product.reduce(0) { $0 + $1.price }
    }
}

private struct PrivateCart{
    public var product: [Product] = []
    
    public func calculatePrice() -> Double{
        return product.reduce(0) { $0 + $1.price }
    }
}

fileprivate var flashDrive = Product(name: "Flash Drive", price: 10) 
private var remoteControl = Product(name: "Remote Control", price: 300) 

fileprivate var privateCart = PrivateCart(product: [flashDrive, remoteControl])
print(privateCart.product[0]) // Product(name: "Flash Drive", price: 10.0)
print(privateCart.calculatePrice()) // 310.0

// error: function cannot be declared public because its parameter uses a fileprivate type
// public func isSameProduct(compare product1: Product, with product2: Product) -> Bool{
// func isSameProduct(compare product1: Product, with product2: Product) -> Bool{

fileprivate func isSameProduct(compare product1: Product, with product2: Product) -> Bool{
    if product1 == product2{
        return true
    }else{
        return false
    }
}

print(isSameProduct(compare: privateCart.product[0], with: privateCart.product[1])) // false





//------------------------------------------
// Default Access Levels
//------------------------------------------

/*
เป็น Internal
*/

//------------------------------------------
// Access Levels for Frameworks
//------------------------------------------

/*
ถ้าเป็น framework ก็ควรทำให้เป็น open หรือ public เพื่อให้คนอื่นเรียกใช้ได้
*/


//------------------------------------------
// Access Control Syntax
//------------------------------------------

/*
    public class SomePublicClass {}
    internal class SomeInternalClass {}
    fileprivate class SomeFilePrivateClass {}
    private class SomePrivateClass {}

// กรณีเป็น properties ก็ใช้ access level ได้
    public var somePublicVariable = 0
    internal let someInternalConstant = 0
    fileprivate func someFilePrivateFunction() {}
    private func somePrivateFunction() {}


// ถ้าไม่ระบุ ปกติจะเป็น internal โดย default
    class SomeInternalClass {}              // implicitly internal
    let someInternalConstant = 0            // implicitly internal

*/



public func publicPlusTwoNumber(a: Int, b: Int) -> Int{
    return a + b
}
private func privatePlusTwoNumber(a: Int, b: Int) -> Int{
    return a + b
}

fileprivate var nine = 9
private var flashDriveValue = Int(privateCart.product[0].price)

print(publicPlusTwoNumber(a: nine, b: flashDriveValue)) // 19
print(privatePlusTwoNumber(a: nine, b: flashDriveValue)) // 19



//------------------------------------------
// Custom Types
//------------------------------------------

/*

สามารถระบุให้แตกต่างกันได้ เช่นต้องการให้ class เป็น public แต่ properties เป็น access level ชนิดต่างๆ 
**ปกติ entity ที่สร้างขึ้นไม่ควรจะมี access level ที่สูงกว่าตัวที่ถูกสร้างขึ้น

    public class SomePublicClass {                  // explicitly public class
        public var somePublicProperty = 0            // explicitly public class member
        var someInternalProperty = 0                 // implicitly internal class member
        fileprivate func someFilePrivateMethod() {}  // explicitly file-private class member
        private func somePrivateMethod() {}          // explicitly private class member
    }

// default เป็น internal ตัวข้างในก็ไม่ควรจะมีอะไรที่เกิน internal
    class SomeInternalClass {                       // implicitly internal class
        var someInternalProperty = 0                 // implicitly internal class member
        fileprivate func someFilePrivateMethod() {}  // explicitly file-private class member
        private func somePrivateMethod() {}          // explicitly private class member
    }

// มี class เป็น fileprivate ตัว default ก็จะเป็น fileprivate
    fileprivate class SomeFilePrivateClass {        // explicitly file-private class
        func someFilePrivateMethod() {}              // implicitly file-private class member
        private func somePrivateMethod() {}          // explicitly private class member
    }

// คลาสเป็น private ตัวข้างใน default ก็จะเป็น private
    private class SomePrivateClass {                // explicitly private class
        func somePrivateMethod() {}                  // implicitly private class member
    }

*/


public struct Resolution{
    var width: Int
    var height: Int
}

fileprivate class Video{
    private var resolution: Resolution

    public init(resolution: Resolution){
        self.resolution = resolution
    }

    fileprivate func getResolution() -> Resolution{
        return self.resolution
    }

    public func whatResolution(){
        switch self.resolution {
        case let fullHD as Resolution where fullHD.width == 1920 && fullHD.height == 1080:
            print("Full HD")
        default:
            print("Not Full HD")
        }
        
    }
}

private var fullHD = Video(resolution:
    Resolution(width: 1920, height: 1080))


// print(fullHD.resolution) // error: 'resolution' is inaccessible due to 'private' protection level
print(fullHD.getResolution()) // Resolution(width: 1920, height: 1080)

fullHD.whatResolution() // Full HD




//------------------------------------------
// Tuple Types
//------------------------------------------

/*

กรณีเป็น tuple ก็ขึ้นอยู่กับว่าตัวต่ำสุดมี access level เป็นอะไร types ของ tuple ก็จะเท่ากับ access level นั้น

*/

private var privateNine = 9
public var publicTen = 10

var tupleNineTen = (privateNine, publicTen)
print(tupleNineTen) // (9, 10)

//------------------------------------------
// Function Types
//------------------------------------------

/*

// access level จะเป็นได้แค่ตัวต่ำสุด

จากตัวอย่างด้านล่าง someFunction มี return type เป็น private ฟังก์ชั่นนี้ก็จะมี access level ในระดับ private
    func someFunction() -> (SomeInternalClass, SomePrivateClass) {
        // function implementation goes here
    }


    private func someFunction() -> (SomeInternalClass, SomePrivateClass) {
        // function implementation goes here
    }

*/


func tranlateToTuple(a: Int, b: Int) -> (Int, Int){
    return (a, b)
}

var newTuple = tranlateToTuple(a: privateNine, b: publicTen)
print(newTuple) // (9, 10)




//------------------------------------------
// Enumeration Types
//------------------------------------------

/*
case access level ใน enum จะขึ้นอยู่กับตัว enum ถ้าตัว enum เป็น public ตัว case ก็จะเป็น public ตาม
    public enum CompassPoint {
        case north
        case south
        case east
        case west
    }

Raw Values and Associated Values
ตัว access level ของ Raw Values Associated Values อย่างน้อยต้องสูงเท่ากับ access level ของ enum
ถ้า enum เป็น internal ตัว raw value จะเป็น private ไม่ได้เพราะต่ำกว่า internal

*/



private enum PrivateThreeNumberEnum: String{
    case one = "1"
    case two = "2"
    case three = "3"
}

private class PrivateNameClass{
    private var name:String = "Private"
}


class ViewPrivate{
    func printPrivate(){
        print(PrivateThreeNumberEnum.one)
        //  error: 'name' is inaccessible due to 'private' protection level
        // print(PrivateNameClass().name)

        print(PrivateNameClass())
    }
}


ViewPrivate().printPrivate()
/*
one
testchap27.(PrivateNameClass in _59C22CD3AD1D912C6D271BFAC6C31CCC)
*/

print(PrivateThreeNumberEnum.one) // one
print(PrivateThreeNumberEnum.one.rawValue) // 1




//------------------------------------------
// Nested Types
//------------------------------------------

/*

ตัวหลักของ nested types มี access level เป็นอะไร ตัว nested ข้างในก็จะเป็นแบบนั้น
เช่นเป็น fileprivate ตัว nested ข้างในก็จะเป็น fileprivate โดยอัตโนมัติ
แต่ถ้าเป็น public หรือ internal ตัว nested ข้างในถ้าไม่ระบุก็จะเป็น internal โดยอัตโนมัติ
แต่ถ้าอยากให้ตัว nested type ข้างในเป็น public ก็ต้องเขียน public เพื่อกำหนด access level
*/


public struct PublicNestedStruct{
   private enum PrivateEnumInPublicStruct{
       case one, two, three
   } 
}

/*
 error: 'PrivateEnumInPublicStruct' is inaccessible due to 'private' protection level
print(PublicNestedStruct.PrivateEnumInPublicStruct.one)
*/


extension PublicNestedStruct{
    private func getEnumOne() -> PrivateEnumInPublicStruct{
        return PrivateEnumInPublicStruct.one
    }
}

/*
error: 'getEnumOne' is inaccessible due to 'private' protection level
print(PublicNestedStruct.getEnumOne())
*/


public struct AnotherPublicNestedStruct{
    public var name: String

    public enum PrivateEnumInPublicStruct{
        case one, two, three
    } 
}

print(AnotherPublicNestedStruct.PrivateEnumInPublicStruct.one) // one



//------------------------------------------
// Subclassing
//------------------------------------------

/*
subclass ไม่สามารถมี access level

ตัวอย่างด้านล่าง superclass(A) เป็น public subclass(B) เป็น internal ซึ่งต่ำกว่า สามารถทำได้
    public class A {
        // fileprivate ต้องอยู่ในไฟล์เดียวกันถึงจะใช้งานได้
        fileprivate func someMethod() {}
    }

    internal class B: A {
        // ถ้ามองเห็นก็สามารถ override ได้ และสามารถเปลี่ยน access level ได้
        override internal func someMethod() {}
    }


    public class A {
        fileprivate func someMethod() {}
    }

    internal class B: A {
        override internal func someMethod() {
            // เรียกใช้ someMethod ได้เพราะอยู่ในไฟล์เดียวกัน
            super.someMethod()
        }
    }



*/




open class Vehical{
    private var brand: String

    internal init(brand: String){
        self.brand = brand
    }

    fileprivate func setBrand(to value: String){
        self.brand = value
    }
    public func getBrand() -> String{
        return self.brand
    }
}

internal class Car: Vehical{
    private var speed: Int

    fileprivate init(speed: Int){
        self.speed = speed
        super.init(brand: "[unset]")
    }

    override fileprivate init(brand: String){
        var brand = brand
        if(brand == ""){
            brand = "[unset]"
        }
        self.speed = 0

        super.init(brand: brand)
    }

    // error: overriding instance method must be as accessible as its enclosing type
    // override fileprivate func getBrand() -> String{
    override internal func getBrand() -> String{
        //  error: 'brand' is inaccessible due to 'private' protection level
        // return "\(self.brand) 1 "

        return "\(super.getBrand()) 1 "
    }
}


var astonMartin = Car(brand: "Aston Martin")
print(astonMartin.getBrand()) // Aston Martin 1 




//------------------------------------------
// Constants, Variables, Properties, and Subscripts
//------------------------------------------

/*

access level ของตัว Constants, Variables, Properties, and Subscripts จะถูกกำหนดตามที่ได้ระบุไว้

เช่นสร้าง instance ของ SomePrivateClass ถ้า class นั้นเป็น private ตัว instance ที่สร้างก็จะเป็น private ด้วย
    private var privateInstance = SomePrivateClass()
*/




private class PrivateCar: Vehical{
    private var speed: Int


    init(speed: Int){
        self.speed = speed
        super.init(brand: "[unset]")
    }

    
    subscript(speed: Int) -> Int {
        get{
            return speed
        }
    }
    

}


// ไม่ยอมให้ใช้ internal กับ class ที่เป็น private
// error: variable must be declared private or fileprivate because its type 'PrivateCar' uses a private type
// var newCar = PrivateCar(speed: 100)


private var newCar = PrivateCar(speed: 100)
print(newCar.getBrand()) // [unset]
print(newCar[100]) // 100




//------------------------------------------
// Getters and Setters
//------------------------------------------

/*

access level ของ getters, setters จะอยู่ในระดับเดียวกับตัวแปรที่สร้างขึ้น
แต่สามารถกำหนด access level ให้อยู่ในระดับที่ต่ำกว่าเดิมได้

    struct TrackedString {
        // กำหนด access level ของ numberOfEdits เป็น private
        private(set) var numberOfEdits = 0

        // numberOfEdits สามารถเรียกใช้งานได้อยู่เพราะยังอยู่ใน scope เดียวกัน
        var value: String = "" {
            didSet {
                numberOfEdits += 1
            }
        }
    }

// ถ้าเรียกใช้ numberOfEdits โดยอยู่นอก scope จะใช้ set ไม่ได้ แต่จะ get ได้ เพราะกำหนด private ไว้แค่ set

    var stringToEdit = TrackedString()
    stringToEdit.value = "This string will be tracked."
    stringToEdit.value += " This edit will increment numberOfEdits."
    stringToEdit.value += " So will this one."
    print("The number of edits is \(stringToEdit.numberOfEdits)")
    // Prints "The number of edits is 3"


// กำหนด TrackedString เป็น public ทั้งหมด ก็ต้องใส่ public ให้กับตัว properties ทุกตัว ไม่งั้นจะเป็น internal โดย default
    public struct TrackedString {
        // ต้องการให้เฉพาะ set เป็น private
        public private(set) var numberOfEdits = 0
        public var value: String = "" {
            didSet {
                numberOfEdits += 1
            }
        }
        public init() {}
    }

*/



public struct DiscountPrice{
    private(set) var discount = 0{
        didSet{
            print("discount changed from \(oldValue) to \(discount)")
        }
    }

    fileprivate var computedPropertiesDiscount: Int{
        get{
            return self.discount
        }
        set{
            self.discount = newValue
        }
    }
}

var someDiscount = DiscountPrice()
print(someDiscount.discount) // 0
/*
error: cannot assign to property: 'discount' setter is inaccessible
someDiscount.discount = 10
*/

someDiscount.computedPropertiesDiscount = 50 // discount changed from 0 to 50
print(someDiscount.computedPropertiesDiscount) // 50





public struct House{
    public private(set) var name: String{
        didSet{
            print(name)
        }
    }
    private(set) var _age: Int

    public var age: Int{
        get{
            return self._age
        }
        set{
            self._age = newValue
        }
    }

    public init(name: String, age: Int){
        self.name = name
        self._age = age
    }


    public mutating func setName(to name: String){
        self.name = name
    }


}

var seo = House(name: "Seo", age: 1)
seo.age = 2
print(seo.age) // 2
seo.setName(to: "SEO") // SEO




//------------------------------------------
// Private Members in Extensions
//------------------------------------------


/*

    protocol SomeProtocol {
        func doSomething()
    }

You can use an extension to add protocol conformance, like this:


    struct SomeStruct {
        private var privateVariable = 12
    }

    extension SomeStruct: SomeProtocol {
        func doSomething() {
            print(privateVariable) // ข้อมูลเป็น private แต่อยากให้แสดงผล จากการ extension สามารถเข้าถึงได้
        }
    }

*/




fileprivate protocol PriceProtocol{
    var price: Int { get set }
    mutating func setPrice(to value: Int)
    func getPrice() -> Int
}

public struct NewProduct{
    public var name: String
    fileprivate var price: Int
    private var discount:Float = 0.05

    mutating func setPrice(to value: Int) {
        self.price = value
    }

    init(name: String, price: Int, discount: Float){
        self.name = name
        self.price = price
        self.discount = discount
    }

}


var somePublicProduct = NewProduct(name: "Laser", price: 150, discount: 0.5)

// print(somePublicProduct.discount) // error : private

extension NewProduct: PriceProtocol{
    func getPrice() -> Int{
        return self.price
    }
    func getDiscount() -> Float{
        return self.discount
    }
}

print(somePublicProduct.getPrice()) // 150

// เข้าถึง private ได้จากากรใช้ extension
print(somePublicProduct.getDiscount()) // 0.5