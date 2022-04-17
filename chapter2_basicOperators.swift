//------------------------------------------
// Basic Operators
//------------------------------------------

//------------------------------------------
    // Unary operators
    /*
    +: Unary plus
    -: Unary minus
    !: Logical NOT
    ~: Bitwise NOT
    ...: Open-ended partial range
    ..<: Closed partial range
    */

//------------------------------------------
    //prefix

var myPrefixUnary = true

print(!myPrefixUnary) // ans: false

let UnaryMinusA = 5 // ans: 5
let UnaryMinusB = -UnaryMinusA // ans:-5
let UnaryMinusC = -42 // ans: -42
print(UnaryMinusA, UnaryMinusB, UnaryMinusC)

    //postfix

let UnaryPostfixfruits = ["apple", "banana", "mango", "🍊", "🍋"]
print(UnaryPostfixfruits[3...]) // ans: ["🍊", "🍋"]


    // Binary operators
    var BinaryOperatorsBasket = "mango"
BinaryOperatorsBasket = BinaryOperatorsBasket + ", banana" + ", 🍊"
print(BinaryOperatorsBasket) // ans: mango, banana, 🍊

    // Ternary operators
    /* จะคล้ายกับการใช้ if, else แต่เป็นการโค้ดแบบย่อด้วยการเปรียบเทียบ Boolean แล้ว return ค่ากลับมาใน 1 บรรทัด
    Syntax:
    condition ? true : false
    หรือ
    condition ? expression1 : expression2
    หมายความว่า
    ถ้าเงื่อนไขเป็น "จริง" จะทำงานใน expression1
    ถ้าเป็น "เท็จ" จะทำงานใน expression2
    */

// ตัวอย่างเมื่อเราใช้ if condition

let IfTernaryCriteriaScore = 60
var IfTernaryScore = ""

if (IfTernaryCriteriaScore >= 60){
    IfTernaryScore = "pass"
}else{
    IfTernaryScore = "fail"
}

print("you " + IfTernaryScore) // ans: you pass

// เราสามารถลดรูปให้อยู่ในรูปแบบของ Ternary Operators ได้ดังนี้

let TernaryCriteriaScore = 60

let TernaryScore = (TernaryCriteriaScore >= 60) ? "pass" : "fail"

print("you " + TernaryScore) // ans: you pass

//------------------------------------------
// Assignment Operator
//------------------------------------------

var elevenVariable = 11

var modElevenVariable = elevenVariable % 3 

print(modElevenVariable) // ans: 2

var red: String = "Red"
// red = nil // *error*


// swap
var swapA = 5 
var swapB = 4 
print(swapA, swapB) // ans: 5 4
(swapB, swapA) = (swapA, swapB)
print(swapA, swapB) // ans: 4 5


var optionalVariable: String?
optionalVariable = "OptionalStringNameValue"
print(optionalVariable) // ans: Optional("OptionalStringNameValue")

/* ใน swift การ assign จะไม่มีการ return เช่นตัวอย่าง if x = y จะไม่สามารถใช้ได้
ถ้าจะเช็คเงื่อนไขต้องเปรียบเทียบเป็น boolean เท่านั้น เช่น if x == y
*/

var variableOne = 1
var variableTwo = 2

var innitialValueOptional: Int?
var initialValueTen = 10
print(type(of:(innitialValueOptional))) // ans: Optional<Int>
print(type(of:(initialValueTen))) // ans: Int

innitialValueOptional = 10
print(innitialValueOptional) // ans: Optional(10)
innitialValueOptional = innitialValueOptional! + initialValueTen
print(innitialValueOptional) // ans: Optional(20)
innitialValueOptional = initialValueTen
print(innitialValueOptional) // ans: Optional(10)


print( (variableOne == variableTwo) ? "1 == 2" : "1 != 2" ) // ans: 1 != 2


//------------------------------------------
// Arithmetic Operators
//------------------------------------------
/* 
    Addition (+) | 5 + 2 = 7
    Subtraction (-) | 4 - 2 = 2
    Multiplication (*) | 2 * 3 = 6
    Division (/) | 4 / 2 = 2
    Modulo (%) | 5 % 2 = 1 
    
    Overflow addition (&+)
    Overflow subtraction (&-)
    Overflow multiplication (&*)

*/

    //------------------------------------------
    // Addition
    //------------------------------------------

var (ArithmeticVariableA, ArithmeticVariableB) = (7, 2)
var unsignedOverflow = UInt8.max // 255


ArithmeticVariableA += ArithmeticVariableB // 7+2
print(ArithmeticVariableA) // ans: 9

print("con" + "cat") // ans: concat

unsignedOverflow = unsignedOverflow &+ 1 // Uint8.max overflow +1
print(unsignedOverflow) // ans: 0


//กำหนดค่าให้ UInt8 ใหม่เป็น 250
unsignedOverflow = 250

// จากข้อมูลชุดเดิม
// var innitialValueOptional: Int?
// var initialValueTen = 10
initialValueTen += 10 
print(initialValueTen) // ans: 20
// innitialValueOptional += innitialValueOptional // *error*
innitialValueOptional! += innitialValueOptional!
print(innitialValueOptional) // ans: Optional(20)


// ใช้คำสั่ง &+ 10 เพื่อทดสอบว่า overflow หรือไม่
unsignedOverflow = unsignedOverflow &+ 10
print(unsignedOverflow) // ans: 4
/*เหตุผลที่ได้ค่า 4 เพราะว่า
1.นำค่า 10 มาบวกเพิ่มเข้าไปจากเดิม ที่เป็น 250 + 5 จะได้ 255 ซึ่งเป็นค่าสูงุสดของ UInt8
2.เมื่อใช้คำสั่ง &+ จะเกิด overflow ค่าผลต่างที่เหลือ 5(10-5) จึงถูกนำเข้ามาบวกเพิ่มจากค่าเดิมที่เป็น 255 ที่เป็นค่า max ของ UInt8
3.นำค่าส่วนต่างที่เหลือ(5)มาบวกเพิ่มทีละ 1 จะได้เป็น 0 1 2 3 4 ตามลำดับ
*/

    //------------------------------------------
    // Subtraction
    //------------------------------------------

ArithmeticVariableA -= ArithmeticVariableB // 9-2
print(ArithmeticVariableA) // ans: 7
// print("con" - "cat") // *error*

unsignedOverflow = UInt8.min // 0
unsignedOverflow = unsignedOverflow &- 1 // 0 overflow -1
print(unsignedOverflow) // ans: 255


initialValueTen = 20
initialValueTen -= 10 
print(initialValueTen) // ans: 10

innitialValueOptional = 20
// innitialValueOptional -= innitialValueOptional // *error*
innitialValueOptional! -= innitialValueOptional!
print(innitialValueOptional) // ans: Optional(0)

    //------------------------------------------
    // Multiplication
    //------------------------------------------

ArithmeticVariableA *= ArithmeticVariableB // 7*2
print(ArithmeticVariableA) //ans: 14
// print("con" * "cat") // *error*

initialValueTen = 10
initialValueTen *= 10 
print(initialValueTen) // ans: 100

innitialValueOptional = 10
innitialValueOptional! *= innitialValueOptional!
// innitialValueOptional *= innitialValueOptional // *error*
print(innitialValueOptional) // ans: Optional(100)


    //------------------------------------------
    // Division
    //------------------------------------------

ArithmeticVariableA /= ArithmeticVariableB // 14/2
print(ArithmeticVariableA) // ans: 3

print(7/3) // ans: 2
print(7.0/3.0) // ans: 2.3333


initialValueTen = 100
initialValueTen /= 10 
print(initialValueTen) // ans: 10

innitialValueOptional = 100
innitialValueOptional! /= innitialValueOptional!
// innitialValueOptional /= innitialValueOptional // *error*
print(innitialValueOptional) // ans: Optional(1)

    //------------------------------------------
    // Modulo
    //------------------------------------------

ArithmeticVariableA %= ArithmeticVariableB // 3%2
print(ArithmeticVariableA) // ans: 1
// print("con" % "cat") // *error*

initialValueTen = 100
innitialValueOptional = 100
initialValueTen %= 9
innitialValueOptional! %= 9
print(initialValueTen) // ans: 1
print(innitialValueOptional) // ans: Optional(1)

//------------------------------------------
// Remainder Operator
//------------------------------------------
// จะคล้ายกับ Modulo แต่จะสามารถใช้กับค่าที่ติดลบได้ด้วย
// Remainder operator (a % b) ใช้บอกว่า b ต้องคูณกี่ครั้งถึงจะใกล้เคียงหรือเท่ากับ a และ return ส่วนที่เหลือออกมา

let myMinus = -15 / 2 // -7

let myRemainder = -15 % 2 // จะหมายถึง (7 * -2) + (-1)
//ans : -1

print((2 * myMinus) + myRemainder) // (2 * -7) + (-15)
// ans: -15

// ยกตัวอย่าง a % b และ a % -b จะได้ค่าเท่ากัน
// ไม่ว่า b จะเป็น (+) หรือ (-) จะไม่มีผลกระทบกับตัวผลลัพธ์ที่ได้
// จะสนใจแค่ตัว a
var myRemindA = 14
var myRemindB = 3
print(myRemindA % myRemindB) // ans: 2
print(myRemindA % -myRemindB) // ans: 2
print(-myRemindA % myRemindB) // ans: -2
print(-myRemindA % -myRemindB) // ans: -2

for i in 1...6 {
    if i % 2 == 0 {
        print("Number is even")
    } else {
        print("Number is odd")
    }
}
/*
Number is odd
Number is even
Number is odd
Number is even
Number is odd
Number is even
*/

//------------------------------------------
// Unary Minus Operator
//------------------------------------------
let three = 3
let minusThree = -three       // minusThree equals -3
let plusThree = -minusThree   // plusThree equals 3, or "minus minus three"
print(plusThree)
print( (-three == -3 && -three == minusThree) ? -three : "not equal") // ans: -3

//------------------------------------------
// Unary Plus Operator
//------------------------------------------
let minusSix = -6
let plusMinusSix = +minusSix  // ans: -6
print(plusMinusSix)

print( (+minusSix == +plusMinusSix) ? -minusSix : (String(+minusSix) + " != " + String(+plusMinusSix)))
// ans: 6


//------------------------------------------
// Compound Assignment Operators
//-----------------------------------------
/*
สามารถเขียนตัว Operator พร้อมกับ Assign ค่าในรูปย่อได้ในคำสั่ง
    (+=) บวกแล้วกำหนดค่าให้กับตัวแปร
    (-=) ลบแล้วกำหนดค่าให้กับตัวแปร
    (*=) คูณแล้วกำหนดค่าให้กับตัวแปร
    (/=) หารแล้วกำหนดค่าให้กับตัวแปร
    (%=) mod แล้วกำหนดค่าให้กับตัวแปร
*/
var (CompoundVarA, CompoundVarB, CompoundVarC) = (100, 200, 300)

CompoundVarA += CompoundVarB + CompoundVarC // 100 + (200+300)
print(CompoundVarA) // ans: 600

var score = 95
/*
(+=) Addition:
score -= 5 // ans: 90

(-=) Subtraction:
score += 5 // ans: 100

(*=) Multiply:
score += 5 // ans: 475

(/=) Divide:
score += 5 // ans: 19

(%=) Modulus:
score += 5 // ans: 0
*/

var quote = "roses are red violets are "
quote += "blue"
print(quote) // ans: roses are red violets are blue

/* error

var quote = "roses are red violets are "
quote -= "red"
ตัวแปรชนิด String ไม่สามารถใช้ -= โดยตรงได้
error*/

var hoursWork = 10
var price = 50.0
var income = 0.0

if hoursWork > 8 {
  let OT = (Double(hoursWork)/2) * (50 * 0.8)
  income += OT
}

income += Double(hoursWork) * 25
print(income)
//ans : 450.0


//------------------------------------------
// Comparison Operators
//------------------------------------------
/*
Comparison Operators จะ return ค่าเป็น Bool(Boolean)
    Equal to (a == b)
    Not equal to (a != b)
    Greater than (a > b)
    Less than (a < b)
    Greater than or equal to (a >= b)
    Less than or equal to (a <= b)

*/

var ComparisonVarA = 5, ComparisonVarB = 2

// 5 == 2
print(ComparisonVarA == ComparisonVarB) // false

// 5 != 2
print(ComparisonVarA != ComparisonVarB) // true

// 5 > 2
print(ComparisonVarA > ComparisonVarB) // true

// 5 < 2
print(ComparisonVarA < ComparisonVarB) // false

// 5 >= 2
print(ComparisonVarA >= ComparisonVarB) // true

//5 <= 2
print(ComparisonVarA <= ComparisonVarB) // false


var 为 = "为"
var 日本 = "日本"

print("为 == 日本 🍎\(为 == 日本)") // 为 == 日本 🍎false
print("为 != 日本 🍎\(为 != 日本)") // 为 != 日本 🍎true
print("为 > 日本 🍎\(为 > 日本)") // 为 > 日本 🍎false
print("为 < 日本 🍎\(为 < 日本)") // 为 < 日本 🍎true
print("为 >= 日本 🍎\(为 >= 日本)") // 为 >= 日本 🍎false
print("为 <= 日本 🍎\(为 <= 日本)") // 为 <= 日本 🍎true


/*
Swift also provides two identity operators (=== and !==), which you use to test whether two object references both refer to the same object instance
สามารถเช็คได้ว่า reference ที่ถูกเปรียบเทียบจะชี้ไปยัง object1 ตัวเดียวกันหรือไม่
*/

// Comparison มักจะถูกใช้เพื่อเปรียบเทียบค่าด้วยคำสั่ง if
let myApple = "apple"
if myApple == "🍎" {
    print("that's my apple!")
}else {
    print("🍎 isn't my \(myApple)")
}

/*



    You can’t add or remove items from a tuple; they are fixed in size.
    You can’t change the type of items in a tuple; they always have the same types they were created with.
    You can access items in a tuple using numerical positions or by naming them, but Swift won’t let you read numbers or names that don’t exist.


 Tuples Comparison
จะเช็คทีละคู่ ถ้าเงื่อนไขเป็นจริงถึงจะเช็คตัวถัดไป
    (1, "zebra") < (2, "apple")   // true because 1 is less than 2; "zebra" and "apple" aren't compared
    (3, "apple") < (3, "bird")    // true because 3 is equal to 3, and "apple" is less than "bird"
    (4, "dog") == (4, "dog")      // true because 4 is equal to 4, and "dog" is equal to "dog"
    ("blue", -1) < ("purple", 1)        // OK, evaluates to true
    ("blue", false) < ("purple", true)  // Error because < can't compare Boolean values

*/
let tupleSetA: (String, Double, Bool) = ("1", 2, false)
let tupleSetB = ("3", -4.0, true)

print(tupleSetA.0 < tupleSetB.0) // true
print((tupleSetA.0, tupleSetA.1) < (tupleSetB.0, tupleSetB.1)) // true
// print((tupleSetA.0, tupleSetA.2) < (tupleSetB.0, tupleSetB.2)) // *error* bool ใช้ได้แค่เปรียบเทียบจริงหรือเท็จ

print(tupleSetA.1 < tupleSetB.1) // false
// print(tupleSetA.1 < tupleSetB.2) // error คนละ DataType(Double, Bool)
print(tupleSetA.2 == tupleSetB.2) // false


//------------------------------------------
// Ternary Conditional Operator
//------------------------------------------
/*
เป็น operator ที่มี 3 ส่วน
condition ? expression1 : expression2
หรือ
condition ? true_expression : false_expression
เป็นวิธีการเขียนแบบลัดจากคำสั่ง if
ถ้าเงื่อนไขเป็น "จริง" จะทำงานใน expression1
ถ้าเป็น "เท็จ" จะทำงานใน expression2 และคืนค่า Ternary Conditional
*/

 var TernaryCondition: Bool
 var TernaryExpressionOne = 1
 var TernaryExpressionFifteen = 15
 var TernaryExpressionOnehundred = 100
 var TernaryResult: Int
 
TernaryCondition = true
    if TernaryCondition {
        TernaryResult = TernaryExpressionOne + TernaryExpressionFifteen
    } else {
        TernaryResult = TernaryExpressionOne + TernaryExpressionFifteen
    }

    print(TernaryResult) // ans: 16


// เขียนย่อในรูปของ Ternary Condition Operator
TernaryResult = TernaryExpressionOne +
            (TernaryCondition ? TernaryExpressionFifteen : TernaryExpressionOnehundred)
print(TernaryResult) // ans: 16


var direction = true
var sign = direction ? 1 : -1
print(sign) // ans: 1

var left: (Bool, String) =  (true, "left")
var right: (Bool, String) = (false, "right")
var wantToGo: Bool = true
print("go \(((wantToGo && left.0) || (wantToGo && right.0)) ? left.1 : right.1)")
// go left


let constNumberTen = 10
let constNumberTwenty = 20

let sumOfTenAndTwenty = (constNumberTen>constNumberTwenty) ?
("constNumberTen > constNumberTwenty") : ("constNumberTwenty > constNumberTen")

print(sumOfTenAndTwenty) // ans: constNumberTwenty > constNumberTen


//------------------------------------------
// Nil-Coalescing Operator
//------------------------------------------
/*
Nil-Coalescing หมายความว่า dataType ที่ถูก assign จะต้องมีค่า(Value)เสมอ
วิธีการใช้งาน
(a ?? b) a จะต้องเป็น "optional" ถ้า a มีค่าจะทำการ unwrap a ออกมา
ถ้า a เป็น nil จะ unwrap ไม่ได้ ฉะนั้น b จะถูกใช้งานแทน a
หรือเขียนในรูปแบบดังนี้ได้
a != nil ? a! : b

*/

var optionalNillCoalescing: String?   // defaults to nil
let defaultNillCoalescing = "default value"

var resultNillCoalescing = optionalNillCoalescing ?? defaultNillCoalescing
print(resultNillCoalescing)
// ans: default value

optionalNillCoalescing = "optional value"
resultNillCoalescing = optionalNillCoalescing ?? defaultNillCoalescing

print(resultNillCoalescing)
// ans: optional value


let nilOptionalStringName: String? = nil
let unwrappedName = nilOptionalStringName ?? "Godzila"

print(unwrappedName) // ans: Godzila

// สามารถใช้คำสั่ง Nil-Coalescing แสดงผลได้เลย ไม่จำเป็นต้องใช้ตัวแปรเพื่อรับค่าก่อน
print("My name is \(nilOptionalStringName ?? "Godzila")!")
// ans: My name is Godzila!

//------------------------------------------
// Range Operators
//------------------------------------------
/*
Range Operators มี 3 ประเภท
    (a…b) (Closed Range Operator) เริ่มตั้งแต่ a ถึง b มักใช้กับ for-loop
    (a..<b) (Half-Open Range Operator) เริ่มตั้งแต่ a ไปจนถึง b แต่จะไม่รวม b มักใช้กับ for-loop, arrays
    [a…] (One-Sided Range Operator) เริ่มทำตั้งแต่ช่วงที่กำหนดไปจนถึงอีกด้าน
*/
    //------------------------------------------
    // Closed Range Operator
    //------------------------------------------

    /*
    (a...b) หมายความว่าจะเริ่มตั้งแต่ a ไปจนถึง b โดยจะรวมค่าของ a และ B ด้วย
    โดยค่าของ a จะต้องน้อยกว่า b

    Closed range operator มีประโยชน์สําหรับใช้ใน for-in loop
    */
        
    for index in 1...5 {
        print("\(index) times 5 is \(index * 5)")
    }
    // 1 times 5 is 5
    // 2 times 5 is 10
    // 3 times 5 is 15
    // 4 times 5 is 20
    // 5 times 5 is 25
    
    for i in (-1...2){
        print(i)
    }
    /*
        -1
        0
        1
        2
    */

    let minOfArray = 1
    let maxOfArray = 3
    var someArray = [Int](minOfArray...maxOfArray)

    print(someArray) // ans: [1, 2, 3]

    // ประกาศตัวแปรเป็น Closed Range
    let closedRangeDouble: ClosedRange<Double> = -1...3.6

    print(closedRangeDouble) // ans: -1...3.6
    print(closedRangeDouble.contains(3.6)) // ans: true
    // print(closedRangeDouble[0...]) // *error*

    //------------------------------------------
    // Half-Open Range Operator
    //------------------------------------------
    /*
    (a..<b) หมายถึงจะเริ่มตั้งแต่ a ไปจนถึง b แต่จะไม่รวม b
    และค่าของ a จะต้องน้อยกว่า b
    เหมาะสำหรับใช้ใน arrays เพราะจะเริ่มต้นที่ 0 และนับขึ้นไปเรื่อยๆ แต่จะไม่รวมค่า b ที่เป็นขนาดของ arrays
    */

    let closedRangeOneToThree = 0...3
    print(closedRangeOneToThree.count) // ans: 4

    let myArrayAE = ["a", "b", "c", "d", "e"]
    let myClosedRangeOneToThree: ClosedRange = 1...3
    let myCountableClosedRange: CountableClosedRange = 1...3

    print(myArrayAE[closedRangeOneToThree])
    // ans: ["a", "b", "c", "d"]
    print(myArrayAE[myClosedRangeOneToThree])
    // ans: ["b", "c", "d"]

    // for index in closedRangeOneToThree{ // *error*
    for index in myCountableClosedRange {
        print(myArrayAE[index])
    }
    /*
        b
        c
        d
    */


    let halfOpenRange = 0..<10
    print(halfOpenRange.count) // ans: 10


    let names = ["Anna", "Alex", "Brian", "Jack"]
    let count = names.count
    for i in 0..<count {
        print("Person \(i + 1) is called \(names[i])")
    }
    // result 
    // Person 1 is called Anna
    // Person 2 is called Alex
    // Person 3 is called Brian
    // Person 4 is called Jack

    let num = [1,3,4,6]
    for data in num {
    print(data)
    }
    // result 
    // 1
    // 3
    // 4
    // 6

    if (0..<5).contains(5) {
    print("5 อยู่ในช่วง (0..<5)")
    }else{
    print("5 ไม่ได้อยู่ในช่วง (0..<5)")
    }
    // ans: 5 ไม่ได้อยู่ในช่วง (0..<5)

    var numbers = [1,2,3,4,5]
    print("\(numbers)") // ans: [1, 2, 3, 4, 5]
    print(numbers.count) // ans: 5

    for index in 0..<numbers.count {
        print(numbers[index])
    }
    /*
        1
        2
        3
        4
        5
    */

    let numbersArrays = [10, 20, 30, 40, 50, 60, 70]
    print(numbersArrays[0...3]) // ans: [10, 20, 30, 40]

    //------------------------------------------
    // One-Sided Ranges
    //------------------------------------------
    /*
    ระบุค่าที่ต้องการเริ่มต้นหรือจุดจบ โดยทิ้งอีกด้านให้เป็น infinite
    มีวิธีการทำงาน 2 แบบคือ
    1.เริ่มทำงานตั้งแต่ "จุดที่ระบุ" ไป "จนจบ" [2...] 
    2."ตั้งแต่เริ่มต้น" ไปจนถึง "จุดที่ระบุ" [...2]
    */

    let fruits = [
                    "apple",
                    "orange",
                    "melon",
                    "lime"
                    ]

    print(fruits[...2]) // ans: ["apple", "orange", "melon"]

    print(fruits[2...]) // ["melon", "lime"]

    print(fruits[..<2]) // ["apple", "orange"]

    print(fruits[..<(2+1)]) // ["apple", "orange", melon]

    let one = 1
    print(fruits[one...]) // ["orange", "melon", "lime"]


    for name in names[2...] {
        print(name)
    }
    // Brian
    // Jack

    for name in names[...2] {
        print(name)
    }
    // Anna
    // Alex
    // Brian

    // half-open range สามารถใช้ one-sided ร่วมได้
    print("\n")
    for name in names[..<2] {
    print(name)
    }
    // Anna
    // Alex

    // ประกาศตัวแปรเป็น One-sideed range

    let zeroToFive = 0.0..<5.0

    print(zeroToFive.contains(3.14)) // ans: true
    print(zeroToFive.contains(6.28)) // ans: false
    print(zeroToFive.contains(5.0)) // ans: false

    let empty = 0.0..<0.0
    empty.contains(0.0) // ans: false

    let range1 = ..<2
    print(range1.contains(-1)) // ans: true

    let range2 = 2...
    print(range2.contains(33)) // ans: true

    // สามารถใช้ contains ตรวจสอบช่วงของค่าที่กำหนดขึ้นมาได้
    let range = ...5 // เอาตั้งแต่ค่าติดลบมาจนถึง 5
    print(type(of:range)) // ans: PartialRangeThrough<Int>
    print(range.contains(7))   // ans: false
    print(range.contains(4))   // ans: true
    print(range.contains(-1))  // ans: true

    let maximumAge = 50
    let minimumAge = 12
    let myAge = 52

    print((minimumAge...maximumAge).contains(myAge)) // ans: false
    print((...maximumAge).contains(myAge)) // ans: false
    print((minimumAge...).contains(myAge)) // ans: true



//------------------------------------------
// Logical Operators
//------------------------------------------

/*
ัตัวดำเนินการทางตรรกะหรือตัวแปรประเภท Boolean ที่มีค่าเป็น true หรือ false
    Logical NOT (!a)
    Logical AND (a && b)
    Logical OR (a || b)

*/


//------------------------------------------
// Logical NOT Operator
//------------------------------------------

/*
ตัวดําเนินการทางตรรกะ NOT (!a) อ่านว่า “not a” เปลีCยน Boolean จากค่า true เป็น false
และเปลีCยนค่าจาก false เป็น true ยกตัวอย่างเช่
*/

    print(!true) // ans: false

    let allowedEntry = false
    // allowedEntry = false
    // !allowEntry = true

    if !allowedEntry {
    // อ่านได้ว่า if not allowEntry ผลลัพธ์ที่ได้จะเป็น true เนื่องจาก allowedEntry มีค่าเป็น false
        print("ACCESS DENIED")
    }
    // Prints "ACCESS DENIED"



let myTrue = true
let myFalse = false

var myNotLogical = !myTrue
print(myNotLogical) // ans: false
print(!myNotLogical) // ans: true

var いちご  = true
var ニコ  = false

print("!いちご 🍎\(!いちご)") // !いちご 🍎false
print("!ニコ 🍎\(!ニコ)") // !ニコ 🍎true


//------------------------------------------
// Logical AND Operator
//------------------------------------------

/*
(a && b) จะมีค่าความจริงก็ต่อเมื่อทั้ง a และ b มีค่าเป็น true
แต่ถ้า a หรือ b ตัวใดตัวหนึ่งมีค่าเป็น false จะทำให้นิพจน์เป็น false
ถ้านิพจน์ a มีค่าเป็น false ตัว b จะไม่ถูกดำเนินการ 
*/

print(true && true) // ans: true
print(true && false) // ans: false


let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan { // true (and) false = false
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// Prints "ACCESS DENIED"

// จากตัวแปรชุดเก่า
// let myTrue = true
// let myFalse = false

var myAndLogical = myTrue && myFalse
print(myAndLogical) // ans: false


var fiveItemsArrays : [Int] = [1, 2, 3, 4, 5]

print(type(of:fiveItemsArrays))
var maxFiveItemsArrays = fiveItemsArrays.max() ?? 90

print(maxFiveItemsArrays) // ans: 5
print(fiveItemsArrays.count) // ans: 5

if fiveItemsArrays.count > 0 && fiveItemsArrays.count < maxFiveItemsArrays {
    fiveItemsArrays[maxFiveItemsArrays-1] = 50
}else{
    fiveItemsArrays[fiveItemsArrays.count-1] = 20
}

print(fiveItemsArrays) // ans: [1, 2, 3, 4, 20]


var ten = 10
var twentyTwo = 22
var tenAndTwentyResult: Bool?

tenAndTwentyResult = ten < twentyTwo
print(tenAndTwentyResult) // ans: Optional(true)
print(tenAndTwentyResult == true) // ans: true
// print(tenAndTwentyResult && true) // *error*

print("いちご && ニコ 🍎\(いちご && ニコ)")
// いちご && ニコ 🍎false

//------------------------------------------
// Logical OR Operator
//------------------------------------------

/*
(a || b) จะมีค่าเป็น true เมื่อ a หรือ b ตัวใดตัวหนึ่งมีค่าเป็น true
*/

print(true || false) // ans: true

if (10 < 20) || (20 < 10) {
    print("true")
}else{
    print("false")
}
// ans: true

let hasDoorKey = false
let knowsOverridePassword = true
if hasDoorKey || knowsOverridePassword { // false (or) true == true
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// Prints "Welcome!"

// จากตัวแปรชุดเก่า
// let myTrue = true
// let myFalse = false

let myLogicalTrueOrFalse = myTrue || myFalse
print(myLogicalTrueOrFalse) // ans: true

var userHasCellularConnect = true
var userHasWifiConnect = false
if userHasCellularConnect || userHasWifiConnect {
    print("download video")
} else {
    print("can't download video")
}
// ans: download video

print("いちご || ニコ 🍎\(いちご || ニコ)") // いちご || ニコ 🍎true

//------------------------------------------
// Combining Logical Operators
//------------------------------------------

/*
จะทำงานจากซ้ายไปขวา ถ้าพบคำตอบแต่แรก expression ตัวถัดไปจะไม่ทำงาน
มีลักษณะการทำงานแบบ Short Circuit 
*/

// จากตัวอย่างด้านล่าง (true (and) false) (or) (false (or) true)
// นิพจน์คู่แรกจะได้คำตอบเป็น false
// นิพจน์คู่หลังจะได้คำตอบเป็น true
// เมื่อนำสองพิจน์ที่มีค่าเป็น false และ true ตามลำดับ มาเปรียบเทียบกันด้วย (or) จะทำให้ได้ผลลัพธ์เป็น true

var knowsPassword = true
var useFingerPrint = true
var useFaceID = true

if knowsPassword && useFingerPrint || knowsPassword && useFaceID {
    print("login success")
} else {
    print("access denied")
}
// ans: login success


//------------------------------------------
// Explicit Parentheses
//------------------------------------------

/*
เมื่อมีนิพจน์ที่มีเงื่อนไขซับซ้อน วงเล็บจะช่วยทำให้ง่ายต่อการอ่าน แต่ไม่ได้ทำให้ผลลัพธ์เปลี่ยนแปลงไป

จากตัวอย่างข้างต้น ถ้า "ไม่ใส่วงเล็บ "ช่วย

if knowsPassword && useFingerPrint || knowsPassword && useFaceID {...}

ผลลัพธ์ที่ได้จะเท่ากับ true แต่ readability จะต่ำ ยิ่งถ้ามีนิพจน์จำนวนมาก มีความซับซ้อน
จะทำให้การเขียนโค้ดและการอ่าน มีความยากขึ้นตามไปด้วย


แต่ถ้าเรามีการ "ใส่วงเล็บ" ช่วย

if (knowsPassword && useFingerPrint) || (knowsPassword && useFaceID) {...}

จะทำให้ readability สูงขึ้น เพราะสามารถแยกได้ว่าพิพจน์คู่ไหนกระทำกับอะไร

*/


