//------------------------------------------
// Closures
//------------------------------------------

/*
    global function เป็น closures ที่มีชื่อแต่ไม่ capture ค่าใดๆ
    nested function เป็น closures ที่มีชื่อ แต่ capture ค่าเอาไปใช้ได้
    closure expression เป็น closure ที่ไม่มีชื่อ
*/



/*
    let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

    func backward(_ s1: String, _ s2: String) -> Bool {
        return s1 > s2
    }
    var reversedNames = names.sorted(by: backward)
    // reversedNames is equal to ["Ewa", "Daniella", "Chris", "Barry", "Alex"]

    reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
    })

    // Because the body of the closure is so short, it can even be written on a single line:
    reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2 } )

*/


//------------------------------------------
// The Sorted Method
//------------------------------------------


let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

    func backward(_ s1: String, _ s2: String) -> Bool {
        return s1 > s2
    }
    var reversedNames = names.sorted(by: backward)
    // reversedNames is equal to ["Ewa", "Daniella", "Chris", "Barry", "Alex"]




let intArrayData: [Int] = [10, 20, 30, 40, 50, 60, 70]
let descendingArray = intArrayData.sorted(by: > ) // ลดรูปตั้งแต่แรก
let ascendingArray = intArrayData.sorted(by: { n1, n2 in n1 < n2 })

print(descendingArray) // [70, 60, 50, 40, 30, 20, 10]
print(ascendingArray) // [10, 20, 30, 40, 50, 60, 70]




//------------------------------------------
// Closure Expression Syntax
//------------------------------------------

/*
    { (parameters) -> return type in
        statements
    }
*/

/*
    reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
        return s1 > s2
    })
    reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2 } )

*/


let sayHello = { 
    print("Hello")
}
sayHello()

var getStringClosurePrint = { (value: String) in return print(value)}

var getStringClosureReturn = { (value: String) -> String in return value}
getStringClosurePrint(getStringClosureReturn("Say HI")) // Say HI




let callStringWtihClosure: () -> String = { () in return "🐔"}
// let callStringWtihClosure: () -> String = {return "hello"}
print(type(of:callStringWtihClosure)) // () -> String


var sayChicken = callStringWtihClosure()
print(sayChicken) // 🐔





var nameMe: (String) -> String = { name in return "My Name is \(name)"}
print(type(of:nameMe)) // (String) -> String
print(nameMe) // (Function)

var makeAlan = nameMe("Alan")
print(type(of:makeAlan)) // String
print(makeAlan) // My Name is Alan

nameMe = { name in "My Name is \(name) in Implicit"}
makeAlan = nameMe("Alun")
print(makeAlan) // My Name is Alun in Implicit


nameMe = { "My Name is \($0) in Shorthand Argument Names"}
makeAlan = nameMe("A L A N")
print(makeAlan) // My Name is A L A N in Shorthand Argument Names




let someNumberForMakeDouble = [9, 80, 120, 5218]

func makeDouble(of: Int) -> Int{
    return(of * 2)
}

// normal way
var dataAfterMakeArrayDouble = someNumberForMakeDouble.map(makeDouble)
print(dataAfterMakeArrayDouble) // [18, 160, 240, 10436]

// closure way
dataAfterMakeArrayDouble = someNumberForMakeDouble.map{ (data: Int) -> Int in
    return data * 3
}
print(dataAfterMakeArrayDouble) // [27, 240, 360, 15654]

dataAfterMakeArrayDouble = someNumberForMakeDouble.map{ data in return data * 4}
print(dataAfterMakeArrayDouble) // [36, 320, 480, 20872]

dataAfterMakeArrayDouble = someNumberForMakeDouble.map{ data in data * 5}
print(dataAfterMakeArrayDouble) // [45, 400, 600, 26090]

dataAfterMakeArrayDouble = someNumberForMakeDouble.map{$0 * 6}
print(dataAfterMakeArrayDouble) // [54, 480, 720, 31308]




var closureCalVolume = { (length: Int, width : Int, height: Int) in
    return length * width * height
}

// var closureCalVolume = { length, width, height in
//     return ((length * width) * height) // *error* กำกวมในตัวแปร
// }

// var closureCalVolume = { $0 * $0} // *error* กำกวม


var myBox = closureCalVolume(2, 2, 2)
print(myBox) // 8



// ถ้าไม่ต้องการให้กำกวมต้องระบุ data-type
let closureCalVolmueItself: (Int, Int, Int) -> Int = { $0 * $1 * $2 }
print(closureCalVolmueItself(9, 9, 9)) // 729






func myClosure(closure: () -> String) {
    print("Inside myClosure")
}

myClosure { () -> String in
    return "Calling"
}        
// Inside myClosure

    // หรือ

myClosure(closure: { "Calling" })
// Inside myClosure

func myClosure(clo: @autoclosure () -> String) {
    print("Inside myClosure with Autoclosure")
}

myClosure(clo: "Calling")
// Inside myClosure with Autoclosure









// ====================================================
// Arrays
let fruits = ["Apple", "Orange", "Banana", "Mango"]
print(fruits.sorted(by: { (fruit1: String, fruit2: String) in return fruit1 < fruit2 }))
// ["Apple", "Banana", "Mango", "Orange"]


let cupcake = ["Coconut-Cupcakes", "Dark-Chocolate-Cupcakes", "Mocha-Cupcakes"]
var getArraysClosurePrint = { (data: [String]) in
        for item in data{
            print(item, terminator: " ")
        }
        print("")
    }
getArraysClosurePrint(fruits)
// Apple Orange Banana Mango 



var getArraysClosureReturn = { (data: [String]) -> [String] in
        return data
    }
for item in getArraysClosureReturn(fruits){
    print(item, terminator: " ")
}
print("")
// Apple Orange Banana Mango 



//------------------------------------------
// Inferring Type From Context
//------------------------------------------

/*
    reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } )
*/

print(fruits.sorted(by: { fruit1, fruit2 in return fruit1 < fruit2 }))
// ["Apple", "Banana", "Mango", "Orange"]


getStringClosureReturn = { value in return value}
getStringClosurePrint = { value in return print(value)}

getStringClosurePrint(getStringClosureReturn("Nice to Meet Again")) // Nice to Meet Again


print(getStringClosureReturn("Nice to Meet Again")) // Nice to Meet Again

// getStringClosureReturn = { (value: Int) -> Int in return value } // *error* ต้องประกาศตัวแปรใหม่
// print(getStringClosureReturn(3999415)) 








//------------------------------------------
// Implicit Returns from Single-Expression Closures
//------------------------------------------

/*
    reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } )
*/

print(fruits.sorted(by: { fruit1, fruit2 in fruit1 < fruit2 }))
// ["Apple", "Banana", "Mango", "Orange"]


getStringClosureReturn = { value in value}
getStringClosurePrint = { value in print(value)}

getStringClosurePrint(getStringClosureReturn("pass me the ball!")) // pass me the ball!






// ====================================================
// Arrays
getArraysClosurePrint = { data in
    for item in data{
        print(item, terminator: " ")
    }
    print("")
}

getArraysClosurePrint(cupcake)
// Coconut-Cupcakes Dark-Chocolate-Cupcakes Mocha-Cupcakes 


getArraysClosureReturn = { data in data}
getArraysClosurePrint(getArraysClosureReturn(cupcake))
// Coconut-Cupcakes Dark-Chocolate-Cupcakes Mocha-Cupcakes 





//------------------------------------------
// Shorthand Argument Names
//------------------------------------------

/*
    reversedNames = names.sorted(by: { $0 > $1 } )
*/

print(fruits.sorted(by: { $0 < $1}))
// ["Apple", "Banana", "Mango", "Orange"]

getStringClosurePrint = {print($0)}
getStringClosureReturn = {$0}
getStringClosurePrint(getStringClosureReturn("Dollar Sign($) PRINT!")) // Dollar Sign($) PRINT!



getArraysClosurePrint = { $0
    for item in $0{
        print(item, terminator: " ")
    }
    print("")
}

getArraysClosureReturn = {$0}

getArraysClosurePrint(getArraysClosureReturn(fruits)) // Apple Orange Banana Mango 


var eatFruits = fruits.map{ print("eat \($0)")}
/*
eat Apple
eat Orange
eat Banana
eat Mango
*/

let studentScores = [50, 60, 70, 80, 90, 20, 10, 5, 6, 4, 8, 7]
var scoreGreaterFiftyFive = studentScores.filter({ (score: Int) -> Bool in
    return score >= 50
})
print(scoreGreaterFiftyFive) // [50, 60, 70, 80, 90]

scoreGreaterFiftyFive = studentScores.filter{score in return score >= 50} // [50, 60, 70, 80, 90]
scoreGreaterFiftyFive = studentScores.filter{score in score >= 50} // [50, 60, 70, 80, 90]
scoreGreaterFiftyFive = studentScores.filter{$0 >= 50} // [50, 60, 70, 80, 90]






// ====================================================
var divideClosure = { (data1: Double, data2: Double) -> Double in
    return (data1 / data2)
}
var printAnything = { (data: Any) in
    print(data)
}


printAnything(divideClosure(6, 2)) // 3.0


divideClosure = { (data1, data2) in
    return (data1 / data2)
}
printAnything = { data in print(data)}


printAnything(divideClosure(30, 24)) // 1.25


divideClosure = { data1, data2 in (data1 / data2)}
divideClosure = { ($0 / $1)}
// divideClosure = { / } // *error*

printAnything = { print($0) }

printAnything(divideClosure(98, 40)) // 2.45
// ====================================================




func travel() -> (String) -> Void {
    return {
        print("let's go to \($0)")
    }
}
let myTravel = travel()
myTravel("Bangkok") // let's go to Bangkok





class LukeSkywalker{
    var name: String = "Luke Skywalker"
    var hp = 1
    // var greeting = { (name: String) -> Void in print("Hello \(name)")}
    // var greeting: (String) -> () = { str in print("Hello \(str)")}
    var greeting: (String) -> () = {print("Hello \($0)")}

    // func getHeal(){
    //     healPlayer()
    // }
}
let testObj = LukeSkywalker()

testObj.greeting("Yoda") // Hello Yoda









//------------------------------------------
// Operator Methods
//------------------------------------------

/*
    reversedNames = names.sorted(by: >)
*/

print(fruits.sorted(by: <))
// ["Apple", "Banana", "Mango", "Orange"]






//------------------------------------------
// Trailing Closures
//------------------------------------------

/*
กรณีที่ function มี parameter เป็น closure สามารถเขียน closure ไว้ข้างหลังวงเล็บของ function() ได้
หรือในอีกความหมายคือการเรียก function แล้วมี closure ไว้ข้างหลัง
func fun() >>{}<<

    func someFunctionThatTakesAClosure(closure: () -> Void) {
        // function body goes here
    }

    // Here's how you call this function without using a trailing closure:

    someFunctionThatTakesAClosure(closure: {
        // closure's body goes here
    })

    // Here's how you call this function with a trailing closure instead:

    someFunctionThatTakesAClosure() {
        // trailing closure's body goes here
    }
*/

/*
    func loadPicture(from server: Server, completion: (Picture) -> Void, onFailure: () -> Void) {
        if let picture = download("photo.jpg", from: server) {
            completion(picture)
        } else {
            onFailure()
        }
    }

    loadPicture(from: someServer) { picture in
        someView.currentPicture = picture
    } onFailure: {
        print("Couldn't download the next picture.")
    }


*/


func getData(url: String, completed: ((String) -> Void)){
    completed(url)
}

getData(url:"s", completed: {
    string in print(string)
})
/*

getData(url:"s"){
    string in print(string)
}

*/




reversedNames = names.sorted() { $0 > $1 }
    // ถ้ามีการรับ parameter เพียงตัวเดียวสามารถละ วงเล็บ() ก่อนทำเป็น trailing closure ได้
reversedNames = names.sorted { $0 > $1 }

print(reversedNames) // ["Ewa", "Daniella", "Chris", "Barry", "Alex"]


    let digitNames = [
        0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
        5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
    ]
    let numbers = [16, 58, 510] // input เป็น arrays ของ integer
    // map สมาชิกใน arrays แต่ละตัวเป็น string ผลลัพธ์ที่ได้จะเป็น arrays ของ string
    let convertNameFromDictionary = numbers.map { (number) -> String in
        var number = number
        var output = ""
        repeat {
            output = digitNames[number % 10]! + output
            number /= 10
        } while number > 0
        return output
    }
    // strings is inferred to be of type [String]
    // its value is ["OneSix", "FiveEight", "FiveOneZero"]

print(convertNameFromDictionary)
// ["OneSix", "FiveEight", "FiveOneZero"]



func callGrab(closure: () -> ()) {
  closure()
}
callGrab(closure: { print("Here's your Pizza")} ) // Here's your Pizza
callGrab(){ print("Here's your Burger")} // Here's your Burger
callGrab { print("Here's your Banana")} // Here's your Banana



func sayHiToSomeone(_ person: () -> Void){
    print("Hi", terminator:" ")
    person()
    print("How are you today?")
}

sayHiToSomeone{ print("Han Solo")}
/*
Hi Han Solo
How are you today?
*/





func makeDoubleClosure(digit: Int, closure: () -> Void) -> Int{
    closure()
    return digit * 2
}

var intNumberTwo = makeDoubleClosure(digit: 2){ print("Pass")} // Pass
print(intNumberTwo) // 4


func makeModuloTwo(digit: Int, closure: (Int) -> Void){
    let result = (digit % 2)
    closure(result)
}
makeModuloTwo(digit: 7){ result in print("result = \(result)")} // result = 1






func sayHiInClosureFunction(name: String, closure: (String) -> Void){
    print("Inside Function sayHi")
    closure(name) // capturing values
}
sayHiInClosureFunction(name: "Diona"){ closure in print("ok, \(closure) let's go")}
/*
Inside Function sayHi
ok, Diona let's go
*/

sayHiInClosureFunction(name: "Barbara"){ print("ok, \($0) let's go")}
/*
Inside Function sayHi
ok, Barbara let's go
*/




print(numbers) // [16, 58, 510]
print(type(of:numbers)) // Array<Int>
var numberToString = numbers.map { (number: Int) -> String in
    return String(number)
}

print(numberToString) // ["16", "58", "510"]
print(type(of:numberToString)) //Array<String>

numberToString = []
print(numberToString) // []

numberToString = numbers.map { number in String(number)}
print(numberToString) // ["16", "58", "510"]
print(type(of:numberToString)) //Array<String>

numberToString = []
print(numberToString) // []


numberToString = numbers.map {String($0)}
print(numberToString) // ["16", "58", "510"]
print(type(of:numberToString)) //Array<String>





func multiplyNumberThreeTimeWithClosure(number: Int, closure:(Int) -> Void){
    closure(number * number * number)
}

multiplyNumberThreeTimeWithClosure(number: 2){ print($0)} // 8




func sumInArray(of array: [Int], closure: (Int) -> Void){
    var sum = 0
    for item in array{
        sum += item
    }
    closure(sum)
}

var arrayNumber = [1, 2, 3, 4, 5, 6, 7]
sumInArray(of: arrayNumber){ sum in print(sum)} // 28
// sumInArray(of: arrayNumber){ print($0)}




func networkCall(didSucceed: Bool,
                success: (String) -> Void,
                failure: (String) -> Void){
    if didSucceed{
        success("Call succeeded")
    }else{
        failure("Call failed with error")
    }
}

networkCall(didSucceed: true, success: {
    (result: String) in print(result)
}){
    (error: String) in print(error)
}
// Call succeeded



//------------------------------------------
// Capturing Values
//------------------------------------------

/*
nested closure จะคล้ายกับ closure function
ซึ่ง closure มีความสามารถพิเศษ สามารถ capture ค่าใน scope ได้
*/
    func makeIncrementer(forIncrement amount: Int) -> () -> Int { // return function-type void -> Int(closure)
        var runningTotal = 0
        func incrementer() -> Int {
            runningTotal += amount
            return runningTotal
        }
        return incrementer
    }

print(type(of:makeIncrementer)) // (Int) -> () -> Int

let incrementByTen = makeIncrementer(forIncrement: 10)
// เป็น let แต่ตัว incrementByTen ไม่ได้มีการเปลี่ยนค่า แต่ชี้ไปยัง incrementer หรือชี้ไปยัง function type นั้น
// เป็นแบบ reference
// ตัว incrementByTen จะได้ตัว incrementer มาเก็บไว้ จะมีตัว incrementer เป็นของตัวเอง
// ต่อให้มีการประกาศตัวแปรใหม่ที่ เก็บ reference ของ incrementer ตัวแปรที่ประกาศก็จะมี incrementer เป็นของตัวนั้นเองต่างหาก
// จะไม่มีผลกระทบกับ incrementByten

    print(type(of:incrementByTen)) // () -> Int
    print(incrementByTen()) // 10
    print(incrementByTen()) // 20
    print(incrementByTen()) // 30


    let incrementBySeven = makeIncrementer(forIncrement: 7)
    print(incrementBySeven()) // 7
    

    print(incrementByTen()) // 40





/* old function */
// func travel() -> (String) -> Void {
//     return {
//         print("let's go to \($0)")
//     }
// }


func travelCaptureValueFuncWay(goto: String) -> () -> Void{
    var count = 1    
    func go() -> Void{
        print("let's go to \(goto), \(count)")
        count += 1
    }
    return go
}

let gotoNewYork = travelCaptureValueFuncWay(goto: "New York")
gotoNewYork() // let's go to New York, 1
gotoNewYork() // let's go to New York, 1

func travelCaptureValueClosureWay(goto: String) -> (String) -> Void{
    var count = 1
    return { print("let's go to \($0), \(count)")
    count += 1
    }
}

let gotoChiangMai = travelCaptureValueClosureWay(goto: "Chiang Mai")
gotoChiangMai("Chiang Mai") // let's go to Chiang Mai, 1
gotoChiangMai("Chiang Mai") // let's go to Chiang Mai, 2

func travelCaptureValueClosureAnotherWay(goto: String) -> () -> Void{
    var count = 1
    return{ print("let's go to \(goto), \(count)")
    count += 1
    }
}

let gotoBangkok = travelCaptureValueClosureAnotherWay(goto: "Bangkok")
gotoBangkok() // let's go to Bangkok, 1
gotoBangkok() // let's go to Bangkok, 2

func travelCaptureValueClosureGetInputOnCall() -> (String) -> Void{
    var count = 1
    return{ print("let's go to \($0), \(count)")
    count += 1
    }
}
let gotoSomewhere = travelCaptureValueClosureGetInputOnCall()
gotoSomewhere("Coca Cola") // let's go to Coca Cola, 1
gotoSomewhere("Pepsi") // let's go to Pepsi, 2







func makeRandomNumberBetweenOneToThreeSameNumber() -> () -> Int {
    return {
        var prvNumber = 0
        var newNumber = 0

        repeat {
            newNumber = Int.random(in: 1...3)
        } while (newNumber == prvNumber)

        prvNumber = newNumber
        return newNumber
    }
}

let getNumberRepeatSameNumber = makeRandomNumberBetweenOneToThreeSameNumber()

for _ in 1...5 {
    print(getNumberRepeatSameNumber(), terminator: " ")
} 
// 1 3 1 1 1 
print("")



func makeRandomNumberBetweenOneToThreeNoRepeat() -> () -> Int {
        var prvNumber = 0
    return {
        var newNumber = 0

        repeat {
            newNumber = Int.random(in: 1...3)
        } while (newNumber == prvNumber)

        prvNumber = newNumber
        return newNumber
    }
}

let getNumberNoRepeat = makeRandomNumberBetweenOneToThreeNoRepeat()

for _ in 1...5 {
    print(getNumberNoRepeat(), terminator: " ")
} 
// 3 2 3 2 3 
print("")








var zeroNumber = 0 
var closureArray = [() -> ()]()
for _ in 1...3{
    closureArray.append{ /* closure for capturing values */ }
    zeroNumber += 1
}

print(zeroNumber) // 3
print(closureArray) // [(Function), (Function), (Function)]
print(closureArray[0]()) // ()










func makeDigitDouble(digit: Int) -> () -> Int{
    var myDouble = 2 // ตัวแปรที่จะถูกเปลี่ยน หลัง closure ทำงาน
    func makeDoubleClosure() -> Int{
        myDouble *= digit
        return myDouble
    }
    return makeDoubleClosure
}

print(makeDigitDouble) // (Function)

let makeMeDouble = makeDigitDouble(digit: 2)
print(type(of:makeDoubleClosure)) // (Int, () -> ()) -> Int
print(makeMeDouble()) // 4

let makeMeDoubleFunc = makeDigitDouble
print(makeMeDoubleFunc) // (Function)

print(type(of:makeMeDoubleFunc)) // (Int) -> () -> Int
let makeMeDoubleGetFunc = makeMeDoubleFunc(2)
print(type(of:makeMeDoubleGetFunc)) // () -> Int
print("makeMeDoubleGetFunc")
print(makeMeDoubleGetFunc()) //4
print(makeMeDoubleGetFunc()) //8

print("makeMeDouble")
print(makeMeDouble()) // 8
print(makeMeDouble()) // 16






var Yoda: [String: Any] = ["Name": "Yoda", "HP": 10]

func getDamage(player: inout [String: Any],dmg: Bool) -> () -> (){
    func increase(){
        player["HP"] = (player["HP"] as! Int + 1)
    }
    func decrease(){
        player["HP"] = (player["HP"] as! Int - 1)
    }
    func increOrdecre(){
        dmg ? decrease() : increase()
    }
    return increOrdecre
}

print("\(Yoda["Name"]!) have hp:\(Yoda["HP"]!)") // Yoda have hp:10

let playerGetHit = getDamage(player: &Yoda, dmg: true)

print(type(of:playerGetHit)) // () -> ()
print(playerGetHit()) // ()
playerGetHit()

print("\(Yoda["Name"]!) have hp:\(Yoda["HP"]!)") // Yoda have hp:8








//------------------------------------------
// Closures Are Reference Types
//------------------------------------------

/*
closure เป็น reference type
เมื่อนำ incrementByTen ไป assign ให้กับตัวแปรอีกตัว ทั้งคู่จะชี้ไปที่เดียวกัน
*/

    let alsoIncrementByTen = incrementByTen
    print(alsoIncrementByTen())
    // returns a value of 50

    // เรียกฟังก์ชั่น incrementByTen อีกครั้งหลังถูก Assign ให้ alsoIncrementByTen
    print(incrementByTen())
    // returns a value of 60



let anotherPlayer = playerGetHit
anotherPlayer()

print("\(Yoda["Name"]!) have hp:\(Yoda["HP"]!)") // Yoda have hp:7




//------------------------------------------
// Escaping Closures
//------------------------------------------



    var completionHandlers: [() -> Void] = []
    func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
        completionHandlers.append(completionHandler)
    }


    func someFunctionWithNonescapingClosure(closure: () -> Void) {
        closure()
    }

    class SomeClass {
        var x = 10
        func doSomething() {
            someFunctionWithEscapingClosure { self.x = 100 } // ทำและเก็บ
            someFunctionWithNonescapingClosure { x = 200 } // ทำงานทันที
        }
    }

    let instance = SomeClass()
    instance.doSomething() // เรียกฟังก์ชั่นภายในคลาส ซึ่งจะทำงานพร้อมกัน 2 ฟังก์ชั่นเป็น  void->void (closure)
    print(instance.x)
    // Prints "200"

    completionHandlers.first?() // เรียกสมาชิกตัวแรกของอาเรย์และใช้งานฟังก์ชั่นด้วยคำสั่ง ()
    print(instance.x)
    // Prints "100"



    class SomeOtherClass {
        var x = 10
        func doSomething() {
            someFunctionWithEscapingClosure { [self] in x = 100 }
            someFunctionWithNonescapingClosure { x = 200 }
        }
    }


    struct SomeStruct {
        var x = 10
        mutating func doSomething() {
            // ถ้าต้องการแก้ไขค่าใน struct ต้องใส่ mutating
            someFunctionWithNonescapingClosure { x = 200 }  // Ok
            // someFunctionWithEscapingClosure { x = 100 } // ถ้าเป็น mutating จะ error
        }
    }









var resultBMI: [() -> ()] = []
print(type(of:resultBMI)) // Array<() -> ()>


func calculateBMI(height: Double, weight: Double, result: @escaping () -> Void){

    var result = result
    let bmi = weight / (height * 2)
    // result = bmi 
    resultBMI.append(result)
//     returnBMI(bmi: bmi)
}

// func returnBMI(bmi: Double){
//     return resultBMI(bmi)
// }

func calculateBMIWithNoneescapingClosure(callMe: () -> ()){
    callMe()
}

class calBMI{
    var bmi = 0
    func doDoubleFunction(){
        calculateBMI(height: 20, weight: 10){self.bmi = 900}
        calculateBMIWithNoneescapingClosure(){ bmi = 100}
    
    }
}

let myObject = calBMI()
myObject.doDoubleFunction()
print(myObject.bmi) // 100

resultBMI.first?()
print(myObject.bmi) // 900

class AnotherCalBMI {
    var bmi = 10
    func doDoubleFunction() {
        calculateBMI(height: 20, weight: 10){ [self] in bmi = 5}
        calculateBMIWithNoneescapingClosure(){ bmi = 9}
    }
}

let anotherCalBMIObj = AnotherCalBMI()
print(anotherCalBMIObj.bmi) // 10
anotherCalBMIObj.doDoubleFunction()
print(anotherCalBMIObj.bmi) // 9
resultBMI[1]()
print(anotherCalBMIObj.bmi) // 5


struct StructBMI {
    var bmi = 20
    mutating func doDoubleFunction() {
        // calculateBMI(height: 20, weight: 10){ bmi = 5 }
        calculateBMIWithNoneescapingClosure(){ bmi = 95558711}
    }
}

var structCalBMI = StructBMI()
print(structCalBMI.bmi) // 20
structCalBMI.doDoubleFunction()
print(structCalBMI.bmi) // 95558711



// func findSaber(closure: @escaping (Bool) -> Void) {
//   closure(true)
// }
// func findGun(closure: (Bool) -> Void) {
//   closure(false)
// }
// class Jedi {
//   let name = "Luke Skywalker"
//   var haveSaber: Bool = false
//     func pickSaber() {
//         findGun{ gun in haveSaber = gun}
//         findSaber{ saber in self.haveSaber = saber}
//     }
// }

// let lukeSkywalker = Jedi()
// print(lukeSkywalker.haveSaber) // false
// lukeSkywalker.pickSaber()
// print(lukeSkywalker.haveSaber) // true




var boxOfSaber: [(String) -> Void] = []
func findSaber(closure: @escaping (String) -> Void) {
    // closure("Yes, Take Saber")
    boxOfSaber.append(closure)
}
func findGun(closure: (String) -> Void) {
    closure("Take Gun")
}
class Jedi {
    let name = "Luke Skywalker"
    var haveSaber: String = "what i have to find?"
    // var boxOfSaber: [() -> Void]?
        func pickSaber() {
            findGun{ gun in haveSaber = gun}
            findSaber{ saber in self.haveSaber = saber}
        }

        func getSaber() -> String{
            return "Take Saber"
        }
}

let lukeSkywalker = Jedi()
print(lukeSkywalker.haveSaber) // what i have to find?
lukeSkywalker.pickSaber()
print(lukeSkywalker.haveSaber) // Take Gun
boxOfSaber.first?(lukeSkywalker.getSaber())
print(lukeSkywalker.haveSaber) // Take Saber










class Sausage {
    var name = "Sausage"
    // var closure: [() -> Void] = [] // Arrays
    var closure: (() -> Void)? // Optional<() -> ()>
    func escapingInClass(closure: @escaping () -> Void) {
        self.closure = closure
        // self.closure.append(closure) // Arrays
    }
    func nonEscapingInClass(closure: () -> Void){
        closure()
    }
}

class Saiua {
    var price = 0
    var type: Sausage = Sausage()
    func callSausageMethod() {
        type.escapingInClass { self.price = 111 }
        type.nonEscapingInClass{ price = 999 }
    }
}

var myObj = Saiua()
myObj.callSausageMethod()
print(myObj.price) // 999
print(myObj.type.name) // Sausage

// print(myObj.a.closure.first?()) // กรณีใช้ [Array]
print(myObj.type.closure?())

print(myObj.price) // 111


class AnotherSaiua {
    var price = 20
    var type: Sausage = Sausage()
    func callSausageMethod() {
        type.escapingInClass { [self] in price = 25 }
        type.nonEscapingInClass{ price = 1000 }
    }
}


var AnotherSausageObj = AnotherSaiua()
print(AnotherSausageObj.price) // 20
AnotherSausageObj.callSausageMethod()
print(AnotherSausageObj.price) // 1000
print(AnotherSausageObj.type.name) // Sausage

// print(AnotherSausageObj.a.closure.first?()) // กรณีใช้ [Array]
print(AnotherSausageObj.type.closure?())

print(AnotherSausageObj.price) // 25

struct StructSaiua{
    var price = 10
    var type: Sausage = Sausage()
    mutating func callSausageMethod() {
        // a.escapingInClass { price = 25 }
        type.nonEscapingInClass{ price = 6940 }
    }
}

var myStructSaiua = StructSaiua()
print(myStructSaiua.price) // 10
myStructSaiua.callSausageMethod()
print(myStructSaiua.price) // 6940







var collectSumInArrayEscaping: ((Int) -> Void)? // Optional<(Int) -> ()>
var sumOfArrayEscaping = 0

func sumInArrayEscaping(of array: [Int], closure: @escaping (Int) -> Void){
    for item in array{
        sumOfArrayEscaping += item
    }
    collectSumInArrayEscaping = closure
}
print("==========")

sumInArrayEscaping(of: arrayNumber){ (data: Int) in return print(data)}
collectSumInArrayEscaping?(sumOfArrayEscaping) // 28
sumInArrayEscaping(of: arrayNumber){print($0)}
collectSumInArrayEscaping?(sumOfArrayEscaping) // 56






var arrayHello: [() -> Void] = []

func collectArrayHelloClosure(to array: @escaping () -> Void){
    arrayHello.append(array)
}

func executeArrayHelloClosure(in array: [() -> Void]) {
    collectArrayHelloClosure(to: {printH()})
    collectArrayHelloClosure(to: {printE()})
    collectArrayHelloClosure(to: {printL()})
    collectArrayHelloClosure(to: {printL()})
    collectArrayHelloClosure(to: {printO()})
}

func showArrayHelloClosure(in array: [() -> Void]){
    for item in array{
    item()
}    
}

// getHello(to: &arrayHello)
executeArrayHelloClosure(in: arrayHello)
showArrayHelloClosure(in: arrayHello)
/*
H
E
L
L
O
*/








//------------------------------------------
// Autoclosures
//------------------------------------------


/*


    var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
    print(customersInLine.count)
    // Prints "5"

            // เขียนในรูปแบบของ closure เขียนไว้ใช้ข้างนอก
    let customerProvider = { customersInLine.remove(at: 0) }
    typeOf(customerProvider) // () -> String
    print(customersInLine.count)
    // Prints "5"

    print("Now serving \(customerProvider())!")
    // Prints "Now serving Chris!"
    print(customersInLine.count)
    // Prints "4"

    // customersInLine is ["Alex", "Ewa", "Barry", "Daniella"]

            // เขียนในรูปแบบของ function ที่รับเป็น closure () -> String
    func serve(customer customerProvider: () -> String) {
        print("Now serving \(customerProvider())!")
    }

            // ใช้งาน function
    serve(customer: { customersInLine.remove(at: 0) } )
    // Prints "Now serving Alex!"

    // customersInLine is ["Ewa", "Barry", "Daniella"]

        // เขียนในรูปแบบของ function autoclosure ที่สามารถละวงเล็บปีกกา {} ตอนรับ parameter
        // โดย autoclosure จะทำการ wrap expression ที่ส่งมาเป็น closure ให้
    func serve(customer customerProvider: @autoclosure () -> String) {
        print("Now serving \(customerProvider())!")
    }
    serve(customer: customersInLine.remove(at: 0))
    // Prints "Now serving Ewa!"



        // ถ้าต้องการให้มีการทำ autoclosure และ escaping ก็ให้ใส่ @autoclosure @escaping

    // customersInLine is ["Barry", "Daniella"]
    var customerProviders: [() -> String] = []
    func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
        customerProviders.append(customerProvider)
    }
    collectCustomerProviders(customersInLine.remove(at: 0))
    collectCustomerProviders(customersInLine.remove(at: 0))

    print("Collected \(customerProviders.count) closures.")
    // Prints "Collected 2 closures."
    for customerProvider in customerProviders {
        print("Now serving \(customerProvider())!")
    }
    // Prints "Now serving Barry!"
    // Prints "Now serving Daniella!"


*/


func typeOf(_ data:Any){
    print(type(of:data))
}


var listOfStarWarCharacters = ["Luke Skyawalker", "Anakin Skywalker", "Yoda", "Obi-wan Kenibi", "Kyro Len", "Rey"]
print(listOfStarWarCharacters.count) // 6

        // เขียนในรูปแบบของ closure เขียนไว้ใช้ข้างนอก
let starWarCharactersInAction = { listOfStarWarCharacters.remove(at: 0)}
typeOf(starWarCharactersInAction) // () -> String
print(listOfStarWarCharacters.count) // 6

print("\(starWarCharactersInAction()) is Dead") // Luke Skyawalker is Dead

        // เขียนในรูปแบบของ function ที่รับเป็น closure () -> String
func whosDead(in cast: () -> String){
    print("\(cast()) is Dead") // execute การทำงานภายใน function
}
typeOf(whosDead) // (() -> String) -> ()

whosDead(in: { listOfStarWarCharacters.remove(at: 0)}) // Anakin Skywalker is Dead
print(listOfStarWarCharacters.count) // 4


        // เขียนในรูปแบบของ function autoclosure ที่สามารถละวงเล็บปีกกา {} ตอนรับ parameter
        // โดย autoclosure จะทำการ wrap expression ที่ส่งมาเป็น closure ให้
func whosDead(in cast: @autoclosure () -> String){
    print("\(cast()) is Dead") 
}

        // ละวงเล็บปีกกา {} จากการใช้ autoclosure
// whosDead(in: {listOfStarWarCharacters.remove(at: 0)} ) // กรณีไม่ละวงเล็บ {}
whosDead(in: listOfStarWarCharacters.remove(at: 0) ) // Yoda is Dead

print(listOfStarWarCharacters) // ["Obi-wan Kenibi", "Kyro Len", "Rey"]


        // ถ้าต้องการให้มีการทำ autoclosure และ escaping ก็ให้ใส่ @autoclosure @escaping
// สร้างอาเรย์ไว้ข้างนอกฟังก์ชัน
var starWarWhosAlive: [() -> Void] = []
// var starWarBox: [() -> String] = [] // ใช้ในกรณี remove มี data-type () -> String

func newCharacterWithEscaping(in cast: @autoclosure @escaping () -> Void){
    starWarWhosAlive.append(cast)
}

// newCharacterWithEscaping(in: listOfStarWarCharacters.remove(at: 0))
// print(listOfStarWarCharacters.remove(at:0))
// typeOf(listOfStarWarCharacters.remove(at:0)) // String
// listOfStarWarCharacters.insert("Han Solo", at: 0)
// typeOf(listOfStarWarCharacters.insert("Han Solo", at: 0)) // ()

newCharacterWithEscaping(in: listOfStarWarCharacters.insert("Han Solo", at: 0))
newCharacterWithEscaping(in: listOfStarWarCharacters.insert("Rolonoa", at: 0))
print(listOfStarWarCharacters.count) // 3

for character in starWarWhosAlive{
    character() // เรียกใช้ฟังก์ชั่นใน arrays เพื่อเพิ่มตัวละคร
}

print(listOfStarWarCharacters) // ["Rolonoa", "Han Solo", "Obi-wan Kenibi", "Kyro Len", "Rey"]
print(listOfStarWarCharacters.count) // 5






/*
func sayHiToSomeone(_ person: () -> Void){
    print("Hello", terminator:" ")
    person()
    print("How are you today?")
}
*/


func sayHiToSomeoneWithAutoClosure(_ person: @autoclosure () -> Void){
    print("Hi", terminator:" ")
    person()
    print("How are you today?")
}

sayHelloToSomeoneWithAutoClosure(print("Peter"))
/*
Hi Peter
How are you today?
*/





func getDamageFromMonster(dmg: Bool, player: () -> String) {
    if dmg {
        print("Be careful!, \(player())")
    }else{
        print("Nice Dodge!, \(player())")
    }
}

func playerNameLuke() -> String {
    return "Luke"
}

getDamageFromMonster(dmg: true, player: playerNameLuke) // Be careful!, Luke
getDamageFromMonster(dmg: true, player: {"Yoda"}) // Be careful!, Yoda
getDamageFromMonster(dmg: false, player: {"Yoda"}) // Nice Dodge!, Yoda

func getDamageFromMonsterWithAutoClosure(dmg: Bool, player: @autoclosure () -> String){
    if dmg {
        print("Be careful!, \(player())")
    }else{
        print("Nice Dodge!, \(player())")
    }
}

getDamageFromMonsterWithAutoClosure(dmg: true, player: playerNameLuke()) // Be careful!, Luke
getDamageFromMonsterWithAutoClosure(dmg: true, player: "Anakin") // Be careful!, Anakin


func isTrueOrFalse(_ expr: () -> Bool) {
    if expr() {
        print("True")
    }else{
        print("False")
    }
}
isTrueOrFalse( {3 < 2}) // False

func isTrueOrFalseWithAutoClosure(_ expr: @autoclosure () -> Bool){
    if expr() {
        print("True")
    }else{
        print("False")
    }
}

isTrueOrFalseWithAutoClosure( 3 > 2 ) // True





func sayHi() -> String {
    return "Hi"
}
print(sayHi()) // Hi

func sayHiWithClosure(to person: () -> String) -> String{
    return "Hi " + person()
}
typeOf(sayHiWithClosure) // (() -> String) -> String
print(sayHiWithClosure(to: sayHi)) // Hi Hi
print(sayHiWithClosure(to: {"Calling Closure"})) // Hi Calling Closure

    // autoclosure
func sayHiWithAutoClosure(to person: @autoclosure () -> String) -> String{
    return "Hi " + person()
}
typeOf(sayHiWithAutoClosure) // (() -> String) -> String
print(sayHiWithAutoClosure(to: "Michael")) // Hi Michael

    // autoclosure with escaping
var sayHiBox: ( () -> String)?
func sayHiWithAutoClosureAndEscaping(to person: @autoclosure @escaping() -> String){
    sayHiBox = person
}

sayHiWithAutoClosureAndEscaping(to: sayHi())
print(sayHiBox?()) // Optional("Hi")
sayHiWithAutoClosureAndEscaping(to: sayHiWithAutoClosure(to: "I'm try to escaping"))
print(sayHiBox!()) // Hi I'm try to escaping



    // Int To String
func intToString(of data: Int) -> String {
    return String(data)
}
print(intToString(of: 90)) // 90

func intToStringWithClosure(of data :Int, closure: (Int) -> String) -> String{
    return closure(data)
}
typeOf(intToStringWithClosure) // (Int, (Int) -> String) -> String

    // Normal
// intToStringWithClosure(of: 88){ (s1: Int) in return String(s1)}
    // Inferring 
// print(intToStringWithClosure(of: 88){ (s1) in return String(s1)})
    // Implicit 
print(intToStringWithClosure(of: 88){ s1 in String(s1)}) // 88
    // omit
// print(intToStringWithClosure(of: 88){$0}) // *error* เพราะกำกวม ต้องระบุ data-type

    // or get result with one parameter like this
func intToStringWithClosureOneParameter(of closure: () -> Int) -> String{
    // let toString = closure()
    // return String(toString)
    return String(closure())
}
typeOf(intToStringWithClosureOneParameter) // (() -> Int) -> String
print(intToStringWithClosureOneParameter(of: {9989898})) // 9989898


    // autoclosure
func intToStringWithAutoClosure(of closure: @autoclosure () -> Int) -> String{
    let data = closure()
    return String(data)
    // หรือ return String(closure())
}
typeOf(intToStringWithAutoClosure) // (() -> Int) -> String

print(intToStringWithAutoClosure(of: 392561741)) // 392561741

    // autoclosure with escaping
var intToStringBox: ( () -> Int)?
func intToStringWithAutoClosureAndEscaping(of closure: @autoclosure @escaping () -> Int){
    intToStringBox = closure
}

intToStringWithAutoClosureAndEscaping(of: 3579)
print(intToStringBox?()) // Optional(3579)

// toooooooooooooooooooooo longggggggggggggggggggggggggggg
// force unwarp and casting to Int
intToStringWithAutoClosureAndEscaping(of: Int(intToStringWithClosure(of: 272727){ s1 in String(s1)})!)
print(intToStringBox?()) // Optional(272727)

intToStringWithAutoClosureAndEscaping(of: Int(intToStringWithClosureOneParameter(of: {101}))!)
print(intToStringBox?()) // Optional(101)

intToStringWithAutoClosureAndEscaping(of: Int(intToStringWithAutoClosure(of: 2090))!)
print(intToStringBox!()) // 2090



     // sum of AB
func sumOfABIntegerToString(plus a: Int, with b: Int) -> String{
    return String(a + b)
}
print(sumOfABIntegerToString(plus: 2, with: 5)) // 7


func sumOfABIntegerToStringWithClosure(plus a: Int, with b: Int,
                                        closure: (Int) -> String) -> String{
    return closure(a + b)
}
typeOf(sumOfABIntegerToStringWithClosure) // (Int, Int, (Int) -> String) -> String

print(sumOfABIntegerToStringWithClosure(plus: 3, with: 2){ (s1: Int) in String(s1)}) // 5


    // autoclosure
func sumOfABIntegerToStringWithAutoClosure(_ a:Int, _ b:Int,_ closure: @autoclosure () -> ()){
    let c = a + b
    print(c)
}

sumOfABIntegerToStringWithAutoClosure(1, 1, ()) // 2




    // รับ data-type เป็น Any
func autoclosureCanSayAnthing(_ closure: @autoclosure () -> (Any)){
    print(closure())
}
func returnMultipleValues(a:Int, b:Int) -> (Int, Int) {
    return (a, b)
}
print("--")
autoclosureCanSayAnthing( sumOfABIntegerToString(plus: 9, with: 9) ) // 18
autoclosureCanSayAnthing("calling") // calling
autoclosureCanSayAnthing( returnMultipleValues(a: 2, b: 2)) // (2, 2)
autoclosureCanSayAnthing( (2, 4)) // (2, 4)
print("--")





    // can collect everything
var sayAnythingBox: [() -> Any] = []
func autoclosureCanSayAnythingAndCanCallLater(_ closure: @autoclosure @escaping () -> Any){
    sayAnythingBox.append(closure)
}

    // execute
autoclosureCanSayAnythingAndCanCallLater("S")
autoclosureCanSayAnythingAndCanCallLater(104)
autoclosureCanSayAnythingAndCanCallLater( (1, 2, 3, 4, 5) )
autoclosureCanSayAnythingAndCanCallLater( typeOf )
autoclosureCanSayAnythingAndCanCallLater( getDamageFromMonsterWithAutoClosure(dmg: true, player: "Swift") )
let sayNo = { print("No")}
autoclosureCanSayAnythingAndCanCallLater( sayNo() )
func goGetSomeFood(closure: () -> ()) {
  closure()
}
autoclosureCanSayAnythingAndCanCallLater( goGetSomeFood{ print("i cant find anything can eat in garbage!")} )
print("===")
for item in sayAnythingBox{
    print(item(), terminator: " ")
}
print("\n===")
/*
S 104 (1, 2, 3, 4, 5) (Function) Be careful!, Swift
() No
() i cant find anything can eat in garbage!
() 
*/







func checkCondition(of condition: @autoclosure () -> Bool,message: String){
    if !condition(){
        print(message)
    }
}

checkCondition(of: 11 % 2 == 0, message: "found error in function") // found error in function



