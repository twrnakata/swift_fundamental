//------------------------------------------
// String Literals
//------------------------------------------

/*
\0	the null character
\\	a plain backslash, \
\t	a tab character
\v	a vertical tab
\r	a carriage return
\n	a line feed ("newline")
\"	a double quote, "
\'	a single quote, '
\u{n}	the Unicode code point n (in hexadecimal)
*/

let someString = "Some string literal value"
print(type(of:(someString))) // String

let heartEmoji = "\u{1F496}"
print(heartEmoji) // 💖

let chrH: Character = "H"
print(chrH) // H

//------------------------------------------
// Multiline String Literals
//------------------------------------------

let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""
print(type(of:quotation)) // String
/*
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."

*/

let singleLineString = "These are the same."
let multilineString = """
These are the same.
"""
print(singleLineString) // These are the same.
print(multilineString) // These are the same.

    let softWrappedQuotation = """
    The White Rabbit put on his spectacles.  "Where shall I begin, \
    please your Majesty?" he asked.

    "Begin at the beginning," the King said gravely, "and go on \
    till you come to the end; then stop."
    """
print(softWrappedQuotation)
/*
The White Rabbit put on his spectacles.  "Where shall I begin, please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on till you come to the end; then stop."
*/


    let lineBreaks = """

    This string starts with a line break.
    It also ends with a line break.

    """
print(lineBreaks)
/*

This string starts with a line break.
It also ends with a line break.

*/

let longString = """
Mada kono sekai wa  boku wo kainarashitetai mitai da 
nozomi doori ii darou 
                utsukushiku mogaku yo 

        Tagai no sunadokei  nagame nagara kisu wo shiyou yo 
"sayonara"      kara ichiban tooi  basho de machi awaseyou

Jisho ni aru kotoba de  dekiagatta sekai wo nikunda mangekyou no naka de  hachigatsu no aru as

"ss"

"""

print(longString)
/*
Mada kono sekai wa  boku wo kainarashitetai mitai da 
nozomi doori ii darou 
                utsukushiku mogaku yo 

        Tagai no sunadokei  nagame nagara kisu wo shiyou yo 
"sayonara"      kara ichiban tooi  basho de machi awaseyou

Jisho ni aru kotoba de  dekiagatta sekai wo nikunda mangekyou no naka de  hachigatsu no aru as

"ss"

*/



//------------------------------------------
// Special Characters in String Literals
//------------------------------------------
/*
The escaped special characters \0 (null character), 
\\ (backslash), \t (horizontal tab), \n (line feed),
\r (carriage return), \" (double quotation mark) and \' (single quotation mark)
An arbitrary Unicode scalar value, written as \u{n},
where n is a 1–8 digit hexadecimal number (Unicode is discussed in Unicode below)
*/

let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
print(wiseWords) // "Imagination is more important than knowledge" - Einstein

let dollarSign = "\u{24}"        // $,  Unicode scalar U+0024
let blackHeart = "\u{2665}"      // ♥,  Unicode scalar U+2665
let sparklingHeart = "\u{1F496}" // 💖, Unicode scalar U+1F496
print(dollarSign) // $
print(blackHeart) // ♥
print(sparklingHeart) // 💖


// Unicode
print("\u{1F425}")
var eHat1 = "\u{E9}" 
print(eHat1) // é
var eHat2 = "\u{65}\u{301}"
print(eHat2) // é
// Check eHat1 == eHat2?
print(eHat1 == eHat2) // true
var dog = "\u{1F436}"
print(dog) // 🐶

/*
let threeDoubleQuotationMarks =
"""
Escaping the first quotation mark \"""
Escaping all three quotation marks \"\"\"
\\Escaping
\tEscaping 
\nEscaping
\rEscaping
"E"scaping 
\"E"scaping
\\E\ts\nc\ra\tp\rin\0g
"""
print(threeDoubleQuotationMarks)

// แสดงผล
Escaping the first quotation mark """
Escaping all three quotation marks """
\Escaping
	Escaping 

Escaping

Escaping
"E"scaping 
"E"scaping
\E	s
c
a	p
ing
//
*/

let doubleQuoteInQuote = "\"It's okay\", didn't\tthey?"
print(doubleQuoteInQuote) // "It's okay", didn't	they?

let starWarsCharacters = [
                            """
                            ลุค\tสกายวอล์คเกอร์
                            """,
                            """
                            ฮัน โซโล
                            """,
                            #"""
                            เลอา ออร์กานา
                            """#
                        ]
for person in starWarsCharacters{
    print(person)
}
/*
ลุค	สกายวอล์คเกอร์
ฮัน โซโล
เลอา ออร์กานา
*/

print(starWarsCharacters)
// ["ลุค\tสกายวอล์คเกอร์", "ฮัน โซโล", "เลอา ออร์กานา"]



//------------------------------------------
// Extended String Delimiters
//------------------------------------------


/*
let threeMoreDoubleQuotationMarks = #"""
Here are three more double quotes: """
"""#
print(threeMoreDoubleQuotationMarks)
// Here are three more double quotes: """

*/


//------------------------------------------
// Initializing an Empty String
//------------------------------------------

var emptyString = ""  
var anotherEmptyString = String()
print(emptyString)
print(type(of:(anotherEmptyString))) // String
print(anotherEmptyString)

print(emptyString == anotherEmptyString) // true

if emptyString.isEmpty && anotherEmptyString.isEmpty{
    print("Nothing to see here")
}
// "Nothing to see here"

print(type(of:(wiseWords.isEmpty))) // bool
print((wiseWords.isEmpty) ? "yes": "no") // no


//------------------------------------------
// String Mutability
//------------------------------------------

let sayBat = "Bat"
let sayMan = "man"
print("\(sayBat)\(sayMan)") // Batman
print(sayBat+sayMan) // Batman
var sayBatman = "\(sayBat)\(sayMan)"
print(sayBatman) // Batman

//------------------------------------------
// Concatenating Strings and Characters
//------------------------------------------

sayBatman = sayBat + sayMan
print(sayBatman) // Batman
sayBatman = "Bat"
print(sayBatman) // Bat
sayBatman += sayMan
print(sayBatman) // Batman
sayBatman = "Bat"
sayBatman += "\t" + sayMan
print(sayBatman) // Bat man


var batOptional : String? // This is an optional.
batOptional = "Bat"
print(type(of:batOptional)) // Optional<String>
print(batOptional) // Optional("Bat")

var manOptional : String! // This is not optional.
manOptional = "man"
print(type(of:manOptional)) // Optional<String>
print(manOptional) // some("man")

batOptional! += manOptional

print(batOptional!) // Batman

let wordR: Character = "R"
let wordE: Character = "E"
let wordD: Character = "D"

// var charRed: [Character] = []
var charRed: [Character] = [wordR, wordE, wordD]
// var charRed = Array(repeating: String(), count: 3)
print(type(of:charRed)) // Array<Character>
print(charRed)
// ["R", "E", "D"]

var stringRed = ""
if charRed.isEmpty{
    print("empty")
}else{
    for item in charRed{
        stringRed.append(item)
    }
}
print(stringRed) // RED


var optionalCharRed: [Character]? = [wordR, wordE, wordD]
print(type(of:optionalCharRed)) // Array<Optional<Character>>
print(optionalCharRed) // Optional(["R", "E", "D"])

stringRed = ""
if let itemInOptionalCharRed = optionalCharRed {
    for item in itemInOptionalCharRed{
        stringRed.append(item)
    }
}else{
    print("empty optional")
}
print(stringRed) // RED

//------------------------------------------
// Strings Are Value Types
//------------------------------------------


for item in batOptional!{
    print(item, terminator:" ")
}
// B a t m a n 
print("")

for item in manOptional{
    print(item, terminator:" ")
}
// m a n 
print("")


for character in "Zombie \u{1F9DF}"{
    print(character)
}
/*
Z
o
m
b
i
e
 
🧟
*/

let zombieEmoji: Character = "\u{1F9DF}"
print(zombieEmoji)
let zombieCharacer: [Character] = ["Z", "o", "m", "b", "i", "e", zombieEmoji]

for sayZom in zombieCharacer{
    print(sayZom)
}
/*
Z
o
m
b
i
e
🧟
*/
print(zombieCharacer) // ["Z", "o", "m", "b", "i", "e", "🧟"]


let zombieSayHi: [Any]! = ["Hi from Zombie", zombieEmoji]

if let zombie = zombieSayHi {
    for item in zombie {
        print("\(item)")
    }
}
/*
Hi from Zombie
🧟
*/

/*
note
    let badStart = """
    one
    two
    """
    let end = """
    three
    """
    print(badStart + end)
    // Prints two lines:
    // one
    // twothree

    let goodStart = """
    one
    two

    """
    print(goodStart + end)
    // Prints three lines:
    // one
    // two
    // three

*/


//------------------------------------------
// String Interpolation
//------------------------------------------

var godzillaName = "Godzilla🐉"
var godzillaAge = 1000
print("\(godzillaName) อาศัยอยู่บนโลกมา \(godzillaAge) ปี และเมื่อผ่านไปอีก \(godzillaAge) ปี \(godzillaName) จะมีอายุ \(godzillaAge * 2) ปี")
// Godzilla🐉 อาศัยอยู่บนโลกมา 1000 ปี และเมื่อผ่านไปอีก 1000 ปี Godzilla🐉 จะมีอายุ 2000 ปี

var stortOfGodzilla = """
\(godzillaName) อาศัยอยู่บนโลกมา \(godzillaAge) ปี \
และเมื่อผ่านไปอีก \(godzillaAge) ปี \
\(godzillaName) จะมีอายุ \(godzillaAge * 2) ปี
"""
print(stortOfGodzilla)
// Godzilla🐉 อาศัยอยู่บนโลกมา 1000 ปี และเมื่อผ่านไปอีก 1000 ปี Godzilla🐉 จะมีอายุ 2000 ปี


let apples = 4
// print("ก๊อดซิล่ามีแอปเปิ้ล \(apples) ผล แต่มีเพื่อนมายืมแอปเปิ้ลไป \(apples+1) ลูก ก๊อดซิล่าเลย" + ((apples > 4) ? "ให้" : "ไม่ให้") + "แอปเปิ้ลไป")
// ก๊อดซิล่ามีแอปเปิ้ล 4 ผล แต่มีเพื่อนมายืมแอปเปิ้ลไป 5 ลูก ก๊อดซิล่าเลยไม่ให้แอปเปิ้ลไป

print("""
ก๊อดซิล่ามีแอปเปิ้ล \(apples) ผล แต่มีเพื่อนมายืมแอปเปิ้ลไป \(apples+1) ลูก\
ก๊อดซิล่าเลย \((apples > 4) ? "ให้" : "ไม่ให้") แอปเปิ้ลไป
""")
// ก๊อดซิล่ามีแอปเปิ้ล 4 ผล แต่มีเพื่อนมายืมแอปเปิ้ลไป 5 ลูกก๊อดซิล่าเลย ไม่ให้ แอปเปิ้ลไป


let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
// message is "3 times 2.5 is 7.5"

print(#"Write an interpolated string in Swift using \(multiplier)."#)
// Prints "Write an interpolated string in Swift using \(multiplier)."
print(#"Write an interpolated string in Swift using \#(multiplier)."#)

var score = 85
print("Your score\r\(score)")
// Your score
// 85


// The expressions you write inside parentheses within
// an interpolated string can’t contain an unescaped backslash (\),
//  a carriage return, or a line feed. However, 
// they can contain other string literals.
print(#"6 times 7 is\t\ \r# \(6 * 7)."#)
// 6 times 7 is\t\ \r# \(6 * 7).



//------------------------------------------
// Unicode
//------------------------------------------

// ช่วงที่ใช้ได้คือ U+0000 to U+D7FF
// ตัวอย่าง
print("\u{2022}") // •
print("\u{00AB}") // «
print("\u{2691}") // ⚑

let airplaneUni = Unicode.Scalar(9992)!
print(airplaneUni) // ✈︎



let unicodeString = "UniCode"
// let unicodeString = ["U", "n", "i", "C","o","d","e"]
var unicodeScalarWord: [UInt32] = []
print(type(of:unicodeScalarWord))
// Array<UInt32>

// แปลง String เป็น Scalar แล้วเก็บเป็น Arrays [UInt32]
for item in unicodeString.unicodeScalars{
    print(item.value, terminator:" ")
    unicodeScalarWord.append((item.value))
    // unicodeScalarWord.append(UnicodeScalar(item).value)
    // print(type(of:item)) // Scalar
}
// 85 110 105 67 111 100 101 

print("")

// แสดงค่าใน UInt32 เป็น Scalar
for item in unicodeScalarWord{
    print(UnicodeScalar(item)!, terminator:"")
    // print(type(of:(UnicodeScalar(item)!))) // Scalar
    // print(type(of:item)) // UInt32
}
// UniCode
print("")




//------------------------------------------
// Extended Grapheme Clusters
//------------------------------------------
/*
เป็นตัวอักษรที่มนุษย์อ่านรู้เรื่อง
ซึ่งจะประกอบด้วยลำดับของ Unicode scalars อาจจะมี 1 ตัวหรือมากกว่า 1 ตัว
ประกอบรวมกันเป็นคำ 1 Charaters
*/

// อย่างเช่นตัว é เป็นตัวอักษรที่มนุษย์เข้าใจ แต่การจะสร้างตัว é มีวิธีสร้างได้หลายวิธี
let eAcute: Character = "\u{E9}"
// é
let combinedEAcute: Character = "\u{65}\u{301}"
// e ตามด้วย ́

// อักษรในภาษาเกาหลี
let precomposedKoreaChr: Character = "\u{D55C}"
// 한
let decomposedKoreaChr: Character = "\u{1112}\u{1161}\u{11AB}"
// ᄒ, ᅡ, ᆫ
// precomposedKoreaChr is 한, decomposedKoreaChr is 한


let enclosedEAcute: Character = "\u{E9}\u{20DD}" // é⃝

let คน =  "\u{30a4}" // イ
let ต้นไม้ = "\u{6728}" // 木

let พักผ่อน = คน + ต้นไม้ // เกิดจากการรวม イ+木 = 休
print(พักผ่อน.unicodeScalars) // イ木
let พักผ่อนUni = "\u{4f11}" // 休
print(พักผ่อนUni.unicodeScalars) // 休

let ป่าโปร่ง = ต้นไม้ + ต้นไม้ // เกิดจากการรวม 木+木 = 休
let ป่าโปร่งUni = "\u{6797}" // 林

var smileString: String = "0. 😊 0."
var worldChr: Character = "🌍"

print(smileString.utf8) // 0. 😊 0.
print(smileString.utf16) // 0. 😊 0.
print(smileString.unicodeScalars) // 0. 😊 0.

print(String(worldChr).utf8) // 🌍
print(String(worldChr).utf16) // 🌍
print(String(worldChr).unicodeScalars) // 🌍

let café = "Caf\(eAcute) 🌍"
print(café)
// Café 🌍

let cafe = "Caf\(combinedEAcute) 🌍"
print(cafe)
// Café 🌍


print(café.count) // 6
print(cafe.count) // 6
print(cafe == café) // true



//------------------------------------------
// Counting Characters
//------------------------------------------

let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.count) characters")
// Prints "unusualMenagerie has 40 characters"

var cafeWrd = "cafe"
print("the number of characters in \(cafeWrd) is \(cafeWrd.count)")
// Prints "the number of characters in cafe is 4"

cafeWrd += "\u{301}"    // COMBINING ACUTE ACCENT, U+0301

print("the number of characters in \(cafeWrd) is \(cafeWrd.count)")
// Prints "the number of characters in café is 4"

print("------------------------------------------")

//------------------------------------------
// Accessing and Modifying a String
//------------------------------------------
    //------------------------------------------
    // String Indices
    //------------------------------------------
    /*
    Stringไม่สามารถ index โดยใช้ค่า integer ถ้าอยากเข้าถึงตำแหน่งของ string ต้องใช้ Properties เข้าช่วย
    เพราะวิธีจัดเก็บเป็น Extended Grapheme Clusters
    .index(_:offsetBy:) โดย _ สามารถใช้ฟังก์ชัน before, after ได้ เช่
        index(after: String.Index)
        index(before: String.Index)
        String.Index สามารถใช้ startIndex, endIndex
    offsetBy

    indices
    */

let greeting = "Guten Tag!"
// print(greeting[0]) // *error*
print(greeting[greeting.startIndex]) // G
print(greeting[greeting.index(before: greeting.endIndex)]) // !
print(greeting[greeting.index(after: greeting.startIndex)]) // u
let index = greeting.index(greeting.startIndex, offsetBy: 7)
print(type(of:index)) // Index
print(greeting[index]) // a
// greeting[greeting.endIndex] // *error* เกิน range
// greeting.index(after: greeting.endIndex) // *error* เกิน range


/* error

let numberOneTwoThree = 123 // integer
    
print(numberOneTwoThree[numberOneTwoThree.startIndex]) // G
print(numberOneTwoThree[numberOneTwoThree.index(before: numberOneTwoThree.endIndex)]) // !
print(numberOneTwoThree[numberOneTwoThree.index(after: numberOneTwoThree.startIndex)]) // u

error */

let numberOneTwoThree: [Character] = ["1" , "2" , "3"]
    
print(numberOneTwoThree[numberOneTwoThree.startIndex]) // 1
print(numberOneTwoThree[numberOneTwoThree.index(before: numberOneTwoThree.endIndex)]) // 3
print(numberOneTwoThree[numberOneTwoThree.index(after: numberOneTwoThree.startIndex)]) // 2

// ข้อมูลชุดเก่า
// var godzillaName = "Godzilla🐉"

// startIndex, endIndex
var indexGodzilla = godzillaName[godzillaName.startIndex] // G
print(type(of:(indexGodzilla))) // Character
// godzillaIndex = godzillaName[godzillaName.endIndex] // *error*

var rangeOfGodzillaName = ..<godzillaName.endIndex
print(type(of:(rangeOfGodzillaName))) // PartialRangeUpTo<Index>
print(godzillaName[rangeOfGodzillaName]) // Godzilla🐉
print(indexGodzilla)

// after
indexGodzilla = godzillaName[godzillaName.index(after: godzillaName.startIndex)]
print(type(of:(indexGodzilla))) // Character
print(indexGodzilla) // o

// // before
indexGodzilla = godzillaName[godzillaName.index(before: godzillaName.endIndex)]
print(indexGodzilla) // 🐉

// offsetBy
// indexGodzilla = godzillaName[godzillaName.index(godzillaName.startIndex, offsetBy: 0)] // G
// indexGodzilla = godzillaName[godzillaName.index(godzillaName.startIndex, offsetBy: 1)] // o
indexGodzilla = godzillaName[godzillaName.index(godzillaName.startIndex, offsetBy: 2)] // d
print(indexGodzilla) // d




// Use the indices property to access all of the indices of individual characters in a string.
for index in greeting.indices { // return index ทีละตัว ตั้งแต่ตัวแรกเก็บไว้ใน index
    print("\(greeting[index]) ", terminator: "")
}
// Prints "G u t e n   T a g ! "


//------------------------------------------
// Inserting and Removing
//------------------------------------------
/*
To insert a single character into a string at a specified index,
use the insert(_:at:) method, and to insert the contents of another string at a specified index,
use the insert(contentsOf:at:) method.
*/

// Inserting : at
var welcomeMsg = "hello"
welcomeMsg.insert("!", at: welcomeMsg.endIndex)
print(welcomeMsg) // hello!

godzillaName.insert("!", at: godzillaName.endIndex) // Godzilla🐉!
godzillaName.insert("🦖", at: godzillaName.startIndex) // 🦖Godzilla🐉!
godzillaName.insert("🦖", at: godzillaName.index(before: godzillaName.endIndex)) // 🦖Godzilla🐉🦖!
print(godzillaName)

// Inserting : contentsOf


welcomeMsg.insert(contentsOf: " there", at: welcomeMsg.index(before: welcomeMsg.endIndex))
print(welcomeMsg) // hello there!

godzillaName.insert(contentsOf: "🏙️", at: godzillaName.index(before: godzillaName.endIndex))
print(godzillaName) // 🦖Godzilla🐉🦖🏙️!
godzillaName.insert(contentsOf: "-", at: godzillaName.index(godzillaName.startIndex, offsetBy: 9))
print(godzillaName) // 🦖Godzilla-🐉🦖🏙️!


var numbers = [1, 2, 3, 4, 5]
numbers.append(contentsOf: 10...15)
print(numbers) // "[1, 2, 3, 4, 5, 10, 11, 12, 13, 14, 15]"

// Remove
/*
To remove a single character from a string at a specified index,
use the remove(at:) method, and to remove a substring at a specified range,
use the removeSubrange(_:) method:
*/

// จาก welcomeMsg = "Hello there!"
welcomeMsg.remove(at: welcomeMsg.index(before: welcomeMsg.endIndex)) // hello there
print(welcomeMsg)

godzillaName.remove(at: godzillaName.index(before: godzillaName.endIndex))
print(godzillaName) // 🦖Godzilla-🐉🦖🏙️
// godzillaName.remove(at: godzillaName.index(before: godzillaName.startIndex)) // *error*
godzillaName.remove(at: godzillaName.index(godzillaName.startIndex, offsetBy: 0)) // first index[0]
print(godzillaName) // Godzilla-🐉🦖🏙️


// ลบค่าที่อยู่ในช่วงของ range ที่กำหนด
let rangeWelcomeMsg = welcomeMsg.index(welcomeMsg.endIndex, offsetBy: -6)..<welcomeMsg.endIndex
print(type(of:rangeWelcomeMsg)) // Range<Index>
print(rangeWelcomeMsg) // Index(_rawBits: 327937)..<Index(_rawBits: 720897)
welcomeMsg.removeSubrange(rangeWelcomeMsg) // hello
print(welcomeMsg)

var RangeIndexOfGodzillaName = godzillaName.index(godzillaName.endIndex, offsetBy: -1)..<godzillaName.endIndex
print(type(of:(RangeIndexOfGodzillaName))) // Index
print(RangeIndexOfGodzillaName) // Index(_rawBits: 1115905)..<Index(_rawBits: 1572865)

// before delete: Godzilla-🐉🦖🏙️
godzillaName.removeSubrange(RangeIndexOfGodzillaName)
print(godzillaName) // Godzilla-🐉🦖

var godzillaRemoveAt = godzillaName.index(before: godzillaName.endIndex)
print(type(of:(godzillaRemoveAt))) // Index
print(godzillaRemoveAt) // Index(_rawBits: 852993) / last item
// before delete: Godzilla-🐉🦖
godzillaName.remove(at: godzillaRemoveAt)
print(godzillaName) // Godzilla-🐉

print("------------------------------------------")

/*
Note
You can use the insert(_:at:), insert(contentsOf:at:), 
remove(at:), and removeSubrange(_:) methods on any type that
conforms to the RangeReplaceableCollection protocol.
This includes String, as shown here, as well as collection types such as Array,
Dictionary, and Set.
*/

//------------------------------------------
// Substrings
//------------------------------------------

let newHelloWorld = "Hello, world!"
let IndexHelloWorld = newHelloWorld.firstIndex(of: ",") ?? newHelloWorld.endIndex
// หมายความว่า จะเก็บ index ตัวแรกที่เจอ "," ถ้าไม่เจอจะ return index ตัวสุดท้าย
print(type(of:(IndexHelloWorld))) // Index
print(IndexHelloWorld) // Index(_rawBits: 327937)

// Substring
let collectIdxHelloWorld = newHelloWorld[..<IndexHelloWorld]
// เก็บ index ตั้งแต่ตัวแรกจนถึง IndexHelloWorld ในที่นี่คือตำแหน่งที่เจอ ","
print(type(of:(collectIdxHelloWorld))) // Substring
print(collectIdxHelloWorld) // Hello

// Convert the result to a String for ******long-term****** storage.
let newString = String(collectIdxHelloWorld)
print(type(of:newString)) // String
print(newString) // Hello

// ---------------------------------------------

var firstIndexInGodzila = godzillaName.firstIndex(of: "-") ?? godzillaName.endIndex
print(type(of:firstIndexInGodzila)) // Index
print(firstIndexInGodzila) // Index(_rawBits: 524545)

var substringGodzilla = godzillaName[..<firstIndexInGodzila] // String now convert to >> Substring
print(type(of:(substringGodzilla))) // Substring
print(substringGodzilla) // Godzilla

// เก็บ substring ไปไว้ที่ String
var myNewGodzilla = String(substringGodzilla)
print(type(of:myNewGodzilla)) // String
print(myNewGodzilla) // Godzilla


// ---------------------------------------------

var lukeSkyWalker = "Luke Skywalker🧙‍♂️" // String
print(lukeSkyWalker) // Luke Skywalker🧙‍
var indexLuke = lukeSkyWalker.index(lukeSkyWalker.endIndex, offsetBy: -11) // Index
var substringLuke = lukeSkyWalker[..<indexLuke] // Substring
var luke = String(substringLuke) // Substring >> String
print(luke)

print("------------------------------------------")


//------------------------------------------
// Comparing Strings
//------------------------------------------
    // String and Character Equality
    // ใช้วิธีการเช็คแบบ canonically equivalent คือความหมายเหมือนกันและหน้าตาเหมือนกัน(same meaning and appearance)
    // โดยไม่ต้องสนใจว่าจะประกอบขึ้นมาจาก unicode scalars แบบไหน

let password = "123456"
let passwordConfirmation = "123456"

print((password == passwordConfirmation) ? "Verify" : "Please Re-Enter")
// Verify

// "Voulez-vous un café?" using LATIN SMALL LETTER E WITH ACUTE
let eAcuteQuestion = "Voulez-vous un caf\u{E9}?" 
print(eAcuteQuestion) // Voulez-vous un café?

// "Voulez-vous un café?" using LATIN SMALL LETTER E and COMBINING ACUTE ACCENT
let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"
print(combinedEAcuteQuestion) // Voulez-vous un café?

if eAcuteQuestion == combinedEAcuteQuestion {
    print("These two strings are considered equal")
}
// Prints "These two strings are considered equal"


let latinCapitalLetterA: Character = "\u{41}"
print(latinCapitalLetterA)

let cyrillicCapitalLetterA: Character = "\u{0410}"
print(cyrillicCapitalLetterA)

if latinCapitalLetterA != cyrillicCapitalLetterA {
    print("These two characters aren't equivalent.")
}
// Prints "These two characters aren't equivalent."

let maiTaikhu = "\u{0E47}"
let thaiDigitEight = "\u{0E58}"
let SaraE = "\u{0E40}"
let SaraAe = "\u{0E41}"
let doubleSaraE = SaraE + SaraE

print(maiTaikhu) // ็
print(thaiDigitEight) // ๘
print(SaraE) // เ
print(doubleSaraE) // เเ
print(SaraAe) // แ

// compare "เ" + "เ" with "แ"
print((doubleSaraE == SaraAe) ? "equal" : "not equal") // not equal

print("------------------------------------------")


//------------------------------------------
// Prefix and Suffix Equality
//------------------------------------------

let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

var act1SceneCount = 0
for scene in romeoAndJuliet { // ดึง string ทีละตัวออกมา
    if scene.hasPrefix("Act 1 ") {
    // นำมาเช็คว่า Prefix เป็น "Act 1 " หรือไม่
    // เวลาเช็คจะเช็คแบบ canonically equivalent
        act1SceneCount += 1
    }
}
print("There are \(act1SceneCount) scenes in Act 1")
// Prints "There are 5 scenes in Act 1"

var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount += 1
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        cellCount += 1
    }
}

print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")
// Prints "6 mansion scenes; 2 cell scenes"

var arrayNumber = [String] ()
print(type(of:(arrayNumber))) // Array<Sting>
print(arrayNumber) // []
for i in 1...10{
    arrayNumber.append(String(i))
}
print(arrayNumber) // ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]

for i in arrayNumber{
    if i.hasPrefix("1"){
      print("\(i) " , terminator:"")
    }
}
/*
1 10
*/
print("\n")

let YourName = [
            "That rise from earth to touch Your heart and glorify your name",
            " Your name is a strong and mighty tower",
            "Your name is a shelter like no other",
            "Your name, let the nations sing it louder",
            "'Cause nothing has the power to save",
            "But your name",
            "Jesus, in your name we pray",
            "Come and fill our hearts today",
            "Lord, give us strength to live for you and glorify your name"
            ]


var bigYourNameCount = 0
var smallYourNameCount = 0

for word in YourName {
    if word.hasSuffix("Your name") {
        bigYourNameCount += 1
    } else if word.hasSuffix("your name") {
        smallYourNameCount += 1
    }
}
print("\(bigYourNameCount) bigYourNameCount; \(smallYourNameCount) smallYourNameCount")
// 0 bigYourNameCount; 3 smallYourNameCount


let joinTheDarkSideQuotes: [String] = [
                                        "Luke Skywalker: I will not fight you.",
                                        "Darth Vader: Give yourself to the Dark Side"
                                    ]

for quote in joinTheDarkSideQuotes{
    if quote.hasSuffix("Dark Side"){
        print("Luke Skywalker: No, I'll never turn to the dark side.")
    }
}
// Luke Skywalker: No, I'll never turn to the dark side.



print("------------------------------------------")

//------------------------------------------
// Unicode Representations of Strings
//------------------------------------------
/*

    A collection of UTF-8 code units (accessed with the string’s utf8 property)
    A collection of UTF-16 code units (accessed with the string’s utf16 property)
    A collection of 21-bit Unicode scalar values, equivalent to the string’s UTF-32 encoding form (accessed with the string’s unicodeScalars property)

Each example below shows a different representation of the following string,
which is made up of the characters D, o, g, ‼ (DOUBLE EXCLAMATION MARK,
or Unicode scalar U+203C), and the 🐶 character (DOG FACE, or Unicode scalar U+1F436):
*/

let dogString = "Dog‼🐶"
let flowers = "Flowers 💐"
    //------------------------------------------
    // UTF-8 Representation
    //------------------------------------------
for codeUnit in dogString.utf8 {
    print("\(codeUnit) ", terminator: "")
}
// Prints "68 111 103 226 128 188 240 159 144 182 "
print("\n")

for item in flowers.utf8 {
print("\(item) ", terminator:"")
}
// 70 108 111 119 101 114 115 32 240 159 146 144 
print("\n")

    //------------------------------------------
    // UTF-16 Representation
    //------------------------------------------
for codeUnit in dogString.utf16 {
    print("\(codeUnit) ", terminator: "")
}
// Prints "68 111 103 8252 55357 56374 "
print("\n")


for item in flowers.utf16 {
print("\(item) ", terminator:"")
}
// 70 108 111 119 101 114 115 32 55357 56464 
print("\n")
    
for item in flowerEmoji.utf16 {
    print(item)
}
// 55357
// 56464

    //------------------------------------------
    // Unicode Scalar Representation
    //------------------------------------------    
for scalar in dogString.unicodeScalars {
    print("\(scalar.value) ", terminator: "")
}
// Prints "68 111 103 8252 128054 "
print("\n")

let flowerEmoji = "💐"
for item in flowerEmoji.unicodeScalars {
    print(item, item.value)
}
// 💐 128144

for scalar in dogString.unicodeScalars {
    print("\(scalar) ")
}
// D
// o
// g
// ‼
// 🐶

print("------------------------------------------")

