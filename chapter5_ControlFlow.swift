//------------------------------------------
// Control Flow
//------------------------------------------

//------------------------------------------
// For-In Loops
//------------------------------------------
/*
ใช้ For Loop เมื่อทราบจำนวน loop ที่แน่นอน
*/


let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    // legCount += // *error*
    print("\(animalName)s have \(legCount) legs")
}
// cats have 4 legs
// ants have 6 legs
// spiders have 8 legs


let UnicodeWordAsString = ["0055", "006E", "0069", "0043", "006F", "0044", "0065"]
// Array<String>
// UniCoDe

for item in UnicodeWordAsString{
    let newItem = Int(item, radix:16)
    let uScalar = UnicodeScalar(newItem!)
    print(uScalar!, terminator:"")
}
// UniCoDe

let Luke = ["name": "Luke"]
let baskets = ["Apple", "Melon", "Banana", "Watermelon"]

// กินทุกอย่างยกเว้นกล้วย
for fruit in baskets where fruit != "Banana"{
    print("\(Luke["name"]!) eat \(fruit)")
}
/*
Luke eat Apple
Luke eat Melon
Luke eat Watermelon
*/


let five = 5
let one = 1
for index in one+1...five{
// for index in 1..<five = 5 { // *error*
    print("\(index) times 5 is \(index * 5)")
}
// 3 times 5 is 15
// 4 times 5 is 20

let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")
// 3 to the power of 10 is 59049


var money = 8888
var moneyBox = Array(repeating: 0, count: 8)
var numpay = [1000, 500, 100, 50, 20, 10, 5, 1]

for i in 0..<numpay.count{
    moneyBox[i] = money / numpay[i]
    money = money % numpay[i]
}

for (index, value) in moneyBox.enumerated(){
    print("ธนบัตร \(numpay[index]) มีจำนวน \(value) ใบ")
}
/*
ธนบัตร 1000 มีจำนวน 3 ใบ
ธนบัตร 500 มีจำนวน 1 ใบ
ธนบัตร 100 มีจำนวน 3 ใบ
ธนบัตร 50 มีจำนวน 1 ใบ
ธนบัตร 20 มีจำนวน 1 ใบ
ธนบัตร 10 มีจำนวน 1 ใบ
ธนบัตร 5 มีจำนวน 1 ใบ
ธนบัตร 1 มีจำนวน 3 ใบ
*/


//------------------------------------------
// While Loops
//------------------------------------------
/*
ใช้ While loop เมื่อไม่ทราบจำนวน loop ที่แน่นอนและเป็นเงื่อนไข
*/

// *infinite loop*
// while (true) {
//     print("infinite loop")
// }

let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
var square = 0
var diceRoll = 0
while square < finalSquare {
    // roll the dice
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    // move by the rolled amount
    square += diceRoll
    if square < board.count {
        // if we're still on the board, move up or down for a snake or a ladder
        square += board[square]
    }
}
print("Game over!")



    // while เช็คเงื่อนไขก่อนค่อยทำ
var zero = 0
print("Numbers:")
while zero <= (five-3) {
    print(zero, terminator: " ")
    zero = zero + 1
}
/*
Numbers:
0 1 2
*/
print("")

var currentLevel:Int = 1
let canLevelUp = true, maxLevel:Int = 5
while (currentLevel < maxLevel) {
    if canLevelUp {
        currentLevel += 1
        print("Level Up! \(currentLevel)")
    }
}
/*
Level Up! 2
Level Up! 3
Level Up! 4
Level Up! 5
*/

    // repeat while ทำก่อนแล้วค่อยเช็คเงื่อนไข
print("reset currenLevel")
currentLevel = 1
repeat {
    if canLevelUp{
    currentLevel += 1
    print("Level Up! \(currentLevel)")
    }
} while (currentLevel < maxLevel)
/*
Level Up! 2
Level Up! 3
Level Up! 4
Level Up! 5
*/

zero = 0
print("Numbers:")
repeat {
    print(zero, terminator: " ")
    zero = zero + 1

} while (zero <= (five-3))
print("")
/*
Numbers:
0 1 2 
*/

var iterator: Int = 1
var runLoop: Bool = false
var sum: Int = 0

while runLoop {
    sum = sum + iterator
    iterator += 1
}
print(sum)
// 0

repeat {
    sum += iterator
    iterator += 1
} while runLoop

print(sum)
// 1


let target = 2
var item: Int?
var count: Int = 0
repeat {
    count += 1
    item = Int.random(in: 1..<5)
    if target != item{
        print("random number = \(item!)")
        continue
    }
    print("found on count = \(count)")
} while item != target
/*
random number = 3
random number = 3
random number = 1
found on count = 4
*/

count = 0
repeat {
    count += 1
    item = Int.random(in: one...five)
    if target == item{
        print("target == item \(item!)")
        break
    }
} while item != target
print("found on count = \(count)")
/*
target == item 3
found on count = 2
*/




//------------------------------------------
// Conditional Statements
//------------------------------------------

let color: [String: String] = ["red": "\u{1F7E5}", "blue": "\u{1F535}", "orange": "\u{1F536}"]
var myColor:String = "green"

if color.keys.contains(myColor){
    print("i love \(color[myColor]!)")
    // print("hi")
}else{
    for item in color{
    print("i hate \(item.value)", terminator: " ")
    }
}
// i hate 🟥 i hate 🔵 i hate 🔶 
print("")

var age = 80, vat = 1.07
var ticketPrice:Double = 100
let discount: [String: Double] = ["Adult": 0, "Teenager": 0.10, "Kid": 0.15, "Old-Adult": 0.2]

if (age < 13){
    ticketPrice = (ticketPrice * (1 - discount["Kid"]!) * vat)
    print("Pay for Ticket: \(ticketPrice)")
}
else if(age < 20){
    ticketPrice = (ticketPrice * (1 - discount["Teenager"]!) * vat)
    print("Pay for Ticket: \(ticketPrice)")
}else if(age < 60) {
    ticketPrice = (ticketPrice * (1 - discount["Adult"]!) * vat)
    print("Pay for Ticket: \(ticketPrice)")
}else{
    ticketPrice = (ticketPrice * (1 - discount["Old-Adult"]!) * vat)
    print("Pay for Ticket: \(ticketPrice)")
}
// Pay for Ticket: 85.6


var havePassword = false
havePassword = !havePassword
if havePassword {
    print("Login Sucess")
} else {
    print("access denied")
}
// Login Sucess

    // nested if
var doHomeWork = true
var haveExam = false

if (haveExam){
    if doHomeWork {
        print("Grade A")
    }else{
        print("Grade B")
    }
}else{
    if doHomeWork {
        print("Grade C")
    }else{
        print("Grade F")
    }
}
// Grade C


//------------------------------------------
// Switch
//------------------------------------------

switch havePassword {
case true:
    print("Login Sucess")
default:
    print("access denied")
}
// Login Sucess

let appleSize = 3
switch appleSize {
    case 0, 1:
        print("Small")
    case 2, 3:
        print("Medium")
    case 4, 5:
        print("Large")
    case 6...:
        print("Over-Size")
    default:
        print("i cant see any apple")
}
// Medium

let petType = "dog"
switch petType {
case "bird":
    print("it a bird")
case "dog":
    print("it a dog")
case "cat":
    print("it a cat")
default:
    print("i don't know what is it")
}
// it a dog

let diceRoll = Int.random(in: 0...6)
switch diceRoll {
case 1, 3, 5:
    print("Odd")
case 2, 4, 6:
    print("Even")
default:
    break;
}
// Even or Odd

for number in 20...23 {
    switch number % 2 {
    case 0:
        print("\(number) is even")
    default:
        print("\(number) is odd")
    }
}
/*
20 is even
21 is odd
22 is even
23 is odd
*/


// Type Check
var shopDiscount: String?
switch shopDiscount {
case is Int:
    print("Variable type is Int, Value:\(shopDiscount)")
case let shopDiscount as String:
    print("Variable type is String, Value: \(shopDiscount)")
default:
    print("I don't know maybe \(type(of:shopDiscount)), Value:\(shopDiscount)")
}
/*
var shopDiscount: String? = "0.5"
    //Variable type is String, Value: 0.5
var shopDiscount: Int? = 1
    // Variable type is Int, Value:Optional(1)
var shopDiscount: String?
    // I don't know maybe Optional<String>, Value:nil
*/


//------------------------------------------
// No Implicit Fallthrough
//------------------------------------------


var pressNumber: String = "1"
switch pressNumber{
case "one", "1":
    print("Press 1")
case "two", "2":
    print("Press 2")
default:
    print("Press Any Key")
}
// Press 1


let compass = ("North", "East", "South", "West")
print(type(of:(compass)))
// (String, String, String, String)
print(compass)
//("North", "East", "South", "West")
let heading = compass.1

switch heading{
    case compass.0:
        print("heading to \(compass.0)")
    case compass.1:
        print("heading to \(compass.1)")
    case compass.2:
        print("heading to \(compass.2)")
    default:
        print("heading to \(compass.3)")
}
// heading to East




//------------------------------------------
// Interval Matching
//------------------------------------------

var rating = 5

switch rating {
case 0...1:
    print("not good")

case 2...3:
    print("good")

case 4...5:
    print("Excellent!")

default:
    print("out of range... may nil value?")
}
// Excellent!

age = 20
switch age{
case 0..<13:
    ticketPrice = (ticketPrice * (1 - discount["Kid"]!) * vat)
    print("Pay for Ticket: \(ticketPrice)")
case 13...19:
    ticketPrice = (ticketPrice * (1 - discount["Teenager"]!) * vat)
    print("Pay for Ticket: \(ticketPrice)")
case 20..<60:
    ticketPrice = (ticketPrice * (1 - discount["Adult"]!) * vat)
    print("Pay for Ticket: \(ticketPrice)")
default:
    ticketPrice = (ticketPrice * (1 - discount["Old-Adult"]!) * vat)
    print("Pay for Ticket: \(ticketPrice)")
}
// Pay for Ticket: 107.0

//------------------------------------------
// Tuples
//------------------------------------------
// tuple ใส่วงเล็บ () เช็ค condition

var macbook = (name: "MacBook Pro", price: 1099.99, MadeIn: "Japan")
print(type(of:macbook))
// (name: String, price: Double, MadeIn: String)
print(macbook.name)
print(macbook.price)
print(macbook.MadeIn)
print(macbook)
/*
MacBook Pro
1099.99
Japan
(name: "MacBook", price: 1099.99, MadeIn: "Japan")
*/

switch macbook {
case ("MacBook Air", _, _):
    print("i want some \(macbook.name) no matter what price is")
case ("MacBook Air", _, _):
    print("i want \(macbook.name) and Only Madein \(macbook.MadeIn)")
case (let name, 1099.99, _):
    print("i have 1099.99$, let get some \(name)")
case (let name, let price, "Japan"):
    print("can you have any \(name) that was made in \(macbook.MadeIn) and the price around \(price)$ ?")
default:
    print("i dont have any money left")
}
// i have 1099.99$, let get some MacBook Pro

var tupleFiveAndNine = (5, 9)
switch tupleFiveAndNine{
case (1, 3):
    print("1, 3")
case (1...3, 3...6):
    print("1...3, 3...6")
case (..<1, 10...):
    print("..<1, 10...")
case (5, 10...):
    print("5, 10...")
default:
    print("not in above case")
}
// not in above case
  

//------------------------------------------
// Value Bindings
//------------------------------------------

switch tupleFiveAndNine{
case (1, 3):
    print("1, 3")
case (1...3, 3...6):
    print("1...3, 3...6")
case (..<1, 10...):
    print("..<1, 10...")
case (let element1, 10):
    print("\(element1), 10")
case (5, let element2):
    print("5, \(element2)")
case (let element1, let element2):
    print("not found your number \(element1), \(element2)")
}
// 5, 9

// var violin = (name: "Maliso", desc:(color: "blue", price: 100))
var violin: (name: String, desc: (color: String, price:Double))
            = ("Maliso", ("blue", 100))
print(type(of:violin)) // (name: String, desc: (color: String, price: Double))
print(violin)

print(violin.desc.color) // blue
print(violin.1.0) // blue
violin.name = "Hardanger Fiddle"
violin.desc.color = "Brown"
violin.desc.price = 1002

switch violin{
case ("Maliso", ("red", let price)):
    print("Violin Number 1: \("'Maliso'")\ncolor: red and price: \(price)")
case ("Maliso", ("blue", 100)):
    print("Violin Number 2: '\("Maliso")'\ncolor: blue and price: \(100)")
case (let name, ("blue", let price)):
    print("Violin Number 3: '\(name)'\ncolor: \(violin.desc.color) and price: \(price)")
case (let name, (let color, 1000.0)):
    print("Violin Number 4: '\(name)'\ncolor: \(violin.desc.color) and price: \(100)")
case (let name, (let color, let price)):
    print("Violin Number 99: '\(name)'\ncolor: \(violin.desc.color) and price: \(price)")
}
/*
Violin Number 99: 'Hardanger Fiddle'
color: Brown and price: 1002.0
*/




//------------------------------------------
// Where
//------------------------------------------


switch tupleFiveAndNine{
case let (element1, element2) where (element1 == element2):
    print("\(element1) == \(element2)")
case let (element1, element2) where (element1 * 2) == element2:
    print("\(element1)^2 == \(element2)")
case let (element1, element2) where element1 == (element2 * 2):
    print("\(element1) == \(element2)^2")
case let (element1, element2) where (element1 + 5) == (element2 + 1):
    print("(\(element1) + 5) == (\(element2) + 1)")
default:
    print("not found condition")
}
// (5 + 5) == (9 + 1)


let alanMira = ["Name": "Alan", "Surname": "Mira"]
let findName = "Name"

switch findName {
case _ where alanMira[findName] != nil:
    print(alanMira[findName])
case "ID":
    print("ID : \(findName)")
default:
    print("cannot found data")
}
// Optional("Alan")



var scores = (59, 60)
switch scores {
case (let math, 0..<50), (0..<50, let math):
    print("Grade F: \(scores)")
case (50..<60, 50..<60):
    print("Grade D: \(scores)")
case let (math, 60..<70), let (60..<70, math) where (math >= 60 && math < 70): // ตัวอย่าง (69, 60)
    print("Grade C: \(scores)")
case (100, 100):
    print("Grade A and Perfect!: \(scores)")
case (70...100, 70...100):
    print("Grade A: \(scores)")
default:
    print("cannot find your exam: \(scores)")
}
// Grade C: (59, 60)

var frame = (x: 10, y: 50, width: 100, height: 100)
// frame.width = 0
// frame.height = 0

switch frame {
case (_, _, 0, 0), let (_, _, 0, 0):
    print("cannot set to zero: \(frame)")
case let (_, _, width, height) where ((width == height)): // ทำเงื่อนไขนี้ก่อน width == 100
    print("width(\(width)) == height(\(height))")
case (_, _, let width, _) where width == 100:
	print("width = 100")
case let(x, y, width, height): // default
	print("\(frame)")
}
// width(100) == height(100)



//------------------------------------------
// Compound Cases
//------------------------------------------


let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("On an axis, \(distance) from the origin")
default:
    print("Not on an axis")
}
// Prints "On an axis, 9 from the origin"




let someCharacter: Character = "e"
switch someCharacter {
case "a", "e", "i", "o", "u":
    print("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
        "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter) is a consonant")
default:
    print("\(someCharacter) isn't a vowel or a consonant")
}
// Prints "e is a vowel"




var goToCountry = "Thailand" 

switch goToCountry {
    case "France", "Spain", "England":
        print("goto \(goToCountry) Ticket Price: 5000$")
    case "South Africa", "Brazil", "Georgia":
        print("goto \(goToCountry) Ticket Price: 2500$")
    case "Japan", "China", "Thailand":
        print("goto \(goToCountry) Ticket Price: 500$")
    default: 
        print("we cant go to \(goToCountry) yet")
}



var europe: [String] = []
var asia: [String] = []
var otherRegion: [String] = []

let world = [
    "BEL": "Belgium",
    "ITA": "Italy",
    "GER": "Germany",
    "THA": "Thailand",
    "JAP": "Japan",
    "CHN": "CHINA",
    "BRA": "Brazil",
    "DEN": "Denmark"
    ]

for (key, value) in world {
    switch key {
    case "BEL", "ITA", "GER" where world[key] != nil:
        europe.append(value)
    case "THA", "JAP", "CHN":
        asia.append(value)
    default:
        otherRegion.append(value)
    }
}
print("Europe \(europe)")
print("Asia \(asia)")
print("otherRegion \(otherRegion)")

/*
Europe ["Italy", "Belgium", "Germany"]
Asia ["CHINA", "Japan", "Thailand"]
otherRegion ["Denmark", "Brazil"]
*/



let personalDataArray = (
        Male:["Alan Mira","Luke Skywalker", "Anakin Skywaler"],
        Female:["Snow White","Peter Pan", "Pan Peter"]
        )
print(type(of:personalDataArray))
    // (Male: Array<String>, Female: Array<String>)

print(personalDataArray)
// (Male: ["Alan Mira", "Luke Skywalker", "Anakin Skywaler"], Female: ["Snow White", "Peter Pan", "Pan Peter"])
// print(personalData.Male)
// ["Alan Mira", "Luke Skywalker", "Anakin Skywaler"]

switch personalDataArray {
case let (myMale, myFemale) where (myMale == personalDataArray.Male && myFemale == personalDataArray.Female):
    maleData = myMale
    femaleData = myFemale
case let (myMale, secondData) where (myMale == personalDataArray.Male):
    maleData = myMale
    noFilterData = secondData
    // maleData.append(myMale) // *error* ตัว array append ข้อมูลที่เป็น array ไม่ได้
    // print(myData)
    // print(type(of:maleData))
case let (firstData, myFemale) where (myFemale == personalDataArray.Female):
    femaleData = myFemale
    noFilterData = firstData
case let (firstItem, secondItem):
    for item in firstItem{
        noFilterData.append(item)
    }
    for item in secondItem{
        noFilterData.append(item)
    }
}
print(maleData)
// ["Alan Mira", "Luke Skywalker", "Anakin Skywaler"]
print(femaleData)
// ["Snow White", "Peter Pan", "Pan Peter"]




let personalDataDict: [String:[String]] = [
    "Male": ["Alan Mira","Luke Skywalker", "Anakin Skywaler"],
    "Female":["Snow White","Peter Pan", "Pan Peter"],
    "Someone":["Alexsandrea", "Brazil"]
    ]
/*
    Dictionary<String, Array<String>>

["Someone": ["Alexsandrea", "Brazil"],
"Female": ["Snow White", "Peter Pan", "Pan Peter"],
"Male": ["Alan Mira", "Luke Skywalker", "Anakin Skywaler"]]
*/

maleData = []
femaleData = []
noFilterData = []
for (key, value) in personalDataDict{
    switch key{
        case (let data) where (data == "Male"):
            maleData = value
        case (let data) where (data == "Female"):
            femaleData = value
        case let (data):
            for item in value{
                noFilterData.append(item)
            }
    }
}

print("/////")
print("maleData :", maleData)
print("femaleData: ", femaleData)
print("noFilterData: ",noFilterData)
print("/////")
/*
/////
maleData : ["Alan Mira", "Luke Skywalker", "Anakin Skywaler"]
femaleData:  ["Snow White", "Peter Pan", "Pan Peter"]
noFilterData:  ["Alexsandrea", "Brazil"]
/////
*/



var personalDataArrayDict: Array = [ 
                    Dictionary <String, String>
                    ] ()
// var personalDataArrayDict: Array = [ 
//                     ["Name": "Emiya"],
//                     ["Surname": "Shirou"]
//                     ]
print(type(of:personalDataArrayDict))
// Array<Dictionary<String, String>>
print(personalDataArrayDict)
// []

var emiyaName = ["Name" : "Emiya", "Surname" : "Shirou"]
var anakinName = ["Name": "Anakin", "Surname": "Skywalker"]

personalDataArrayDict.append(emiyaName)
personalDataArrayDict.append(anakinName)
print(personalDataArrayDict)
print(personalDataArrayDict[0]["Name"])
// Optional("Emiya")

for data in personalDataArrayDict{
    // print(i)
    switch data{
        case let (name) where name["Name"] == "Emiya":
            print("Hello \(name))")
            // print("")
        case let (name) where personalDataArrayDict[1]["Name"] == "Anakin":
            print("Hello there \(name)")
        default:
            print("who are you?")
    }
}



var ส่วนผสม = (
                เนื้อ: "ไก่ 1 ตัว", ใบกะเพรา: "2 กำ", พริกขี้หนู: "9 เม็ด", กระเทียม: "5 หัว", น้ำปลา: "3 ช้อน",
                น้ำตาล: "1 ช้อน", น้ำมันหอย: "1 ช้อนโต๊ะ", มีพริก:"ใช่"
            )
print(ส่วนผสม)
// (เนื้อ: "ไก่ 1 ตัว", ใบกะเพรา: "2 กำ", พริกขี้หนู: "9 เม็ด", กระเทียม: "5 หัว", น้ำปลา: "3 ช้อน", น้ำตาล: "1 ช้อน", น้ำมันหอย: "1 ช้อนโต๊ะ", มีพริก: "ใช่")

var ผัดกะเพรา = (ชื่ออาหาร: "ผัดกะเพรา", ส่วนผสม: ส่วนผสม)
print(type(of:ผัดกะเพรา))
// (ชื่ออาหาร: String, ส่วนผสม: (เนื้อ: String, ใบกะเพรา: String, พริกขี้หนู: String, กระเทียม: String, น้ำปลา: String, น้ำตาล: String, น้ำมันหอย: String, มีพริก: String))
print(ผัดกะเพรา)
// (ชื่ออาหาร: "ผัดกะเพรา", 
// ส่วนผสม: (เนื้อ: "ไก่ 1 ตัว", ใบกะเพรา: "2 กำ", พริกขี้หนู: "9 เม็ด", กระเทียม: "5 หัว", น้ำปลา: "3 ช้อน", น้ำตาล: "1 ช้อน", น้ำมันหอย: "1 ช้อนโต๊ะ", มีพริก: "ใช่"))

print(ผัดกะเพรา.ส่วนผสม)
// (เนื้อ: "ไก่ 1 ตัว", ใบกะเพรา: "2 กำ", พริกขี้หนู: "9 เม็ด", 
// กระเทียม: "5 หัว", น้ำปลา: "3 ช้อน", น้ำตาล: "1 ช้อน", น้ำมันหอย: "1 ช้อนโต๊ะ", มีพริก: "ใช่"

switch ผัดกะเพรา{
    case let (_, ส่วนผสม) where ส่วนผสม.มีพริก == "ใช่":
        print("ไม่กินเผ็ดดดดด")
    default:
        print("กินได้หมด")
}
// ไม่กินเผ็ดดดดด




//------------------------------------------
// Control Transfer Statements
//------------------------------------------
/*
    continue
    break
    fallthrough
    return
    throw

*/

//------------------------------------------
// Continue
//------------------------------------------

let puzzleInput = "great minds think alike"
var puzzleOutput = ""
let charactersToRemove: [Character] = ["a", "e", "i", "o", "u", " "]


for character in puzzleInput {
    if charactersToRemove.contains(character) {
        continue
    }
    puzzleOutput.append(character)
}
print(puzzleOutput)
// Prints "grtmndsthnklk"

puzzleOutput = ""
for character in puzzleInput{
    switch character {
    case _ where charactersToRemove.contains(character):
        continue
    default:
        puzzleOutput.append(character)
    }
}
print(puzzleOutput)
// grtmndsthnklk



for i in 2...3 {
    for j in 1...3 {
        if (j == 1) {
            continue // กลับไปเช็คเงื่อนไข for j
        }else if (j == 3){
            break
        }
        print("\(i) * \(j) = \(i * j)")
    }
}
/*
2 * 2 = 4
3 * 2 = 6
*/


//------------------------------------------
// Break
//------------------------------------------

/*
Break in a Loop Statement
Break in a Switch Statement
*/
    //------------------------------------------
    // Break in a Loop Statement
    //------------------------------------------

for number in 1...10{
   if number % 5 == 0{
       print(number)
       break
   } 
}
// 5

var intOne = 1
repeat{
    print("2 * \(intOne) = \(intOne * 2)")
    intOne += 1
    if intOne == 3{
        break
    }
}while (intOne <= 10)
/*
2 * 1 = 2
2 * 2 = 4
*/

outer: for i in 2...3 {
   inner: for j in 1...3 {
        if j == 3 {
            break outer
        }
        print("\(i) * \(j) = \(i * j)")
   }
}
/*
2 * 1 = 2
2 * 2 = 4
*/

    //------------------------------------------
    // Break in a Switch Statement
    //------------------------------------------

let numberSymbol: Character = "三"  // Chinese symbol for the number 3
var possibleIntegerValue: Int?
switch numberSymbol {
case "1", "١", "一", "๑":
    possibleIntegerValue = 1
case "2", "٢", "二", "๒":
    possibleIntegerValue = 2
case "3", "٣", "三", "๓":
    possibleIntegerValue = 3
case "4", "٤", "四", "๔":
    possibleIntegerValue = 4
default:
    break
}
if let integerValue = possibleIntegerValue {
    print("The integer value of \(numberSymbol) is \(integerValue).")
} else {
    print("An integer value couldn't be found for \(numberSymbol).")
}
// Prints "The integer value of 三 is 3."


var coffee: Dictionary<String, Any> = [
    "coffee": "Black Coffee",
    "sugar" : 3
    ]
print(type(of:coffee))
// Dictionary<String, Any>
print(coffee)
// ["coffee": "Black Coffee", "sugar": 3]

let ten = 10
let sizeOfCoffee: Dictionary<String, Any> = [
    "type":coffee,
    "side":3
]
print(type(of:sizeOfCoffee))
// Dictionary<String, Any>
print(sizeOfCoffee)
// ["type": ["coffee": "Black Coffee", "sugar": 3], "side": 3]

if let size = sizeOfCoffee["side"] as? Int{
    if let type = sizeOfCoffee["type"]{
        print(type)
        print("Size:")
    }
    switch size{
        case 1:
            print("Small")
        case 2:
            print("Medium")
        case 3:
            print("Large")
        default:
            print("Wrong size")
            break;
    }
}
/*
["coffee": "Black Coffee", "sugar": 3]
Size:
Large
*/


let anyItems: [Any] = [
    "String", 10, 10.5, true, "true", "20", false
    ]

for item in anyItems {
    switch item {
    case let item as Int:
        print("This Variable is Int, Value: \(item)")
    case let item as Double:
        print("This Variable is Double, Value: \(item)")
    case let item as String:
        print("This Variable is String, Value: \(item)")
    case let item as Bool:
        print("This Variable is Bool, Value: \(item)")
    default:
        break
    }
}
/*
This Variable is String, Value: String
This Variable is Int, Value: 10
This Variable is Double, Value: 10.5
This Variable is Bool, Value: true
This Variable is String, Value: true
This Variable is String, Value: 20
This Variable is Bool, Value: false
*/


//------------------------------------------
// Fallthrough
//------------------------------------------

let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer."
}
print(description)
// Prints "The number 5 is a prime number, and also an integer."


var chapter = 3

switch chapter {
case 1:
    print("clear Chapter 1")
    fallthrough
case 2:
    print("clear Chapter 2")
    fallthrough
case 3:
    print("clear Chapter 3")
    fallthrough
case 4:
    print("clear Chapter 4")
    fallthrough
case 5:
    print("cannot play Chapter 5 yet")
default:
    print("play again")
}
/*
clear Chapter 3
clear Chapter 4
cannot play Chapter 5 yet
*/



//------------------------------------------
// Labeled Statements
//------------------------------------------


/*
    let finalSquare = 25
    var board = [Int](repeating: 0, count: finalSquare + 1)
    board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
    board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    var square = 0
    var diceRoll = 0
*/

gameLoop: while square != finalSquare {
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    switch square + diceRoll {
    case finalSquare:
        // diceRoll will move us to the final square, so the game is over
        break gameLoop
    case let newSquare where newSquare > finalSquare:
        // diceRoll will move us beyond the final square, so roll again
        continue gameLoop
    default:
        // this is a valid move, so find out its effect
        square += diceRoll
        square += board[square]
    }
}
print("Game over!")


if let cof = coffee["sugar"] as? Int{
    outsideLoop:for iterator in 1...ten{
        switch iterator{
            case 3:
                print("Take \(iterator)/\(ten) sugar")
                break outsideLoop
            default:
                print("Take \(iterator)/\(ten) sugar")
        }
    }
}
/*
Take 1/10 sugar
Take 2/10 sugar
Take 3/10 sugar
*/



//------------------------------------------
// Early Exit
//------------------------------------------

    func greet(person: [String: String]) {
        guard let name = person["name"] else {
            return
        }

        print("Hello \(name)!")

        guard let location = person["location"] else {
            print("I hope the weather is nice near you.")
            return
        }

        print("I hope the weather is nice in \(location).")
    }

    greet(person: ["name": "John"])
    // Prints "Hello John!"
    // Prints "I hope the weather is nice near you."
    greet(person: ["name": "Jane", "location": "Cupertino"])
    // Prints "Hello Jane!"
    // Prints "I hope the weather is nice in Cupertino."

func isRangeInTen(number: Int)
{
    guard number >= 1, number < 10 else
    {
        print("\(number) >= 10")
        return
    }
    print("\(number) < 10")
}
 
isRangeInTen(number: 1)
isRangeInTen(number: 999999999999999999)
/*
1 < 10
999999999999999999 >= 10
*/

var optionalString: String? = "value String"
var optionalInt: Int? = 99999999999999999

var optionalBool: Bool?
var getValueFormOptionalBool = optionalBool as Any
var optionalAny: Any?
var emptyAnyArray: Any = []

print(optionalBool==nil)
print(getValueFormOptionalBool==nil)
print(optionalAny==nil)
print(emptyAnyArray==nil)
/*
true
false
true
false
*/

func isValue(value: Any?){
    guard let data = value else{
        print("No value in this data")
        // assertionFailure("No value in this data") 
        return
    }
    print("=====")
    print("datatype of data : ", type(of:(data)))
    print("value in this data : ", data)
    print("=====\n")
}
isValue(value:optionalString)
isValue(value:3)
isValue(value:optionalAny) // nil
/*
=====
datatype of data :  String
value in this data :  value String
=====

=====
datatype of data :  Int
value in this data :  3
=====

No value in this data
*/



let element = (
    fire:"Fire", water:"Water", earth:"Earth",
    wind:"Wind", light:"Light", dark:"Dark"
    )
var emiya: [String: Any] = [
    "Name": "Emiya",
    "HP": 100,
    "Atk": 1,
    "Turn":2,
    "Element":element.fire
    ]

var belze: [String: Any] = [
    "Name": "Belze",
    "HP": 5,
    "Atk": 1,
    "Turn":1,
    "Element":element.wind
]


if !emiya.isEmpty && !belze.isEmpty{
    if let turn = emiya["Turn"] as? Int{
        print("turn", turn)
        if var monsterHP = belze["HP"] as? Int{
            roundLoop:for round in 1...turn{
                guard let player = emiya["Name"] else {
                    print("Not Found Player")
                    break roundLoop
                }
                switch monsterHP{
                case 0:
                    print("\(belze["Name"]!) DEAD") // *warning* force unwrap
                    break roundLoop
                default:
                    monsterHP -= emiya["Atk"] as! Int // *warning* force unwrap
                    print("Monster HP : ", monsterHP)
                    print("\(player) Attack Monster")
                }
            }        
        }
    }
}



func checkDict(data: Any?){
    guard let value = data else{
        print("no value")
        return
    }
    print(value)
}

checkDict(data: emiya["Name"])

//------------------------------------------
// Checking API Availability
//------------------------------------------

/*
    if #available(platform name version, ..., *) {
        statements to execute if the APIs are available
    } else {
        fallback statements to execute if the APIs are unavailable
    }

*/
    if #available(iOS 10, macOS 10.12, *) {
        // Use iOS 10 APIs on iOS, and use macOS 10.12 APIs on macOS
    } else {
        // Fall back to earlier iOS and macOS APIs
    }


if #available(iOS 13, *) {
    print("iOS 13 is avalible")
} else {
    print("iOS 13 is not avalible")
}
// iOS 13 is avalible

func checkVersion(){
    guard #available(iOS 13, *) else {
        print("iOS 13 is not avalible")
        return
    }
    print("iOS 13 is avalible")
}

checkVersion()
// iOS 13 is avalible



//------------------------------------------


