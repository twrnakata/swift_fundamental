//------------------------------------------
// Error Handling
//------------------------------------------



//------------------------------------------
// Representing and Throwing Errors
//------------------------------------------

/*
    enum VendingMachineError: Error {
        case invalidSelection
        case insufficientFunds(coinsNeeded: Int)
        case outOfStock
    }


// throw error
throw VendingMachineError.insufficientFunds(coinsNeeded: 5)

*/


//------------------------------------------
// Handling Errors
//------------------------------------------

//------------------------------------------
// Propagating Errors Using Throwing Functions
//------------------------------------------


/*
เวลาเรียกใช้ฟังก์ชันถ้าสามารถ throws error ออกมาได้ต้องใส่คำว่า throws เพิ่มเข้าไป ถ้าไม่ใส่จะไม่โยน error ออกมา
    func canThrowErrors() throws -> String

    func cannotThrowErrors() -> String

    struct Item {
        var price: Int
        var count: Int
    }

    class VendingMachine {
        var inventory = [
            "Candy Bar": Item(price: 12, count: 7),
            "Chips": Item(price: 10, count: 4),
            "Pretzels": Item(price: 7, count: 11)
        ]
        var coinsDeposited = 0

        func vend(itemNamed name: String) throws {
            guard let item = inventory[name] else {
                throw VendingMachineError.invalidSelection
            }

            guard item.count > 0 else {
                throw VendingMachineError.outOfStock
            }

            guard item.price <= coinsDeposited else {
                throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
            }

            coinsDeposited -= item.price

            var newItem = item
            newItem.count -= 1
            inventory[name] = newItem

            print("Dispensing \(name)")
        }
    }


    let favoriteSnacks = [
        "Alice": "Chips",
        "Bob": "Licorice",
        "Eve": "Pretzels",
    ]
    func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
        let snackName = favoriteSnacks[person] ?? "Candy Bar"
        try vendingMachine.vend(itemNamed: snackName)
    }


    struct PurchasedSnack {
        let name: String
        // init ก็สามารถ throw error ได้ ในกรณี init ไม่สำเร็จ
        init(name: String, vendingMachine: VendingMachine) throws {
            try vendingMachine.vend(itemNamed: name)
            self.name = name
        }
    }


*/


//------------------------------------------
// Handling Errors Using Do-Catch
//------------------------------------------

/*
สามารถใช้ do case เพื่อตรวจสอบ error ว่าเป็นชนิดไหน
Here is the general form of a do-catch statement:

    do {
        try expression
        statements
    } catch pattern 1 {
        statements
    } catch pattern 2 where condition {
        statements
    } catch pattern 3, pattern 4 where condition {
        statements
    } catch {
        statements
    }

    var vendingMachine = VendingMachine()
    vendingMachine.coinsDeposited = 8
    do {
        try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
        print("Success! Yum.")
    } catch VendingMachineError.invalidSelection {
        print("Invalid Selection.")
    } catch VendingMachineError.outOfStock {
        print("Out of Stock.")
    } catch VendingMachineError.insufficientFunds(let coinsNeeded) {
        print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
    } catch {
        print("Unexpected error: \(error).")
    }
    // Prints "Insufficient funds. Please insert an additional 2 coins."



    func nourish(with item: String) throws {
        do {
            try vendingMachine.vend(itemNamed: item)

        // ถ้าไม่อยากเช็คทีละเงื่อนไขแบบ do catch หลายๆ แบบ
        // สามารถเช็คด้วย is ได้ว่าสิ่งที่โยนออกมาเป็น VendingMachineError หรือไม่
        
        } catch is VendingMachineError {
            print("Couldn't buy that from the vending machine.")
        }
    }


    // ใช้ do เช็ค function ที่ throw error
    do {
        // เจอ error ภายใน norish แล้วจะโยน error ออกมา โดยที่ไม่ไปทำ catch ของ do

        try nourish(with: "Beet-Flavored Chips")
    } catch {
        print("Unexpected non-vending-machine-related error: \(error)")
    }
    // Prints "Couldn't buy that from the vending machine."



    func eat(item: String) throws {
        do {
            try vendingMachine.vend(itemNamed: item)
        // สามารถระบุหลายๆ ชนิดภายใน catch เดียวกันได้
        } catch VendingMachineError.invalidSelection, VendingMachineError.insufficientFunds, VendingMachineError.outOfStock {
            print("Invalid selection, out of stock, or not enough money.")
        }
    }


*/


/*


enum UserError: Error{
    case emptyString
    case invalidData
    case invalidNumber(Int)
    case unknown(String)
}

func throwEmptryString() throws -> String{
    throw UserError.emptyString
    return ""
}

func throwNagativeIntegerError() throws{
    throw UserError.invalidNumber(-50)
}

func throwPositiveIntegerError() throws -> Int{
    throw UserError.invalidNumber(50)
}


do{
    try throwNagativeIntegerError()
} catch UserError.emptyString{
    print("emptyString has found")
} catch UserError.invalidNumber(let number) where number < 0{
    print("value: \(number), error because number < 0")
} catch UserError.invalidNumber(let number){
    print("some function crash because: \(number)")
} catch UserError.unknown(let text){
    print("error because \(text)")
} catch{
    print("other error")
}
// value: -50, error because number < 0



do{
    try throwPositiveIntegerError()
} catch UserError.emptyString{
    print("emptyString has found")
} catch UserError.invalidNumber(let number) where number < 0{
    print("value: \(number), error because number < 0")
} catch UserError.invalidNumber(let number){
    print("some function crash because: \(number)")
} catch UserError.unknown(let text){
    print("error because \(text)")
} catch{
    print("other error")
}
// some function crash because: 50


do{
    throw UserError.unknown("not my fault")
} catch UserError.emptyString{
    print("emptyString has found")
} catch UserError.invalidNumber(let number) where number < 0{
    print("value: \(number), error because number < 0")
} catch UserError.invalidNumber(let number){
    print("some function crash because: \(number)")
} catch UserError.unknown(let text){
    print("error because: \(text)")
} catch{
    print("other error")
}
// error because: not my fault



*/


enum CustomError: Error {
    case emptyString
    case dividedByZero
    case lessZeroInteger
    case stringError(String)
    case tooLong(length: Int)    
}

func division(_ a: Int, _ b: Int) throws {
    guard b != 0 else { throw CustomError.dividedByZero }
    print(a / b)
}
do{
    try division(10, 0)
} catch CustomError.dividedByZero {
    print("divided by zero")
} catch {
    print("other error")
}
// divided by zero



func itemIsExist(in array: [String]) -> Bool {
    guard !(array.isEmpty) else { return false }
    for item in array{
        if (item.isEmpty){
            return false
        }
    }
    return true
}


class Burger{
    var name: String
    var ingredients: [String]
    var _price: Int

    var price: Int{
        get { return self._price }
        set {
            guard newValue > 0 else { return }
            self._price = price
        }
    }

    var throwError: Int{
        get throws{
            throw CustomError.lessZeroInteger
        }
    }


    init(){
        self.name = "Burger"
        self.ingredients = ["Bun", "meat"]
        self._price = 30
    }
    convenience init(name: String, ingredients: [String]) throws{
        guard !(name.isEmpty), itemIsExist(in: ingredients) else { throw CustomError.emptyString }
        
        guard (name.count < 15) else{ throw CustomError.tooLong(length: 15) }

        // phase 1
        self.init()
        
        // phase 2
        self.name = name
        self.ingredients = ingredients
    }

    func show(){
        print(self.name)
        print("Ingredients: \(self.ingredients)")
    }

    func checkQuality() -> Burger?{
        guard self.price > 0,
        !(self.name.isEmpty),
        itemIsExist(in: self.ingredients) else { return nil }
        
        return self
    }

}

do {
    let cheeseBurger = try Burger(name: "Cheese", ingredients: ["Bun", "Cheese", "Beef"])
    cheeseBurger.show()
} catch CustomError.emptyString {
    print("found empty string")
} catch CustomError.tooLong {
    print("length of string is too long")
} catch {
    print("other error")
}
/*
Cheese
Ingredients: ["Bun", "Cheese", "Beef"]
*/

do {
    let beanBurger = try Burger(name: "The Bean Burger from Island", ingredients: ["Bun", "Super Bean"])
    beanBurger.show()
} catch CustomError.emptyString {
    print("found empty string")
} catch CustomError.tooLong {
    print("length of string is too long")
} catch {
    print("other error")
}
// length of string is too long



do {
    // throws emptyString กับ tooLong
    let doubleBurger = try Burger(name: "", ingredients: ["Bun"])
    doubleBurger.show()
    
    let beanBurger = try Burger(name: "The Bean Burger from Island", ingredients: ["Bun", "Super Bean"])
    beanBurger.show()

} catch CustomError.emptyString {
    print("found empty string")
} catch CustomError.tooLong {
    print("length of string is too long")
} catch {
    print("other error")
}
// found empty string



//------------------------------------------
// Converting Errors to Optional Values
//------------------------------------------


/*
    func someThrowingFunction() throws -> Int {
        // ...
    }

// ถ้าอยากจะกำหนดให้เป็น optional ก็ใส่ ? ถ้าสำเร็จจะได้ผลลัพธ์เป็น int ถ้าไม่สำเร็จผลลัพธ์จะเป็น nil
// x จะเป็น optional int
    let x = try? someThrowingFunction()

// ผลลัพธ์จะได้เหมือนกัน 
// y เป็น optional int ถ้า error ออกมาจะถูกจบแล้ว assign nil ให้ y
    let y: Int?
    do {
        y = try someThrowingFunction()
    } catch {
        y = nil
    }


// fetchData return optional data โดยภายในฟังก์ชันจะมีการตรวจสอบ data ถ้า error ที่ถูกจับได้ไม่ว่าจะเป็นชนิดไหน ก็จะโยน nil ออกมา
    func fetchData() -> Data? {
        if let data = try? fetchDataFromDisk() { return data }
        if let data = try? fetchDataFromServer() { return data }
        return nil
    }

*/


let someBurger = try? Burger(name: "", ingredients: [])
print(someBurger) // nil

let bananaBurgerOptional = try? Burger(name: "Banana", ingredients: ["Bun", "Banana"])
print(type(of:bananaBurgerOptional)) // Optional<Burger>
print(bananaBurgerOptional?.name) // Optional("Banana")
print(bananaBurgerOptional?.price) // Optional("30")


var getBurgerError: Burger? = Burger()
do{
    try getBurgerError?.throwError
} catch CustomError.emptyString {
    print("found empty string")
} catch CustomError.tooLong {
    print("length of string is too long")
} catch CustomError.lessZeroInteger {
    print("get error from computed properties")
    getBurgerError = nil
} catch {
    print("other error")
}
// get error from computed properties
print(getBurgerError)
// nil


let errorChickenBurger = try? Burger(name:"Chickennnnnnnnnnnn", ingredients: ["Bun"])
print(errorChickenBurger)

let errorBananaBurger = try? bananaBurgerOptional?.throwError
print(errorBananaBurger) // nil


let priceFromBananaBurger = try? bananaBurgerOptional?.price
print(type(of:priceFromBananaBurger)) // Optional<Int>
print(priceFromBananaBurger) // Optional(30)



func addVat(to burger: Burger) throws -> Double{
    guard burger.price > 0 else { throw CustomError.lessZeroInteger }
    let vat = Double(burger.price) * 1.07
    return vat
}

let vatOfBananaBurger = try? addVat(to: bananaBurgerOptional!)
print(type(of:vatOfBananaBurger)) // Optional<Double>
print(vatOfBananaBurger) // Optional(32.1)

bananaBurgerOptional?._price = -20
print(bananaBurgerOptional?.price) // Optional(-20)

/*
จาก functionภายใน class Burger
    func checkQuality() -> Burger?{
        guard self.price > 0,
        !(self.name.isEmpty),
        itemIsExist(in: self.ingredients) else { return nil }
        
        return self
    }

print(bananaBurgerOptional?.checkQuality()) // nil


var appleBurger = try Burger(name: "Apple Burger", ingredients: ["Bun", "Apple"])
print(appleBurger.checkQuality()?.price) // Optional(30)
*/



//------------------------------------------
// Disabling Error Propagation
//------------------------------------------

/*
// ถ้ามั่นใจว่าไม่ error สามารถใช้ ! หลัง try แต่ต้องมั่นใจแน่ๆ ว่าไม่ error
let photo = try! loadImage(atPath: "./Resources/John Appleseed.jpg")
*/

let result = try! division(4, 2) // 2


let yamBurger = try! Burger(name: "Yam Burger", ingredients: ["Bun", "Yam"] )

print(yamBurger.price) // 30


//------------------------------------------
// Specifying Cleanup Actions
//------------------------------------------


/*

// defer จะทำงานเมื่อจบ scope จะยังไม่ทำทันที จะทำงานเมื่อทำจบ scope ถึงจะเรียกคำสั่งที่อยู่ภายใน defer
// บางครั้งโปรแกรมอาจจะไม่ได้ทำงานจนจบ scope อาจจะมี error ระหว่างทาง ก็ไม่มีปัญหาเพราะ defer จะถูกเรียกทุกครั้ง
// defer จะมีจำนวนคำสั่งเท่าไรก็ได้ แต่เวลาเรียกใช้จะเรียกแบบย้อนกลับ อะไรที่ถูกสร้างทีหลังจะถูกเรียกก่อน
    func processFile(filename: String) throws {
        if exists(filename) {
            let file = open(filename)
            // defer จะทำงานเมื่อจบ scope
            defer {
                close(file)
            }
            while let line = try file.readline() {
                // Work with the file.
            }
            // close(file) is called here, at the end of the scope.
        }
    }

*/


//------------------------------------------
// 
//------------------------------------------



/*




func myDefer() {
    print("first print")
    defer{
        print("second print")
        print("third print")
        print("fourth print")
    }
    print("fifth print")
}

myDefer()
/*
first print
fifth print
second print
third print
fourth print
*/


func doDefer(){
    print("first print")
    do {
        defer{
            print("second print")
            print("third print")
            print("fourth print")
        }
    }
    print("fifth print")
}


print("========")
doDefer()
/*
first print
second print
third print
fourth print
fifth print
*/


for i in 1...2 {
    print ("before defer \(i)")
    defer {
        print ("defer @ \(i)")
    }
    print ("after defer \(i)")
}
/*
before defer 1
after defer 1
defer @ 1
before defer 2
after defer 2
defer @ 2
*/



// func deferReturnValue() -> Int{
func deferPrintValue() -> Void{
    var a = 2, b = 3, sum = 0
    defer{
        sum = sum * 2 
        print(sum)
    }
    sum = (a * b) // 6
    
}
deferPrintValue() // 12

func mood() -> String {
    var mood = "happy"
    defer {
        mood = "unhappy"
    }

    return mood
}

print(mood()) // happy


print("=====")

func printNumber() {
    defer{ print("1") }
    defer{ print("2") }
    defer{ print("3") }
    print("4")
}

printNumber()
/*
4
3
2
1
*/



do {
    defer { print("defer call before throw error") }
    let underDefer = try throwEmptryString()
} catch {
    print("found some error")
}
/*
defer call before throw error
error
*/


func deferAfterThrow() throws -> String{
    var text = ""

    if (text.isEmpty){
        throw UserError.emptyString
    }else{
        return text
    }


    defer{
        print("defer in deferAfterThrow")
    }
}

do {
    try deferAfterThrow()
} catch {
    print("found some error")
}
// found some error


/*
func deferThrow() throws {
    defer{
        throw UserError.unknown("deferThrow")
    }
}
error is not handled because the enclosing function is not declared 'throws'
*/

func deferThrowError() throws -> Void{
    print("in deferThrowError")

    print("be careful! defer is mad!")

    defer{
        UserError.unknown("DEFER")
    }
}

do {
    try deferThrowError()
} catch UserError.unknown(let error){
    print("\(error)")
} catch {
    print("found some error")
}
/*
in deferThrowError
be careful! defer is mad!
*/

func multiDeferNotThrow() throws -> Void{
    let text = ""
    let intergerNumber = 99999999

    defer{
        if (text.isEmpty) { UserError.emptyString }
    }
    defer{
        if (intergerNumber > 100) { UserError.invalidNumber(intergerNumber) }
    }

    throw UserError.unknown("call defer please")
    print("text", text)
    print("number", intergerNumber)
}


print("=====")
do {
    try multiDeferNotThrow()
} catch UserError.unknown(let error){
    print("\(error)")
} catch {
    print("found some error")
}
// call defer please


func multiDeferNotThrow2() throws -> Void{
    let text = ""
    let intergerNumber = 99999999

    defer{
        if (text.isEmpty) { 
            print("yes text is empty")
            UserError.emptyString
        }
    }
    defer{
        if (intergerNumber > 100) {
            print("and yes number > 100")
            UserError.invalidNumber(intergerNumber)
        }
    }

    print("text", text)
    print("number", intergerNumber)
}


print("=====")
do {
    try multiDeferNotThrow2()
} catch UserError.unknown(let error){
    print("\(error)")
} catch {
    print("found some error")
}
/*
text 
number 99999999
and yes number > 100
yes text is empty
*/


func deferDoCatch() throws -> Void {
    defer{
        do {
            try throwEmptryString()
        } catch {
            print("error in deferDoCatch")
        }
    }
}


print("=====")
do {
    try deferDoCatch()
} catch {
    print("catch deferDoCatch")
}
// error in deferDoCatch

print("=====")

func deferAfterScopeIsExited() {
    print ("call deferAfterScopeIsExited")
    guard (3 == 2) else { return }
    defer {
        print ("deferAfterScopeIsExited")
    }
}
  
deferAfterScopeIsExited()
// call deferAfterScopeIsExited

func deferBeforeScopeIsExited() {
    print ("call deferBeforeScopeIsExited")
    defer {
        print ("deferBeforeScopeIsExited")
    }
    guard (3 == 2) else { return }
}

deferBeforeScopeIsExited()
/*
call deferBeforeScopeIsExited
deferBeforeScopeIsExited
*/



//------------------------------------------
// 
//------------------------------------------


*/



