//------------------------------------------
// Memory Safety
//------------------------------------------

//------------------------------------------
// Understanding Conflicting Access to Memory
//------------------------------------------

/*
การเข้าถึงหน่วยความจำมีสองประเภทคือ
1.write
2.read

    // A write access to the memory where one is stored.
    // กำหนดค่าให้กับ one
    var one = 1

    // A read access from the memory where one is stored.
    // อ่านค่าของ one
    print("We're number \(one)!")

ปัญหาจะเกิดขึ้นเมื่อส่วนต่างๆ พยายามจะเข้าถึงหน่วยความจำ ณ เวลาเดียวกับที่ตำแหน่งเดียวกัน

*/


//------------------------------------------
// Characteristics of Memory Access
//------------------------------------------


/*
สิ่งที่ต้องพิจารณาคือ
1.เป็น read หรือ write
2.ช่วงเวลาที่เข้าถึง
3.ตำแหน่งในหน่วยความจำที่ถูกเข้าถึง

conflict จะเกิดขึ้นถ้าตัวที่เข้าถึง 2 ตัวเข้าถึงตรงตามเงื่อนไข
1.มีอย่างน้อยตัวนึงเป็น write
2.ทั้งสองตัวเข้าถึงในตำแหน่งเดียวกัน
3.ช่วงเวลาที่ซ้อนกัน(overlap)
    At least one is a write access or a nonatomic access.
    They access the same location in memory.
    Their durations overlap.
*ช่วงเวลาที่ซ้อนกันมีสองแบบ
1.ตั้งแต่เริ่มต้นจนสิ้นสุดไม่มีใครเข้ามาขัดจังหวะได้(instanceous)
2.ตั้งแต่เริ่มจนสิ้นสุดสามารถมีการขัดจังหวะได้(long-term)


// ตัวอย่างของ instanceous
    func oneMore(than number: Int) -> Int {
        return number + 1
    }

    var myNumber = 1
    myNumber = oneMore(than: myNumber)
    print(myNumber)
    // Prints "2"

*/



func multibyTwoFromNumber(_ value: Int) -> Int {
    return value * 2
}

var three = 3
three = multibyTwoFromNumber(three)
print(three) // 6

func multibyTwoFromNumberButInOut(_ value: inout Int){
    value *= 2
}

multibyTwoFromNumberButInOut(&three)
print(three) // 12



//------------------------------------------
// Conflicting Access to In-Out Parameters
//------------------------------------------


/*
conflict มักเกิดขึ้นตอน in-out เพราะช่วงเวลาการเปิดให้ขัดจังหวะจะนาน จากการต้องรอแก้ไข

    var stepSize = 1

    func increment(_ number: inout Int) {
        number += stepSize // read
    }

    increment(&stepSize) // write
    // Error: conflicting accesses to stepSize

วิธีแก้ conflict นี้คือสร้างอีกตัวที่ copy ค่าเดิมไว้ แล้วค่อยส่งไป update

    // Make an explicit copy.
    var copyOfStepSize = stepSize
    increment(&copyOfStepSize)

    // Update the original.
    stepSize = copyOfStepSize
    // stepSize is now 2



    func balance(_ x: inout Int, _ y: inout Int) {
        let sum = x + y
        x = sum / 2
        y = sum - x
    }
    var playerOneScore = 42
    var playerTwoScore = 30
    balance(&playerOneScore, &playerTwoScore)  // OK

    // x กับ y เป็นตัวเดียวกันและถูกเข้ากันพร้อมกัน
    balance(&playerOneScore, &playerOneScore)
    // Error: conflicting accesses to playerOneScore



*/




/*

func multibyTwoFromNumberButInOutAndMultipyByValue(_ value: inout Int){
    value *= three
}

multibyTwoFromNumberButInOutAndMultipyByValue(&three)
// Simultaneous accesses to 0xdc70000, but modification requires exclusive access.
Previous access (a modification) started at <unavailable> (0x7280238).
Current access (a read) started at:
*/

func multibyTwoFromNumberButInOutAndMultipyByValue(_ value: inout Int){
    value *= three
}

// สร้างตัวแปรมาเก็บค่าไว้อีกตัว

var backupOfThree = three
multibyTwoFromNumberButInOutAndMultipyByValue(&backupOfThree)
three = backupOfThree
print(three) // 144



func concatText(to first: inout String, from second: inout String){
    first += second
}


var hello = "hello", world = "world"
concatText(to: &hello, from: &world)
print(hello) // helloworld

/*
overlapping accesses to 'hello', but modification requires exclusive access; consider copying to a local variable
concatText(to: &hello, from: &hello)
*/

var four = 4, five = 5

func multiFourByFive(_ first: inout Int, _ second: inout Int){
    first *= second
}

multiFourByFive(&four, &five) // result: 4 *= 5
print("four:", four, "five:", five) // four: 20 five: 5

var six = 6

func calByClosure(_ value: inout Int, closure: (inout Int) -> ()){
    closure(&value)
}
/*

เกิด conflict เมื่อนำฟังก์ชั่นไปใช้งานจากการเรียกใช้ตัวเองทั้ง write และ read

calByClosure(&six) { $0 *= six }

// Simultaneous accesses to 0xa420020, but modification requires exclusive access.
Previous access (a modification) started at <unavailable> (0xa4105f3).
Current access (a read) started at:
<backtrace unavailable>

*/


var backupOfSix = six
calByClosure(&six) { $0 *= backupOfSix}
print(six) // 36






//------------------------------------------
// Conflicting Access to self in Methods
//------------------------------------------


/*
    struct Player {
        var name: String
        var health: Int
        var energy: Int

        static let maxHealth = 10
        mutating func restoreHealth() {
            health = Player.maxHealth
        }
    }

    extension Player {
        mutating func shareHealth(with teammate: inout Player) {
            balance(&teammate.health, &health)
        }
    }

    var oscar = Player(name: "Oscar", health: 10, energy: 10)
    var maria = Player(name: "Maria", health: 5, energy: 10)
    oscar.shareHealth(with: &maria)  // OK

However, if you pass oscar as the argument to shareHealth(with:), there’s a conflict:

    // ตัวเองเรียกใช้ฟังก์ชั่นและส่งตัวเองไปในฟังก์ชั่น inout จะเกิด conflict
    oscar.shareHealth(with: &oscar)
    // Error: conflicting accesses to oscar



*/




protocol FruitProtocol{
    var name: String { set get }
    var amount: Int { set get }
}

struct Apple: FruitProtocol{
    var name: String
    var amount: Int

    init(name: String = "Apple", amount: Int = 1){
        self.name = name
        self.amount = amount
    }
}

struct Banana: FruitProtocol{
    var name = "Banana"
    var amount = 2
}

struct Fruit{
    var basket: [FruitProtocol]

    subscript(index: Int) -> FruitProtocol{
        get{
            return basket[index]
        }
        set{
            basket[index] = newValue
        }
    }
}

var someFruit = Fruit(basket: [Apple(), Banana()])

func swapFruitAmount(first: inout FruitProtocol, second: inout FruitProtocol){
    let temp = first.amount
    first.amount = second.amount
    second.amount = temp
}

for amount in someFruit.basket{
    print(amount.amount, terminator: " ") // 1 2
}
print()

/*
 error: overlapping accesses to 'someFruit', but modification requires exclusive access; consider copying to a local variable
swapFruitAmount(first: &someFruit[0], second: &someFruit[1])
*/

// ลองเอาฟังก์ชั่นไปใส่ใน strut เพื่อให้ตัวเองเรียกใช้
extension Fruit{
    mutating func swapAmount(first: inout FruitProtocol, second: inout FruitProtocol){
        let temp = first.amount
        first.amount = second.amount
        second.amount = temp
    }
}

/*
error: overlapping accesses to 'someFruit', but modification requires exclusive access; consider copying to a local variable
someFruit.swapAmount(first: &someFruit[0], second: &someFruit[1])
*/

var apple = Apple()

func swapAmountApple(first: inout Apple, second: inout Apple){
    let temp = first.amount
    first.amount = second.amount
    second.amount = temp
}

// ใช้ apple สลับกับตัว apple เอง
/*
overlapping accesses to 'apple', but modification requires exclusive access; consider copying to a local variable
swapAmountApple(first: &apple, second: &apple)
*/

var anotherApple = Apple(name: "New Apple", amount: 9)

// สร้างอีก apple มาสลับ amount กัน
swapAmountApple(first: &apple, second: &anotherApple)
print(apple) // Apple(name: "Apple", amount: 9)
print(anotherApple) // Apple(name: "New Apple", amount: 1)
// type ชนิดเดียวกันแต่คนละ instance สลับกันได้ ไม่มีปัญหา

var banana = Banana()
// สลับ amount instance คนละ type กัน
/*
error: cannot pass immutable value as inout argument: implicit conversion from 'Apple' to 'FruitProtocol' requires a temporary
someFruit.swapAmount(first: &apple, second: &banana)
// swapFruitAmount(first: &apple, second: &banana)
*/

 



//------------------------------------------
// Conflicting Access to Properties
//------------------------------------------

/*
// สร้าง tuple และส่งตัว tuple ของตัวเองเข้าไปใน function จะ error
    var playerInformation = (health: 10, energy: 20)
    balance(&playerInformation.health, &playerInformation.energy)
    // Error: conflicting access to properties of playerInformation

// สร้าง instance ของ player แล้วส่งตัวเองเข้าไปก็ error
    var holly = Player(name: "Holly", health: 10, energy: 10)
    balance(&holly.health, &holly.energy)  // Error


// กรณีที่เป็น local
// สร้าง instance ของ player เป็น local แล้วส่งเข้าไปทำงานใน function balance สามารถทำได้
    func someFunction() {
        var oscar = Player(name: "Oscar", health: 10, energy: 10)
        balance(&oscar.health, &oscar.energy)  // OK
    }


การ overlap access ไปยัง proproties ของ structure จะ safe(ไม่มี conflict) เมื่อสอดคล้องตรงตามเงื่อนไข
1.กำลัง access เข้าไปที่ stored properties ของ instance(ไม่ใช่ computed/class properties)
2.structure ที่ถูกสร้าง เป็น local variable
3.structure ตัวดังกล่าวไม่ได้ถูก capture ด้วย closures หรือถูก capture เฉพาะในกรณีที่เป็น nonescaping closure

it can prove that overlapping access to properties of a structure is safe if the following conditions apply:

    You’re accessing only stored properties of an instance, not computed properties or class properties.
    The structure is the value of a local variable, not a global variable.
    The structure is either not captured by any closures, or it’s captured only by nonescaping closures.


*/





func swapValueInTwoTuple(first: inout (name: String, age: Int), second: inout (name: String, age: Int)){
    (first, second) = (second, first)
}

var mike = (name: "Mike", age: 15)
var john = (name: "John", age: 25)

swapValueInTwoTuple(first: &mike, second: &john)
print("mike", mike) // mike (name: "John", age: 25)
print("john", john) // john (name: "Mike", age: 15)

/*
// old function
func multibyTwoFromNumber(_ value: Int) -> Int {
    return value * 2
}
*/

func multibyTwoFromNumberInOut(_ value: inout Int){
    value *= value
}

// ส่งตัวเองเข้าไปเพียงค่าเดียว
apple.amount = 9
var resultOfAppleAmountNonInOut = multibyTwoFromNumber(apple.amount)
print(resultOfAppleAmountNonInOut)  // 18

multibyTwoFromNumberInOut(&apple.amount)
print(apple.amount) // 81


apple.amount = 9
func swapTwoNumberInout(a: inout Int, b: inout Int){
    (a, b) = (b, a)
}

var tenten = 1010
swapTwoNumberInout(a: &apple.amount, b: &tenten)
print(apple.amount) // 1010

// ส่งตัวเองเข้าไปทั้งคู่

/*
error: overlapping accesses
conflicting access is here

swapTwoNumberInout(a: &tenten, b: &tenten)
swapTwoNumberInout(a: &apple.amount, b: &apple.amount)
*/


// ทำเป็น local
func localGetApple(send apple: Apple) -> Apple{
    var apple = apple
    var newTenten = 1010
    swapTwoNumberInout(a: &apple.amount, b: &newTenten)
    return apple
}

var newApple = localGetApple(send: apple)
print(newApple) // Apple(name: "Apple", amount: 1010)



func localAppleInstance(){
    var appleResult = Apple()
    var ninenine = 99
    swapTwoNumberInout(a: &appleResult.amount, b: &ninenine)
    print("appleResult", appleResult.amount)
    print("ninenine", ninenine)
}

localAppleInstance()
/*
appleResult 99
ninenine 1
*/



func localSwapAmountApple(first: Apple, second: Apple) -> (Apple, Apple){
    var first = first
    var second = second

    (first, second) = (second, first)

    return (first, second)
}

apple.name = "AAAAAAAAA"
apple.amount = 999999
(apple, newApple) = localSwapAmountApple(first: apple, second: newApple)
print(apple) // Apple(name: "Apple", amount: 1010)
print(newApple) // Apple(name: "AAAAAAAAA", amount: 999999)


//------------------------------------------
// 
//------------------------------------------




