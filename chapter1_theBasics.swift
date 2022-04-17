//------------------------------------------
// Constants and Variables
//------------------------------------------
//------------------------------------------
    // Declaring Constants and Variables
//------------------------------------------

// let คือการกำหนดตัวแปรโดยจะ "ไม่สามารถ" เปลี่ยนแปลงค่าได้ในอนาคต
// var คือการกำหนดตัวแปรโดยจะ "สามารถ" เปลี่ยนแปลงค่าได้ในอนาคต
let maxNumber = UInt8.max
var changaebleVar = "i can transform"

/* << error >>
ถ้ามีการกำหนดค่าใหม่ให้กับ maxNumber จะไม่สามารถเปลี่ยนแปลงค่า maxNumber ได้
maxNumber = 12 // error
<< error >> */ 

changaebleVar = "let's do it then"
// ค่าของตัวแปร changeableVar ถูกเปลี่ยนเป็น let's do it then

print(maxNumber) // ans: 255
print(changaebleVar) // ans: let's do it then

var x = 1.0, y = 2.0, z = 3.0
print(x+y*z) // ans: 7.0

let a = 123
let b = 5
print(a, b, separator:" 1")

// var changeA = "string", changeB = 123, changeC = "string" , 123
//  print(changeB)

let zeroValue: Int = 0
let nilOptional: Int? = nil
let zeroOptional: Int? = 0

// zeroValue == 0      // true
// zeroValue == nil    // false
// nilOptional == 0    // false
// nilOptional == nil  // true
// zeroOptional == 0   // true
// zeroOptional == nil // false

var ten = 10
var twenty = 20
var tenAndTwrntyResult: Bool?

tenAndTwrntyResult = ten < twenty
print(tenAndTwrntyResult) // ans: Optional(true)
print(tenAndTwrntyResult == true) // ans: true

// var myFirstOPtuple :(Int!,Int!) // *error*
var mySecondOPtuple :(Int,Int)! // *pass*
var myThirdOPtuple :(Int?,Int?) // *pass*
// var myFirstOParray :[Int!] // *error*
var mySecondOParray :[Int]? // *pass*
var myThirdOParray :[Int?] // *pass*

/*

let possibleString: String? = "optional string" // Optional("optional string")
let forcedString: String = possibleString! // optional string
let assumedString: String! = "implicitly unwrapped optional string" // some("implicitly unwrapped optional string")
let implicitString: String = assumedString // implicitly unwrapped optional string


var optionalTupleDeclareValue: (String, Int)? = ("Declare", 50) // Optional(("Declare", 50))

var optionalTupleDeclareValue2 = (String, Int)?.some(("Hello", 10)) // Optional(("Declare", 50))

let Mackie: (String, Int, Int?) = ("Mackie", 50, .none) // ใช้ .none แทน nil
var optionalTuple: (String, Int)? // Optional<(String, Int)>



var labelNil : String?
print(labelNil) // nil
// labelNil = "Unwrapped label"
print(labelNil) // Optional("Unwrapped label")

var labelNil2: String!
print(labelNil2) // nil
labelNil2 = "Unwrapped label 2"
print(labelNil2) // some("Unwrapped label 2")
*/

//------------------------------------------
// Type Annotations
//------------------------------------------
var myStringType: String
print(type(of:myStringType)) // ans: String

/*<< error >>
ถ้าประกาาศ

var myStringType, myIntType: String, Int
จะไม่สามารถทำได้ เพราะรูปแบบการประกาศไม่ถูกต้อง
<< error >> */ 


//-----------------------------------------
// Naming Constants and Variables
//-----------------------------------------


/* << error >>

let constA:Int = 3.14159

ค่าที่กำหนดเป็น Float แต่ใส่ในตัวแปรที่เป็น Int
<< error >> */ 

var 日本 = "こんにちは " // ans: こんにちは

let constA = "Godzilla"
let constB = 10_0.00
print("Value of \(constA) is more than \(constB) millions")
// ans: Value of Godzilla is more than 100.0 millions


//-----------------------------------------
// Printing Constants and Variables
//-----------------------------------------

/*
parameter ของ print จะมี 3 ตัว
print(_:separator:terminator:)
separator เมื่อมีการสั่งพิมพ์ตัวแปรหลายๆ ค่าแต่ละจะถูกแยกด้วยอะไร
มีค่า default คือ ""
ตัวอย่าง
print(_:separator:"...") มีการกำหนดค่าให้กับ separator ว่าจะต้องใช้ "..." เพื่อแยกตัวแปรเมื่อมีหลายตัว

terminator เป็นการการขึ้นบรรทัดใหม่
มีค่า default หรือ /n
ตัวอย่าง
print(_:separator:terminator:"") มีการกำหนดว่าไม่ให้ขึ้นบรรทัดใหม่ จะพิมพ์ต่อไปเรื่อยๆ
*/

print(1.0, 2.0, 3.0, 4.0, 5.0, separator: " ... ")
// ans: "1.0 ... 2.0 ... 3.0 ... 4.0 ... 5.0"

for n in 1...5 {print(n, terminator: "a")}
// ans: "1a2a3a4a5a"

var separated = ""
print(1.0, 2.0, 3.0, 4.0, 5.0, separator: " ... ", to: &separated)
// separated == "1.0 ... 2.0 ... 3.0 ... 4.0 ... 5.0\n"

// string inperpolation
// let myPetName = "Godzilla"
// print("My pet name is \(myPetName)")
// ans: My pet name is Godzilla


//-----------------------------------------
// Comments
//-----------------------------------------
// This is a comment.

/* This is the start of the first multiline comment.
    /* This is the second, nested multiline comment. */
        // comment in nested
This is the end of the first multiline comment. */


//-----------------------------------------
// Semicolons
//-----------------------------------------
// Swift doesn’t require you to write a semicolon (;) 
// แต่ถ้าเขียนหลายคำสั่งในบรรทัดเดียวต้องใช้
// let 你好 = "你好世界"; print(你好)


//-----------------------------------------
// Integers
//-----------------------------------------
/*
let minValue = UInt8.min  // minValue is equal to 0, and is of type UInt8
let maxValue = UInt8.max  // maxValue is equal to 255, and is of type UInt8

    On a 32-bit platform, Int is the same size as Int32.
    On a 64-bit platform, Int is the same size as Int64.

UInt - Use UInt only when you specifically need an unsigned integer type
    On a 32-bit platform, UInt is the same size as UInt32.
    On a 64-bit platform, UInt is the same size as UInt64.
*/

var myIntVarA = 42 // ans: 42


//-----------------------------------------
// Floating-Point Numbers
//-----------------------------------------
var myDoubleVar = 3 + 0.14159 // ans: 3.14159


//-----------------------------------------
// Type Safety and Type Inference
//-----------------------------------------
var myDoubleVar2 = 3 + 0.14159 // ต้องเปลี่ยนชื่อตัวแปร เพราะตัวแปรประกาศซ้ำกับด้านบน
print(type(of:myDoubleVar2)) // type==double

//-----------------------------------------
// Numeric Literals
//-----------------------------------------
/*
Integer literals can be written as:

    A decimal number, with no prefix
    A binary number, with a 0b prefix
    An octal number, with a 0o prefix
    A hexadecimal number, with a 0x prefix

All of these integer literals have a decimal value of 17:

    let decimalInteger = 17
    let binaryInteger = 0b10001       // 17 in binary notation
    let octalInteger = 0o21           // 17 in octal notation
    let hexadecimalInteger = 0x11     // 17 in hexadecimal notation

    For decimal numbers with an exponent of exp, the base number is multiplied by 10exp:
    1.25e2 means 1.25 x 102, or 125.0.
    1.25e-2 means 1.25 x 10-2, or 0.0125.

    For hexadecimal numbers with an exponent of exp, the base number is multiplied by 2exp:
    0xFp2 means 15 x 22, or 60.0.
    0xFp-2 means 15 x 2-2, or 3.75.

    All of these floating-point literals have a decimal value of 12.1875:
    let decimalDouble = 12.1875
    let exponentDouble = 1.21875e1
    let hexadecimalDouble = 0xC.3p0

    print(decimalDouble+exponentDouble)
    print(12.1875+1.21875e1)
    ทั้งสองแบบได้คำตอบเดียวกันคือ 24.375
*/

import Foundation
print("exp(-2.0) = \(exp(-2.0))")
print("exp(-1.0) = \(exp(-1.0))")
print("exp(0.0) = \(exp(0.0))")
print("exp(1.0) = \(exp(1.0))")
print("exp(2.0) = \(exp(2.0))")
/* ans:
exp(-2.0) = 0.135335283236613
exp(-1.0) = 0.367879441171442
exp(0.0) = 1.0
exp(1.0) = 2.71828182845905
exp(2.0) = 7.38905609893065
*/

let decimalNumber = 10    
  
let binaryNumber = 0b1010   
  
let octalNumber = 0o12 
let hexadecimalNumber = 0xA   
  
print("Decimal Number:", decimalNumber) // Decimal Number: 10
print("Binary Number:", binaryNumber) // Binary Number: 10
print("Octal Number:", octalNumber) // Octal Number: 10
print("Hexadecimal Number:", hexadecimalNumber) // Hexadecimal Number: 10

// ตัวเลขสามารถแยกฟอร์แมทเพื่อให้อ่านง่ายขึ้นดังเช่น
let paddedDouble = 000123.456 // ans: 123.456
let oneMillion = 1_000_000 // ans: 1000000
let justOverOneMillion = 1_000_000.000_000_1 // ans: 1000000.0000001
// let letErrorDouble = 1_05.01.5.1_.1 // *error*

//-----------------------------------------
// Numeric Type Conversion
//-----------------------------------------

//-----------------------------------------
    // Integer Conversion
//-----------------------------------------

// let cannotBeNegative: UInt8 = -1
 /* << error >>
 overflow UInt8 มีค่าในช่วง [0, 255] เพราะเป็น unsigned
<< error >> */ 

// let tooBig: Int8 = Int8.max + 1
/* << error >>
 overflow Int มีค่าในช่วง [-128, 127]
<< error >> */ 

let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one) // ans: 2001

let convertNumber = "123"
let convertedNumber = Int(convertNumber)

//-----------------------------------------
    // Integer and Floating-Point Conversion
//-----------------------------------------

let three = 3_ // ถ้าเขียน _3_ จะ error
let pointOneFourOneFiveNine = 0.1_4159
let pi = Double(three) + pointOneFourOneFiveNine
// ต้อง cast three(int) มาเป็น double ก่อน assign ค่า

let integerPi = Int(pi) // cast double เป็น int ด้วยการทำ round-off
//ans: 3 


//-----------------------------------------
//Type Aliases (ตั้งชื่อเล่น)
//-----------------------------------------
typealias MyUInt16 = UInt16
var maxOfMyAlias = MyUInt16.max
print(maxOfMyAlias) // ans: 65535

maxOfMyAlias = MyUInt16.min // เปลี่ยนค่าของ maxOfMyAlias เป็นค่าต่ำสุดของ UInt16
print(maxOfMyAlias) // ans: 0

//-----------------------------------------
// Booleans
//-----------------------------------------
let (numberOne, numberTwo) = (1, 2)
let compareNumberOneAndTwo = numberOne < numberTwo
print(compareNumberOneAndTwo) // ans: true

/*<< error >>
    var i = 5
    while i {
        print(i)
        i -= 1
    }
ใช้ int แทน boolearn ไม่ได้

    let i = 1
    if i {
        do something
    }
error เหมือนข้อด้านบน

ถ้าอยากจะใช้ int เพื่อเช็คเงื่อนไข if
ต้องใช้ i == (int)
  let i = 3
    if i == 1 {
        print("true")
    }else{
        print("false")
    }
// ans: false
<< error >> */ 

//-----------------------------------------
// Tuples
//-----------------------------------------
var product = ("MacBook", 1099.99, "Made in:", "Japan")
// access tuple elements
print("Name:", product.0)
print("Price:", product.1)
print(product.2, product.3)
/*
ans:
Name: MacBook
Price: 1099.99
Made in: Japan
*/

var product2 = (name: "MacBook", price: 1099.99, MadeIn: "Japan")
// (name: String, price: Double, MadeIn: String)
print("Product 2")
print(product2.name)
print(product2.price)
print(product2.MadeIn)
print(product2)
/*
ans:
Product 2
MacBook
1099.99
Japan
*/

var tupleNoValue: (String, Int)
// print(type(of:tupleNoValue)) // ans: (String, Int)
// print(tupleNoValue.0) // *error* ยังไม่ได้กำหนดค่า
tupleNoValue.0 = "Assign"
// print(tupleNoValue.0) // ans: Assign

// var violin = (name: "Maliso", desc:(color: "red", price: 100.0))
var violin: (name: String, desc: (color: String, price:Double))
            = ("Maliso", ("red", 100))
print(type(of:violin)) // (name: String, desc: (color: String, price: Int))
print(violin) // (name: "Maliso", desc: (color: "red", price: 100))

print(violin.desc.color) // red
print(violin.1.0) // red

/*
*ข้อมูลเก่า*
var optionalTupleDeclareValue: (String, Int)? = ("Declare", 50) // Optional(("Declare", 50))

var optionalTupleDeclareValue2 = (String, Int)?.some(("Hello", 10)) // Optional(("Declare", 50))

let Mackie: (String, Int, Int?) = ("Mackie", 50, .none) // ใช้ .none แทน nil
var optionalTuple: (String, Int)? // Optional<(String, Int)>
*/


var EmptyTuple = ()
print(EmptyTuple) // ans: ()

var TupleOneVariableHaveManyValue = ("Square", "Red", (1.0, 2.0, 1.5))
print(TupleOneVariableHaveManyValue) // ans: ("Square", "Red", (1.0, 2.0, 1.5))

let anotherItem:(shape: String, color: String, coordinate: (Double, Double, Double)) = 
    ("Square", "Red", (1.0, 2.0, 1.5))
print(anotherItem) // ans: (shape: "Square", color: "Red", coordinate: (1.0, 2.0, 1.5))


/*You can decompose a tuple’s contents into separate constants or variables, which you then access as usual:
    let http404Error = (404, "Not Found")
    let (statusCode, statusMessage) = http404Error
    print("The status code is \(statusCode)")
    // Prints "The status code is 404"
    print("The status message is \(statusMessage)")
    // Prints "The status message is Not Found"
    
    หรือถ้าต้องการใช้เพียงตัวเดียว อีกตัวไม่จำเป็นต้องรับมาก็ใช้ underscore(_) เพื่อละเว้นไว้
    let (justTheStatusCode, _) = http404Error
    print("The status code is \(justTheStatusCode)")
    // Prints "The status code is 404"
*/

var samsung = (name: "Samsung", description: "อุปกรณ์อิเล็กทรอนิกส์")
print(samsung.name) // ans: Samsung


//-----------------------------------------
// Optionals
//-----------------------------------------
//    Optionals คือชนิดตัวแปรเอาไว้เก็บตัวแปรที่มีค่าและไม่มีค่า (nil)


print("\nOptionals\n")
let possibleOptional = "123"
let convertedOptional = Int(possibleOptional)
// convertedOptional is inferred to be of type "Int?", or "optional Int"
print(possibleOptional) // ans: 123
print(convertedOptional!) // ans: 123

/* 
โดยปกติสามารถทำได้
var name: String = "Tawanrung"
แต่ไม่สามารถทำได้เมื่อจะกำหนดค่า nil
var optionalNameString = nil
var optionalNameInt: String = nil
ถ้าต้องการใส่ nil ต้องใส่ ? หลัง dataType
*/

var innitialValueOptional: Int?
print(type(of:(innitialValueOptional))) // ans: Optional<Int>

innitialValueOptional = 10
print(innitialValueOptional) // ans: Optional(10)
innitialValueOptional! += innitialValueOptional!
print(innitialValueOptional) // ans: Optional(20)

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



// ตัวอย่างการกำหนดค่า nil
var optionalNameString: String? // ค่า nil จะโดนห่อด้วย Optional โดยมี Type เป็น String

// print(optionalNameString) // *error* เพราะตัวแปร optionalNameString ยังไม่มีค่า ไม่สามารถใช้คำสั่ง print เพื่อดึงค่ามาแสดงผลได้
// print(optionalNameString!) // *error* หลังใช้คำสั่ง ! เพื่อ froceUnwrap ตัวแปร optionalNameString ที่ยังไม่ถูกกำหนด value จะแสดงค่า dump ออกมา

var optionalNameInt: Int? = nil
// print(optionalNameInt) // *error* ถึงจะกำหนดตัวแปรให้กับ optinalNameInt แต่ค่าที่กำหนดเป็นค่า nil จึง error
// print(optionalNameInt!) // *error* หลังใช้คำสั่ง ! เพื่อ forceUnwrap แต่เนื่องจากตัวแปร optionalNameInt มีค่าเป็น nil จึงได้ผลลัพธ์ dump ออกมา

// var forceUnwrapOptionalNameInt = optionalNameInt! // *error*
// ถึงแม้จะมีการ forceUnwrap เก็บไว้ในอีกตัวแปรนึง แต่เนื่องจากตัวแปร optionalNameInt ยังมีค่าเป็น nil จึงไม่สามารถถูก assign ค่าให้ได้

var optionalNameStringHaveValue: String? = "OptionalStringNameValue" // Type เป็น String ที่โดน Optional ห่ออยู่และมีการกำหนดค่า
// ans: OptionalStringNameValue

// print(optionalNameStringHaveValue) // *error* ตัวแปร optionalNameStringHaveValue มีชนิดเป็น optional ไม่สามารถนำค่ามาแสดงผลโดยตรงได้
// print(optionalNameStringHaveValue!) // *error* ตัวแปร optionalNameStringHaveValue มีชนิดเป็น optional ไม่สามารถนำค่ามาแสดงผลโดยตรงได้

// ตัวแปร a
var VariableAassignForceUnwrapInt: Int!
print(VariableAassignForceUnwrapInt) // ans: none

// ตัวแปร b
var VariableAassignOptionalInt: Int? // ตัวแปรชนิด optional มีค่าเป็น nil

// c = a + b
// var VariableSumBetweenForceUnwrapIntAndOptionalInt = VariableAassignForceUnwrapInt + VariableAassignOptionalInt // *error* จะไม่ complie เนื่องจาก Datatype คนละตัว

// c = a + b!
// var VariableSumBetweenForceUnwrapIntAndOptionalInt = VariableAassignForceUnwrapInt + VariableAassignOptionalInt! // *error* จะ compile แต่ error ตอน runtume เนื่องจาก Datatype คนละตัว

// c = a + a
// var VariableSumBetweenForceUnwrapIntAndOptionalInt = VariableAassignForceUnwrapInt + VariableAassignForceUnwrapInt // *error* จะ complie แต่ error ตอน runtime เนื่องจากตัวแปรไม่ได้ถูกกำหนดค่า

// กำหนดค่าให้ VariableAassignForceUnwrapInt | a! = 1
VariableAassignForceUnwrapInt = 1
print(VariableAassignForceUnwrapInt) // ans: some(1)

// กำหนดค่าให้ VariableAassignOptionalInt | b? = 2
VariableAassignOptionalInt = 2
// print(VariableAassignOptionalInt) // ans: Optional(2)
// print(VariableAassignOptionalInt!) // ans: 2

// c = a + b
// var VariableSumBetweenForceUnwrapIntAndOptionalInt = VariableAassignForceUnwrapInt + VariableAassignOptionalInt // *error* จะไม่ complie เนื่องจาก Datatype คนละตัว

// c = a + b!
// var VariableSumBetweenForceUnwrapIntAndOptionalInt = VariableAassignForceUnwrapInt + VariableAassignOptionalInt!
// print(VariableSumBetweenForceUnwrapIntAndOptionalInt) // ans: 3

// c = a + a
// var VariableSumBetweenForceUnwrapIntAndOptionalInt = VariableAassignForceUnwrapInt + VariableAassignForceUnwrapInt
// print(VariableSumBetweenForceUnwrapIntAndOptionalInt) // ans: 2


/*
เมื่อถูกห่อด้วย optional จะไม่สามารถนำตัวแปรมาใช้งานได้ทันที
ตัวอย่าง
var optionalNameString: String?
print(optionalNameString) // error 
*/

//-----------------------------------------
// If Statements and Forced Unwrapping
//-----------------------------------------

/*
ตัวแปรชุดเดิม
var optionalNameString: String?
var optionalNameInt: Int? = nil
var optionalNameStringHaveValue: String? = "OptionalStringNameValue"
*/

if optionalNameString != nil{
    print("not nill")
}else{
    print("optionalNameString is nil")
}
// จะแสดงผล optionalNameString is nil

if optionalNameInt == nil{
    print("this variable is nil value")
}else{
    print("this variable is not nill")
}
// จะแสดงผล this variable is nil value

// ใช้คำสั่ง if กับ forceUnwrap เช็คเงื่อนไข 
// ตรงจุดนี้เมื่อมีการใช้คำสั่ง ! เพื่อ forceUnwrap ตัว optional-value ซึ่งมีการ return ค่าออกมา
// จะกลายเป็นการเปรียบเทียบกันระหว่าง non-optinal กับ nil ซึ่งจะ return เป็น true เสมอ**
if optionalNameStringHaveValue! != nil{
    print("beware for forceUnwrap(optional-value) compare with nil will always return true")
    // print(optionalNameStringHaveValue!)
}else{
    print("optionalNameStringHaveValue is nil")
}
// จะแสดงผล beware for forceUnwrap(optional-value) compare with nil will always return true

// var forceUnwrapOptionalNameString = optionalNameString! // error


//-----------------------------------------
// Implicitly Unwrapped Optionals
//-----------------------------------------
    // Force Unwrap
    // ใช้เครื่องหมาย อัศเจรีย์ (!)
/*
ตัวอย่างของ Force Unwrap
    var forceUnwrapName = optionalNameString! // no value
ถ้า force unwrap ดัวแปรที่เป็น optional ที่ที่เป็นค่า nil จะเกิด error
การ force unwrap ด้วยวิธีการนี้ต้องมั่นใจว่าตัวแปรจะไม่เป็นค่า nil

*ข้อมูลชุดเดิม*
// var myFirstOPtuple :(Int!,Int!) // *error*
var mySecondOPtuple :(Int,Int)! // *pass*
var myThirdOPtuple :(Int?,Int?) // *pass*
// var myFirstOParray :[Int!] // *error*
var mySecondOParray :[Int]? // *pass*
var myThirdOParray :[Int?] // *pass*

*/

let stringNumberFive = "5"

// เปลี่ยนจาก optional type to a non-optional type
let convertedStringNumberFive = Int(stringNumberFive) // Optional(5)
// จะกลายเป็น Optional Int เพราะว่าค่าของ stringNumberFive อาจจะถูกเปลี่ยนเป็นค่าอื่นก่อนนำมา assign

// let convertedStringNumberFive = Int(stringNumberFive)! // 5
// ใช้ forceUnwrap เพื่อดึงค่าของ Opitonal Int ออกมา

let forceUnwrapOptionalIntValueEqualNil: Int! = nil

print(forceUnwrapOptionalIntValueEqualNil)
// ans: none

// 
var myString : String!
myString = nil 
if myString != nil {
    myString = "assign some value to myString"
}

var countMyString = myString?.count
print(countMyString) // ans: nil

myString = "Hello"
if myString != nil {
    myString = "assign some value to myString"
}

countMyString = myString?.count
print(countMyString) // ans: Optional(29)


let possibleString: String? = "optional string" // Optional("optional string")
let forcedString: String = possibleString! // optional string
let assumedString: String! = "implicitly unwrapped optional string" // some("implicitly unwrapped optional string")
let implicitString: String = assumedString // implicitly unwrapped optional string

if assumedString != nil {
    print(assumedString)
} 
// some("implicitly unwrapped optional string")

if let definiteString = assumedString { 
    print(definiteString) 
} 
// implicitly unwrapped optional string

if assumedString != nil {
    print(assumedString)
} 
// some("implicitly unwrapped optional string")

if let definiteString = assumedString { 
    print(definiteString) 
} 
// implicitly unwrapped optional string

var labelNil : String?
print(labelNil) // nil
// labelNil = "Unwrapped label"
print(labelNil) // Optional("Unwrapped label")

var labelNil2: String!
// หรือ var labelNil2: String! = nil
print(labelNil2) // nil
labelNil2 = "Unwrapped label 2"
print(labelNil2) // some("Unwrapped label 2")



/*
ดังนั้นเพื่อให้เกิดความั่นใจว่าตัวแปร Optional จะมีค่า(value) จึงต้องใช้ Optional Binding เข้าช่วย

//-----------------------------------------
//Optional Binding คือการตรวจ Optional ว่ามีค่าหรือไม่
//-----------------------------------------

ตัวอย่าง เรามีตัวแปร Optional อยู่ตัวนึง
    var optionalStr: String? = "Hello"
    เมื่อเรานำมาแสดงผลด้วยคำสั่ง force unwrap ก็จะไม่มีปัญหา
    print(optionaStr!) // ans: Hello

    แต่ถ้าเรา force unwrap ตัวแปร optional ที่ไม่มีค่าอยู่ โปรแกรมจะ error
    var optionalStr: String?
    print(optionaStr!) // *error*

วิธีตรวจสอบว่า Optional มีค่า(Value)หรือไม่

ใช้ if เพื่อตรวจสอบตัวแปร Optional

    var optionalName: String?
        if optionalName != nil {
            print(optionalName!)
        }else{
            print("false")
        }
    ans: false
    เพราะตัวแปร optiona มีค่าเป็น nil

หรือจะใช้ if let เข้ามาช่วยเช็คเงื่อนไข

    var optionalName: String?
        if let unwrapName = optionalName {
            print(unwrapName)
        }else{
            print("false")
        }
    ans: false
    เพราะตัวแปร optiona มีค่าเป็น nil
*/


// ใช้ if เช็คข้อมูลใน optional

typealias myOptionalInt = Int?
var someOptionalIntNoValue:myOptionalInt
var someOptionalIntValue:Int! = 0
        
if someOptionalIntNoValue != nil {
	print("someOptionalIntNoValue = \(someOptionalIntNoValue!)")
} else {
	print("doesn't contain value")
}
        
if someOptionalIntValue != nil {
	print("someOptionalIntValue = \(someOptionalIntValue!)")
} else {
	print("doesn't contain value")
}


// ใช้ if-let เช็คข้อมูลใน optional
var someOptionalStringNoValue:String?
var someOptionalStringValue:String! = "Optiona-Value-String"
       
if let _ = someOptionalStringNoValue {
	print("do something")
} else {
	print("doesn't contain value")
}
        
if let temp = someOptionalStringValue {
	print("someOptionalStringValue = \(temp)")
} else {
	print("doesn't contain value")      
}

/*
ในการใช้คำสั่ง if สามารถเช็คเงื่อนไขได้หลายตัวแปรโดยการใส่ commas(,)
ถ้ามีตัวแปรเป็น optional ที่เป็น nil หรือ bool ที่เป็น false
คำสั่ง if จะคืนค่าเป็น false ทันที(Short Circuit)
*/
if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}
// ans: "4 < 42 < 100"

var optionalNumber: Int?
if let firstNumber = Int("4") {
    if let secondNumber = optionalNumber { //no-value optional
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }else{print("2nd if")}
    }else{print("1st if")}
}else{print("else")}
// ans: 1st if

// var optionalTuple: (String, Int)?
// print(type(of:optionalTuple)) // ans : Optional<(String, Int)>


var optionalTupleStringInt: (String?, Int?)
// print(optionalTupleStringInt) // ans: (nil, nill)
// print(optionalTupleStringInt.0, optionalTupleStringInt.1) // ans: nil nil
optionalTupleStringInt.0 = "Hello"
print(optionalTupleStringInt.0, optionalTupleStringInt.1) // ans: Optional("Hello") nil


var optionalTuple: (String, Int)?
// var optionalTuple = (String, Int)? = nil
print(type(of:optionalTuple)) // ans: Optional<(String, Int)>
// optionalTuple.0 = "Assign" // *error*
optionalTuple = ("Value-String in optionalTuple", 10)
print(optionalTuple) // ans: Optional(("Value-String in optionalTuple", 10))


var optionalTupleDeclareValue: (String, Int)? = ("Declare", 50)
print(optionalTupleDeclareValue) // ans: Optional(("Declare", 50))

var optionalTupleDeclareValue2 = (String, Int)?.some(("Hello", 10))
print(optionalTupleDeclareValue2) // ans: Optional(("Declare", 50))

let Mackie: (String, Int, Int?) = ("Mackie", 50, .none) // ใช้ .none แทน nil
print(Mackie) // ans: ("Mackie", 50, nil)
print(Mackie.2) // ans: nil


if let _ = optionalTuple, let _ = optionalTupleDeclareValue,
    let _ = optionalTupleDeclareValue2, let _ = Mackie.2{
    print("inside optional bindling")
}else{
    print("some variable is optinal or bool: false")
}
// ans: some variable is optinal or bool: false


//-----------------------------------------
// Assertions and Preconditions
//-----------------------------------------

//-----------------------------------------
    // Assertions
    // จะตรวจสอบช่วยเวลา Runtime ว่าสิ่งที่ทำอยู่ถูกต้องหรือไม่
    // ถ้าเงื่อนไขเป็น "จริง" โปรแกรมจะทำงานต่อ
    // ถ้าเงื่อนไขเป็น "เท็จ" โปรแกรมจะหยุดการทำงาน
    // ถูกใช้ในการ debug
    // ใช้ในช่วงเวลา Development
//-----------------------------------------

/*
ตัวอย่าง
    let age = -3
    
    assert(age >= 0, "A person's age can't be less than zero.")
    print("after assert")

    // This assertion fails because -3 isn't >= 0.
    // ans: Assertion failed: A person's age can't be less than zero.
    โปรแกรมจะหยุดทำงาน โดยไม่มีการทำคำสั่ง print("after assert")
    
    หรือเขียนสั้นๆ ด้วย
    assert(age >= 0)
    
    assert(1 == 1, "Maths failure!") // โปรแกรมจะไม่จบทำงาน
    assert(1 == 2, "Maths failure!") // โปรแกรมจะหยุดการทำงานและแสดงข้อความ Maths failure!
*/

let age = 3

assert(age >= 0, "A person's age can't be less than zero.")

/*
ถ้าตัวโปรแกรมมีการเช็คเงื่อนไขอยู่แล้วก็สามารถใช้ assertionFailure แทนได้
ตัวอย่าง
    let age = -3
    
    if age > 10 {
        print("You can ride the roller-coaster or the ferris wheel.")
    } else if age >= 0 {
        print("You can ride the ferris wheel.")
    } else {
        assertionFailure("A person's age can't be less than zero.")
    }

    ใช้ร่วมกับการเช็ค nil optional        
    จากข้อมูลเดิม
    // var someOptionalStringNoValue:String?
    // var someOptionalStringValue:String! = "Optiona-Value-String"
        
    if let _ = someOptionalStringNoValue {
        print("print value in optional")
    } else {
        assertionFailure()
    }
    // คำสั่ง assertionFailure() จะทำงานและโปรแกมจะหยุดทำงาน

    
*/

//-----------------------------------------
    // Preconditions
    // เหมือน Assertions
    // คือสิ่งที่ต้องเป็นจริงก่อนจะเรียกใช้ method
    // ใช้ในช่วงเวลา Production
//-----------------------------------------

let myPrecondition: String? = "myText"
// let myPrecondition: String? 

// Continue only if myPrecondition != nil
precondition(myPrecondition != nil, "myPrecondition variable is nil")
// ถ้า myPrecondition เป็น nil จะแสดงประโยค "myPrecondition variable is nil"

// precondition(2 > 3, "2 wasn't greater than 3")
// โปรแกรมจะหยุดทำงานเพราะเงื่อนไขเป็นเท็จ: 2 ไม่มากกว่า 3

// สามารถใช้เงื่อนไข if ได้เช่นเดียวกับ Assert
/*
if (myPrecondition != "text") {
    // เงื่อนไขเป็นจริง โปรแกรมจะหยุดทำงาน
    preconditionFailure("invalid value")
}
*/

var users = [1, 2, 3, 4, 5]
print(users) // ans: [1, 2, 3, 4, 5]
precondition(users.count > 0, "There must be at least one user.")

var willRun = true
precondition(willRun)
print ("willRun = true: precondition passed") // ans: willRun = true: precondition passed
print("after willRun = true") // ans: after willRun = true

// willRun = false
// โปรแกรมจะหยุดทำงานเมื่อ wllRun = false

// precondition(willRun)
// print ("willRun = false precondition passed") // ไม่แสดงผล
// print("after willRun = false") // ไม่แสดงผล

// บังคับให้ preconditionFalure ด้วยการใช้คำสั่ง preconditionFailure()

if 5>10{
    preconditionFailure("Expected failure")
}else{
    print("5 ไม่มากไปกว่า 10")
}

/*
var myPreconditionFailure: String?
if let _ = myPreconditionFailure{
    print("option have value")
}else{
    preconditionFailure("Expected failure, no-value in option")
}
โปรแกรมจะทำงานในส่วน else และแสดงผล Expected failure, no-value in option
*/