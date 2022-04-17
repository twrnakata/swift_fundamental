//------------------------------------------
// Collection Types
//------------------------------------------
/*
Arrays สิ่งที่เก็บใน arrays จะเรียงลำดับ
Sets ข้อมูลไม่เรียงลำดับและต้องไม่ซ้ำ
Dictionaries ข้อมูลไม่เรียงลำดับ จะเก็บ key และ value
*/

//------------------------------------------
// Mutability of Collections
//------------------------------------------

/*
ต้องคิดก่อนว่าจะ declare เป็น var(แก้ไขได้) หรือ let(แก้ไขไม่ได้)
swift complier จะได้ optimize ให้เหมาะสม
*/


//------------------------------------------
// Arrays
//------------------------------------------
/*
The type of a Swift array is written in full as Array<Element>,
where Element is the type of values the array is allowed to store.
You can also write the type of an array in shorthand form as [Element].
Although the two forms are functionally identical,
the shorthand form is preferred and is used throughout this guide
when referring to the type of an array.


check out of bound
        (startIndex <= index && index < endIndex) ? list[index] : nil

        if list.indices.contains(index)

*/

// int arrays
var numberOfArrays : [Int] = [2, 4, 6, 8]
// หรือ
// var numberOfArrays = [2, 4, 6, 8]

print(type(of:(numberOfArrays))) // Array<Int>
print("Array: \(numberOfArrays)") // Array: [2, 4, 6, 8]

// optional arrays
var optionalArraysInt : [Int]? = [1, 2]
print(type(of:(optionalArraysInt))) // Optional<Array<Int>>
print(optionalArraysInt) // Optional([1, 2])

// string arrays
var stringArrays : [String] = ["String", "Arrays"]
print(type(of:(stringArrays)))
print(stringArrays) // ["String", "Arrays"]

// double arrays
var doubleArrays = [1_3, 2.9_2, 200]
// var doubleArrays : [Double] = [1_3, 2.9_2, 200]
print(type(of:(doubleArrays))) // Array<Double>
print(doubleArrays) // [13.0, 2.9199999999999999, 200.0]



var stringArraysOne = [String] (repeating: "One", count: 3)

print(type(of:stringArraysOne)) // Arrays<String>
print(stringArraysOne) // ["One", "One", "One"]


// Add items in Int(arrays) to String(arrays)
var arraysConvertIntToString: [String] = []
for item in numberOfArrays{
    print(item)
    arraysConvertIntToString.append(String(item))
}
print(type(of:arraysConvertIntToString)) // Array<String>
print(arraysConvertIntToString) // ["2", "4", "6", "8"]

// ค้นหาและลบ values ในตำแหน่งที่กำหนด
print(arraysConvertIntToString)
// ["2", "4", "6", "8"]
var searchValue = "2"
if arraysConvertIntToString.contains(searchValue){
    for (index, item) in arraysConvertIntToString.enumerated() {
        if type(of:item) == type(of:searchValue){
            // print(type(of:item), item)
            if (item == searchValue) {
                let deletedItemd = arraysConvertIntToString.remove(at: index)
                print("delete ===\(item)===")
                break
            }
        }
        // print(index, item)
    }
}else{
    print("not found")
}
print(arraysConvertIntToString)
// ["4", "6", "8"]

// สร้าง empty [Any]arrays
var anyArrays: [Any] = []
print(type(of:anyArrays)) // Array<Any>
print(anyArrays) // []

// Add items in Int and String Arrays to [Any]Array
for item in numberOfArrays{
    anyArrays.append(item)
}
for item in stringArraysOne{
    anyArrays.append(item)
}
print(type(of:anyArrays)) // Array<Any>
print(anyArrays)
// [2, 4, 6, 8, "One", "One", "One"]

// สร้าง optional string arrays 

let arraysOptionalStringWaitForConvert: [String?] = ["an", nil, "optionals"]
// Array<Optional<String>>
// [Optional("an"), nil, Optional("optionals")]

// Add item in Optional to Any
for item in arraysOptionalStringWaitForConvert{
    anyArrays.append(item)
}
print(type(of:anyArrays)) // Array<Any>
print(anyArrays)
// [2, 4, 6, 8, "One", "One", "One", Optional("an"), nil, Optional("optionals")]






//------------------------------------------
// Creating an Empty Array
//------------------------------------------

// empty arrays int
var emptyArraysInt: [Int] = []
print(type(of:emptyArraysInt)) // Arrays<Int>>
print(emptyArraysInt) // []
print("emptyArraysInt is of type [Int] with \(emptyArraysInt.count) items.")
// emptyArraysInt is of type [Int] with 0 items.

emptyArraysInt.append(3) // [3]
emptyArraysInt = [] // []


// empty arrays string
var emptyArraysString = [String] ()
print(type(of:(emptyArraysString))) // Array<String>
print(emptyArraysString) // []

var emptyThreeElementString = Array(repeating: String(), count: 3)
print(type(of:emptyArraysString)) // Array<String>

if let firstElement = emptyArraysString.first, let lastElement = emptyArraysString.last {
    print(firstElement, lastElement, separator: ", ")
}else{
    print("no items in arrays")
}
// no items in arrays

// empty arrays floats
var emptyFloats: Array<Float> = Array()
print(type(of:emptyFloats)) // Array<Float>
print((emptyFloats.isEmpty) ? "Arrays is empty" : emptyFloats)
// Arrays is empty

// empty optional arrays int
var emptyOptionalArraysInt : [Int]? = nil
print(type(of:(emptyOptionalArraysInt)))
print(emptyOptionalArraysInt) // nil

if let item = emptyOptionalArraysInt{
    print(item, separator: ", ")
}else{
    print("no items in optional arrays")
}
// no items in optional arrays


print("------------------------------------------")


//------------------------------------------
// Creating an Array with a Default Value
//------------------------------------------

// ประกาศตัวแปร Arrays เป็น double มีสมาชิก 3 ตัว โดยมีค่าเริ่มต้นที่ 0.0
var threeDoubles = Array(repeating: 0.0, count: 3)
// threeDoubles is of type [Double], and equals [0.0, 0.0, 0.0]

print(type(of:(threeDoubles)))
print(threeDoubles)

var threeStrings = [String] (repeating: "None", count: 3)
print(type(of:(threeStrings))) // Arrays<String>
print(threeStrings[0]) // None
print(threeStrings[1]) // None
print(threeStrings[2]) // None
// print(threeStrings[3]) // out of bound

var defaultArraysOptionalString = [String?] (repeating: nil, count: 2)
print(type(of:defaultArraysOptionalString)) // Array<Optional<String>>
print(defaultArraysOptionalString) // [nil, nil]

var userNumber = 3
var defaultUserValue = ["Username:", "Password:"]
var users = Array(repeating: defaultUserValue, count: userNumber)
print(type(of:users)) // Array<Array<String>>
print(users) // [["Username:", "Password:"], ["Username:", "Password:"], ["Username:", "Password:"]]


//------------------------------------------
// Creating an Array by Adding Two Arrays Together
//------------------------------------------

// anotherThreeDoubles is of type [Double], and equals [2.5, 2.5, 2.5]
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
print(type(of:anotherThreeDoubles)) // Array<Double>

var anotherThreeString = [String] (repeating: "Hello", count: 3)

var anotherDefaultArraysOptionalString = [String?] (repeating: "Defalut optional value", count: 2)
print(type(of:anotherDefaultArraysOptionalString)) // Array<Optional<String>>
print(anotherDefaultArraysOptionalString) // [Optional("Defalut optional value"), Optional("Defalut optional value")]

// รวมสมาชิกสองตัว
var sixDoubles = threeDoubles + anotherThreeDoubles
print(sixDoubles) // [0.0, 0.0, 0.0, 2.5, 2.5, 2.5]

print(threeStrings + anotherThreeString) // ["None", "None", "None", "Hello", "Hello", "Hello"]

print(emptyArraysString + threeStrings) // ["None", "None", "None"]

print(defaultArraysOptionalString + anotherDefaultArraysOptionalString)
// [nil, nil, Optional("Defalut optional value"), Optional("Defalut optional value")]


var valueUsers = ["Luke", "1324password"]
print(type(of:valueUsers)) // Array<String>
var dataUser = Array(repeating: valueUsers, count:3)
print(type(of:dataUser)) // Array<Array<String>>

print(valueUsers) // ["Luke", "1324password"]
var mergeUsers = users + dataUser
print(type(of:mergeUsers)) // Array<Array<String>>
print(mergeUsers)
// [["Username:", "Password:"], ["Username:", "Password:"], ["Username:", "Password:"], ["Luke", "1324password"], ["Luke", "1324password"], ["Luke", "1324password"]]

print("------------------------------------------")

//------------------------------------------
// Creating an Array with an Array Literal
//------------------------------------------

var shoppingList: [String] = ["Eggs", "Milk"]
print(type(of:shoppingList)) // Array<String>
print(shoppingList) // ["Eggs", "Milk"]

let mixedAnyVar: [Any] = ["Kamen", "Rider", 90_1, true]
print(type(of:mixedAnyVar)) // Array<Any>
print(mixedAnyVar) // ["Kamen", "Rider", 901, true]



let descOptional: String? = "optional string"
var mixedAnyOptionalVariable: [Any?] = ["Luke", "10,999", 1, nil, 16.2_91, descOptional]
print(type(of:mixedAnyOptionalVariable)) // Array<Optional<Any>>

if mixedAnyOptionalVariable.isEmpty{
    print("empty")
}else{
    print("\(mixedAnyOptionalVariable)")
    // [Optional("Luke"), Optional("10,999"), Optional(1), nil, Optional(16.291), Optional("optional string")]
}


let arrayOfOptionalString: [String?] = ["an", nil, "of", "optionals"]
let anotherArrayOptional: [String?] = ["seven", "eight"]
print(type(of:arrayOfOptionalString)) // Array<Optional<String>>
print(arrayOfOptionalString) // Optional("an"), nil, Optional("of"), Optional("optionals")]

var AddTwoOptionalString = arrayOfOptionalString + anotherArrayOptional
print(type(of:AddTwoOptionalString)) //  Array<Optional<String>>
print(AddTwoOptionalString) // [Optional("an"), nil, Optional("of"), Optional("optionals"), Optional("seven"), Optional("eight")]


print("------------------------------------------")

//------------------------------------------
// Accessing and Modifying an Array
//------------------------------------------

print("The shopping list contains \(shoppingList.count) items.")
// Prints "The shopping list contains 2 items."

if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list isn't empty.")
}
// Prints "The shopping list isn't empty."

shoppingList.append("Flour")
// shoppingList now contains 3 items, and someone is making pancakes

shoppingList += ["Baking Powder"]
// shoppingList now contains 4 items
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
// shoppingList now contains 7 items

print(shoppingList)
// ["Eggs", "Milk", "Flour", "Baking Powder", "Chocolate Spread", "Cheese", "Butter"]

var firstItem = shoppingList[0]
// firstItem is equal to "Eggs"

// You can use subscript syntax to change an existing value at a given index:
shoppingList[0] = "Six eggs"
// the first item in the list is now equal to "Six eggs" rather than "Eggs"
print(shoppingList)
// ["Six eggs", "Milk", "Flour", "Baking Powder", "Chocolate Spread", "Cheese", "Butter"]

shoppingList[4...6] = ["Bananas", "Apples"]
// shoppingList now contains 6 items
print(shoppingList)
// ["Six eggs", "Milk", "Flour", "Baking Powder", "Bananas", "Apples"]

shoppingList.insert("Maple Syrup", at: 0)
// shoppingList now contains 7 items
// "Maple Syrup" is now the first item in the list

print(shoppingList)
// ["Maple Syrup", "Six eggs", "Milk", "Flour", "Baking Powder", "Bananas", "Apples"]





var alien: [Any] = ["Xenomorph \u{1F47E}", "Necronom IV \u{1F47D}"]
print(alien)
// ["Xenomorph 👾", "Necronom IV 👽"]

alien.append("Bheelluds \u{1F9A0}")

print(alien)
// ["Xenomorph 👾", "Necronom IV 👽", "Bheelluds 🦠"]

alien += ["sulaad \u{260A}"]
print(alien) // ["Xenomorph 👾", "Necronom IV 👽", "Bheelluds 🦠", "sulaad ☊"]
// alien -= ["sulaad \u{260A}"] // *error*

print(alien[1])
// Necronom IV 👽
print(alien[1...])
// ["Necronom IV 👽", "Bheelluds 🦠", "sulaad ☊"]

// alien[3...6] = ["stegzoit \u{2645}", "fildraeds \u{2643}", "druukains \u{1F4A5}"]
// *error* out of bound
alien += [90_.60_51, 234]
print(alien)
// "Xenomorph 👾", "Necronom IV 👽", "Bheelluds 🦠", "sulaad ☊", 90.605099999999993, 234]
print(alien.count) // 6

alien[4...5] = ["stegzoit \u{2645}", "fildraeds \u{2643}"]
print(alien)
// ["Xenomorph 👾", "Necronom IV 👽", "Bheelluds 🦠", "sulaad ☊", "stegzoit ♅", "fildraeds ♃"]

alien.insert("\u{26D4}", at: 0)
print(alien)
// ["⛔", "Xenomorph 👾", "Necronom IV 👽", "Bheelluds 🦠", "sulaad ☊", "stegzoit ♅", "fildraeds ♃"]


mixedAnyOptionalVariable.append(960*5)
print(mixedAnyOptionalVariable)
// [Optional("Luke"), Optional("10,999"), Optional(1), nil, Optional(16.291), Optional("optional string"), Optional(4800)]

mixedAnyOptionalVariable += [nil]
print(mixedAnyOptionalVariable)
// [Optional("Luke"), Optional("10,999"), Optional(1), nil, Optional(16.291), Optional("optional string"), Optional(4800), nil]

mixedAnyOptionalVariable.insert(nil, at:0)
print(mixedAnyOptionalVariable)
// [nil, Optional("Luke"), Optional("10,999"), Optional(1), nil, Optional(16.291), Optional("optional string"), Optional(4800), nil]

var star: [Any] = ["Sparkle \u{1F31F}", "Black \u{2605}"]
print(star)
// ["Sparkle 🌟", "Black ★"]


print(mixedAnyOptionalVariable.count)
// 9
mixedAnyOptionalVariable[3...] = ["insert scope", star]
print(mixedAnyOptionalVariable)
// [nil, Optional("Luke"), Optional("10,999"), Optional(1), Optional("insert scope"), Optional(["Sparkle 🌟", "Black ★"])]
// **ข้อมูลหาย**
print(mixedAnyOptionalVariable.count)
// 5



    // REMOVE

let mapleSyrup = shoppingList.remove(at: 0) // รับตัวที่ลบออกมาคล้ายๆ การ pop ออก
// the item that was at index 0 has just been removed
// shoppingList now contains 6 items, and no Maple Syrup
// the mapleSyrup constant is now equal to the removed "Maple Syrup" string

print(shoppingList)
// ["Six eggs", "Milk", "Flour", "Baking Powder", "Bananas", "Apples"]

let apples = shoppingList.removeLast()
// the last item in the array has just been removed
// shoppingList now contains 5 items, and no apples
// the apples constant is now equal to the removed "Apples" string
print(shoppingList)
// ["Six eggs", "Milk", "Flour", "Baking Powder", "Bananas"]


let removeLastAlien = alien.removeLast()
print(type(of:removeLastAlien)) // String
print(type(of:alien)) // Array<Any>
print(removeLastAlien) // fildraeds ♃
print(alien)
// ["⛔", "Xenomorph 👾", "Necronom IV 👽", "Bheelluds 🦠", "sulaad ☊", "stegzoit ♅"]
alien.insert(removeLastAlien, at: 0)
print(alien)
// ["fildraeds ♃", "⛔", "Xenomorph 👾", "Necronom IV 👽", "Bheelluds 🦠", "sulaad ☊", "stegzoit ♅"]

// swap last item to first item
alien.insert(alien.removeLast(), at:0)
print(alien)
// ["stegzoit ♅", "fildraeds ♃", "⛔", "Xenomorph 👾", "Necronom IV 👽", "Bheelluds 🦠", "sulaad ☊"]



let removeLastMixedAnyOptionalVariable = mixedAnyOptionalVariable.removeLast()
print(type(of:removeLastMixedAnyOptionalVariable)) // Optional<Any>
print(removeLastMixedAnyOptionalVariable) // Optional(["Sparkle 🌟", "Black ★"])
print(mixedAnyOptionalVariable[0...]) // [nil, Optional("Luke"), Optional("10,999"), Optional("insert scope")]

let removeFirstMixedAnyOptionalVariable = mixedAnyOptionalVariable.remove(at : 0)
print(type(of:removeFirstMixedAnyOptionalVariable)) // Optional<Any>
print(removeFirstMixedAnyOptionalVariable) // nil

print(mixedAnyOptionalVariable) // [Optional("Luke"), Optional("10,999"), Optional("insert scope")]


print("------------------------------------------")


//------------------------------------------
// Iterating Over an Array
//------------------------------------------

for item in shoppingList {
    print(item)
}
/*
Six eggs
Milk
Flour
Baking Powder
Bananas
*/

for creator in alien{
    print("\(creator)")
}
/*
stegzoit ♅
fildraeds ♃
⛔
Xenomorph 👾
Necronom IV 👽
Bheelluds 🦠
sulaad ☊
*/


for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}
// Item 1: Six eggs
// Item 2: Milk
// Item 3: Flour
// Item 4: Baking Powder
// Item 5: Bananas

for (index, name) in alien.enumerated(){
    print("Alien Number: \(index + 1) Name \(name)")
}
/*
Alien Number: 1 Name stegzoit ♅
Alien Number: 2 Name fildraeds ♃
Alien Number: 3 Name ⛔
Alien Number: 4 Name Xenomorph 👾
Alien Number: 5 Name Necronom IV 👽
Alien Number: 6 Name Bheelluds 🦠
Alien Number: 7 Name sulaad ☊
*/


//------------------------------------------
// Sets
//------------------------------------------
/*
เก็บค่าที่ไม่ซ้ำและเป็น type เดียวกัน ไม่เรียงลำดับ ค่าที่เก็บไว้ใน Set data typeจะต้องเป็น Hashable
หมายถึงจะต้องสามารถคำนวณค่า hash value ได้ ถ้า object เท่ากัน hash value ก็จะเท่ากัน
เช่นถ้า a == b จะหมายถึง a.hashValue == b.hashValue

The type of a Swift set is written as Set<Element>,
where Element is the type that the set is allowed to store.
Unlike arrays, sets don’t have an equivalent shorthand form.
*/

    // Creating and Initializing an Empty Set
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")
// Prints "letters is of type Set<Character> with 0 items."

// insert ค่า
letters.insert("a")                              
print(type(of:letters)) // Set<Character>
print(letters) // ["a"]

// clear value
letters = []
// letters is now an empty set, but is still of type Set<Character>
print(type(of:letters)) // Set<Character>

    // Creating a Set with an Array Literal

var starwarCharacters: Set<String> = [
                                    "Anakin Skywalker", "Luke Skywalker", "Leia Organa",
                                    "Han Solo", "Padmé Amidala"
                                    ]
// หรือ
// var starwarCharacters: Set = [
//                                     "Anakin Skywalker", "Luke Skywalker", "Leia Organa",
//                                     "Han Solo", "Padmé Amidala"
//                                     ]

print(type(of:starwarCharacters)) // Set<String>
print(starwarCharacters) // ["Luke Skywalker", "Han Solo", "Anakin Skywalker", "Leia Organa", "Padmé Amidala"]




// แปลงข้อมูลใน Arrays มาเป็น Set เพื่อลดข้อมูลที่ซ้ำกัน

let eAcuteQuestion = "Voulez-vous un caf\u{E9}?" 
// Voulez-vous un café?

let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"
// Voulez-vous un café?

print((eAcuteQuestion == combinedEAcuteQuestion) ? "EQUAL" : "NOT EQUAL" )
// EQUAL

let arraySameData = [
                    "One", "one", "One", "1", "1", "one", "onE", "oNe",
                    eAcuteQuestion, combinedEAcuteQuestion
                    ]
// Array<String>
print(arraySameData)
// ["One", "one", "One", "1", "1", "one", "onE", "oNe", "Voulez-vous un café?", "Voulez-vous un café?"]

var reduceSameDataSet = Set(arraySameData)
// Set<String>
print(reduceSameDataSet.sorted())
// ["1", "one", "onE", "oNe", "One", "Voulez-vous un café?"]





    // Accessing and Modifying a Set

print("Total member in starwars is \(starwarCharacters.count)")
// Total member in starwars is 5

if starwarCharacters.isEmpty{
    print("no one here")
}else{
    print("i found someone in this room")
}
// i found someone in this room


if starwarCharacters.contains("Luke Skywalker") {
    print("that characters is exist")
}else{
    starwarCharacters.insert("Luke Skywalker")
}
// that characters is exist

print(starwarCharacters)
// ["Luke Skywalker", "Han Solo", "Anakin Skywalker", "Leia Organa", "Padmé Amidala"]

starwarCharacters.insert("Yoda")
// ["Luke Skywalker", "Han Solo", "Yoda", "Anakin Skywalker", "Leia Organa", "Padmé Amidala"]


    // Remove
        // ลบสำเร็จ
if let removeCharacters = starwarCharacters.remove("Yoda"){
    print("remove \(removeCharacters) on this movie")
}else{
    print("i cant found that guys you just say on this movie")
}
// remove Yoda on this movie

       // ลบไม่สำเร็จ
if let removeCharacters = starwarCharacters.remove("Yoga"){
    print("remove \(removeCharacters) on this movie")
}else{
    print("i cant found that guys you just say on this movie")
}
// i cant found that guys you just say on this movie



print((starwarCharacters.contains("Yoda")) ? "i know him!" : "who's that guys?")
print(type(of:(starwarCharacters.contains("Yoda")))) // Bool
// who's that guys?



    // Iterating Over a Set
    // You can iterate over the values in a set with a for-in loop.
// ข้อมูลไม่ถูกเรียงลำดับ
for person in starwarCharacters{
    print("\(person)")
}
/*
Luke Skywalker
Han Solo
Anakin Skywalker
Leia Organa
Padmé Amidala
*/

// ข้อมูลถูกเรียงลำดับ
for person in starwarCharacters.sorted() {
    print("\(person)")
}
/*
Anakin Skywalker
Han Solo
Leia Organa
Luke Skywalker
Padmé Amidala
*/

    // Performing Set Operations
    /*
    
    Use the intersection(_:) method to create a new set with only the values common to both sets.
    Use the symmetricDifference(_:) method to create a new set with values in either set, but not both.
    Use the union(_:) method to create a new set with all of the values in both sets.
    Use the subtracting(_:) method to create a new set with values not in the specified set.

    */

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
oddDigits.intersection(evenDigits).sorted()
// []
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
// [1, 9]
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
// [1, 2, 9]



var starwarPart2AttackOfTheCloneCharacters: Set = [
                                    "Anakin Skywalker", "Luke Skywalker", "Yoda",
                                    "Han Solo", "Rey" , "Chewbacca"
                                    ]
print(starwarPart2AttackOfTheCloneCharacters)
// ["Luke Skywalker", "Han Solo", "Rey", "Anakin Skywalker", "Yoda", "Chewbacca"]

let allCharactersInStarWars = Set(starwarCharacters.union(starwarPart2AttackOfTheCloneCharacters).sorted())
print(type(of:allCharactersInStarWars)) // Set<String>
print(allCharactersInStarWars)
// ["Anakin Skywalker", "Chewbacca", "Han Solo", "Leia Organa", "Luke Skywalker", "Padmé Amidala", "Rey", "Yoda"]

let sameCharactersInStarWars = Set(starwarCharacters.intersection(starwarPart2AttackOfTheCloneCharacters).sorted())
print(type(of:sameCharactersInStarWars)) // Set<String>
print(sameCharactersInStarWars)
// ["Anakin Skywalker", "Han Solo", "Luke Skywalker"]

let newCharactersInStarWars = Set(starwarPart2AttackOfTheCloneCharacters.subtracting(starwarCharacters).sorted())
print(newCharactersInStarWars)
// ["Chewbacca", "Rey", "Yoda"]

let playOnceInStarwars = starwarCharacters.symmetricDifference(starwarPart2AttackOfTheCloneCharacters).sorted()
print(type(of:playOnceInStarwars)) // Array<String>
print(playOnceInStarwars)
// ["Chewbacca", "Leia Organa", "Padmé Amidala", "Rey", "Yoda"]

let playPart1 = Set(allCharactersInStarWars.subtracting(newCharactersInStarWars).sorted())
print(playPart1 == starwarCharacters) // true




    // Set Membership and Equality
    /*
    
    Use the “is equal” operator (==)
        to determine whether two sets contain all of the same values.
    Use the isSubset(of:) method 
        to determine whether all of the values of a set are contained in the specified set.
    Use the isSuperset(of:) method 
        to determine whether a set contains all of the values in a specified set.
    Use the isStrictSubset(of:) or isStrictSuperset(of:) methods 
        to determine whether a set is a subset or superset, but not equal to, a specified set.
    Use the isDisjoint(with:) method 
        to determine whether two sets have no values in common.

    */

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals)
// true
farmAnimals.isSuperset(of: houseAnimals)
// true
farmAnimals.isDisjoint(with: cityAnimals)
// true

print((oddDigits.isSubset(of: 0..<10) && evenDigits.isSubset(of: 0..<10))) // true

print(playPart1)
// ["Luke Skywalker", "Han Solo", "Anakin Skywalker", "Leia Organa", "Padmé Amidala"]
print(allCharactersInStarWars)
// ["Luke Skywalker", "Leia Organa", "Padmé Amidala", "Han Solo", "Rey", "Anakin Skywalker", "Chewbacca", "Yoda"]
print(playPart1.isSubset(of: allCharactersInStarWars)) // true


print(newCharactersInStarWars.isDisjoint(with: playPart1))
// true

print(newCharactersInStarWars.isSubset(of: starwarPart2AttackOfTheCloneCharacters))
// true


//------------------------------------------
// Dictionaries
//------------------------------------------

/*
Dictionary Type Shorthand Syntax

The type of a Swift dictionary is written in full as Dictionary<Key, Value>, where Key is the type of value that can be used as a dictionary key, and Value is the type of value that the dictionary stores for those keys.

Note

A dictionary Key type must conform to the Hashable protocol, like a set’s value type.



Dictionary<Key, Value> where Key : Hashable
*/

    // Creating an Empty Dictionary

var namesOfIntegers: [Int: String] = [:]
// namesOfIntegers is an empty [Int: String] dictionary

print(type(of:namesOfIntegers)) // Dictionary<Int, String>
print(namesOfIntegers) // [:]

namesOfIntegers[16] = "sixteen" // [16: "sixteen"]
print(namesOfIntegers) // [:]
// namesOfIntegers now contains 1 key-value pair

// clear dict
namesOfIntegers = [:]
// namesOfIntegers is once again an empty dictionary of type [Int: String]
print(namesOfIntegers)


var mutableCookies = [
    "Macadamia Nut":0.06,
    "Coconut":0.20,
    "Macaron":0.55
]

let piePrice:[String:Double] = [
   "Apple":3.99,
   "Raspberry":3.35
]

let piPrice:Dictionary<String,Double> = [
    "Apple Mac":1200.00,
    "Raspberry Pi":45.00
]



//------------------------------------------
// Creating a Dictionary with a Dictionary Literal
//------------------------------------------

// var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
// หรือ
var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
print(type(of:(airports))) // Dictionary<String, String>
print(airports) // ["YYZ": "Toronto Pearson", "DUB": "Dublin"]




var emiya: Array = [ 
                    Dictionary <String, String>
                    ] ()
// var emiya: Array = [ 
//                     ["Name": "Emiya"],
//                     ["Surname": "Shirou"]
//                     ]
print(type(of:emiya))
                // Array<Dictionary<String, String>>
print(emiya)
// []

var emiyaName = ["Name" : "Emiya"]
var emiyaSurname = ["Surname" : "Shirou"]

emiya.append(emiyaName)
emiya.append(emiyaSurname)
print(emiya)

// let myBasket: [String: [String]] = [
//                                 "Basket1": ["Watermelon", "Melon"], 
//                                 "Basket2": ["Apple", "Orange"]
//                                 ]    
let myBasket = [
                    "Basket1": ["Watermelon", "Melon"], 
                    "Basket2": ["Apple", "Orange"]
                    ]
print(type(of:myBasket))
                // Dictionary<String, Array<String>>
print(myBasket["Basket1"]![0])
// Watermelon







let iAmTheBoneOfMySword =
"""
I am the bone of my sword
Steel is my body and fire is my blood
I have created over a thousand blades
Unknown to Death,
Nor known to Life.
Have withstood pain to create many weapons
Yet, those hands will never hold anything
So as I pray, Unlimited Blade Works.
"""

var emiya: [String: Any] = [
                            "Name": "Emiya",
                            "HP": 100,
                            "Skills": iAmTheBoneOfMySword
                            ]

var PhoenixWright: [String: Any] = [
                                    "Name": "Phoenix Wright",
                                    "HP": 100,
                                    "Skills": "Objection! \u{1F680}"
                                    ]
print(type(of:emiya)) // Dictionary<String, Any>

//------------------------------------------
// Accessing and Modifying a Dictionary
//------------------------------------------

print("The airports dictionary contains \(airports.count) items.")
// Prints "The airports dictionary contains 2 items."


if emiya.isEmpty{
    print("dictional is empty")
}else{
    print("\(emiya["Name"]!) have \(emiya.count) \( ((emiya.count > 0) ? "Items" : "Item") ) ")
}
// Emiya have 3 Items 


// add values to dictionary
emiya["Luck"] = 0.2
/*
    "Name": "Emiya",
    "HP": 100,
    "Skills": iAmTheBoneOfMySword,
    "Luck": 0.2
*/

// change values in dicional
emiya["Luck"] = 0.1
/*
    "Name": "Emiya",
    "HP": 100,
    "Skills": iAmTheBoneOfMySword,
    "Luck": 0.1
*/


// เนื่องจากการอัพเดทแบบตัวอย่างข้างต้นเข้าถึงได้ง่ายเกินไป จึงมีวิธีการเช็คการอัพเดทให้ระวังมากขึ้นคือ UpdateValue
var findKey = "Luck"
if emiya.keys.contains(findKey){
    if let oldValue = emiya.updateValue(0.3 , forKey: findKey){
        print(type(of:(oldValue))) // Double
        print(oldValue) // 0.1
    }
}else{
    print("not found that Keys in dictionary")
}
print(emiya)
//["HP": 100, "Luck": 0.29999999999999999, "Name": "Emiya", "Skills": "iAmTheBoneOfMySword"]

// เช่นเดียวกัน เวลาจะดึงค่าใน keys จะ return value ออกมาให้ ตอน return อาจจะสำเร็จหรือไม่สำเร็จก็ได้
// ฉะนั้นต้องใช้ if let เข้ามาช่วยเช็คอีกที

if let value = emiya["Luckk"]{
    print(value)
}else{
    print("Not found")
}
// Not found

// และเกิดอยากจะลบด้วยการใส่ nil ซึ่งถ้าเกิดทำบรรทัดนี้โดยไม่ได้ตั้งใจ ข้อมูลดังกล่าวจะหายไปทันที
// emiya["unused"] = nil
emiya["unused"] = "ITEMS"

print(emiya.count) // 5

    // REMOVE
// จึงต้องมีการเช็คก่อนลบด้วย if let
if emiya.keys.contains("unused"){
    if let removedValue = emiya.removeValue(forKey: "unused"){
        print("\(removedValue) has deleted")
    }
}else{
    print("Not Found that key")
}
print(emiya)
// ["HP": 100, "Luck": 0.29999999999999999, "Name": "Emiya", "Skills": "iAmTheBoneOfMySword"]
print(emiya.count) // 4


//------------------------------------------
// Iterating Over a Dictionary
//------------------------------------------

// ดึงข้อมูลทั้ง keys และ values
for (index, item) in emiya{
    print(index, item)
}
/*
HP 100
Luck 0.3
Name Emiya
Skills iAmTheBoneOfMySword
*/

// ดึงเฉพาะ keys
for key in emiya.keys{
    print("Keys : \(key)")
}
/*
Keys : HP
Keys : Luck
Keys : Name
Keys : Skills
*/

// ดึงเฉพาะ values
for key in emiya.values{
    print("Values : \(key)")
}
/*
Values : 100
Values : 0.3
Values : Emiya
Values : iAmTheBoneOfMySword
*/


var lukeOrder = ["Foods" : "Burger"]
print(lukeOrder)
print(lukeOrder.keys.contains("Foods"))

func isHaveValue(keys: String, from dict: [String: String]) -> Bool{
    // check if that values is in dictonary
    guard let values = dict[keys] else{ return false}
    return true
}

print(isHaveValue(keys: "Foods", from: lukeOrder))


// หา values ใน dictionary ที่เป็น Array any
var lukeOrder = [["Foods" : ["Burger", "Pizza"], "Money": 1000]]
print(lukeOrder)
print(type(of:lukeOrder))
// print(lukeOrder.contains("Foods"))

// let myValue = lukeOrder.compactMap { (dict: [String:Any]) in return dict["Money"] }
// let myValue = lukeOrder.compactMap { dict in dict["Money"] }
var myValue = lukeOrder.compactMap { $0 ["Money"] }
print(type(of:(myValue)))
print(myValue)
/*
Array<Any>
[1000]
*/

for item in myValue{
    print(type(of:item))
    print(item)
}
/*
Int
1000
*/

print("-------")
myValue = lukeOrder.map( { ($0["Money"])} )
print(type(of:(myValue)))
print(myValue)
/*
Array<Any>
[Optional(1000)]
*/

for item in myValue{
    print(type(of:item))
    print(item)
}
/*
Optional<Any>
Optional(1000)
*/
print("-------")




    // Convery to Arrays เพื่อให้ได้ข้อมูลที่แยกและเรียงกัน โดยใช้ .sorted() ตอนแปลงเป็น arrays
let arrayEmiyaKeys = [String](emiya.keys)
print(type(of:(arrayEmiyaKeys))) // Array<String>
print(arrayEmiyaKeys)
// ["HP", "Luck", "Name", "Skills"]

let arrayEmiyaValues = [Any](emiya.values)
print(type(of:(arrayEmiyaValues))) // Array<Any>
print(arrayEmiyaValues)
// [100, 0.29999999999999999, "Emiya", "iAmTheBoneOfMySword"]



let keysAndValuesDict: [String: Int] = ["Atk": 10, "Def": 100, "RNG": 1]

// เช็คว่าค่าที่กำลังจะใส่ มี Key อยู่ใน Dictionary แล้วหรือไม่
if (!emiya.isEmpty) {
    for (key, value) in keysAndValuesDict {
        if !emiya.keys.contains(key) {
            emiya[key] = value
        }else{
            print("found that Keys in dictionary")
        }
    }
}else{
    print("Dictionary is empty!")
}

print(emiya)
// ["Luck": 0.29999999999999999, "Atk": 10.0, "HP": 100, "Skills": "iAmTheBoneOfMySword", "Def": 100.0, "Name": "Emiya", "RNG": 0.59999999999999998]

print(PhoenixWright)
// ["Skills": "Objection! 🚀", "": 0, "Name": "Phoenix Wright", "HP": 100]

if (!PhoenixWright.isEmpty) {
    for (key, value) in keysAndValuesDict {
        if !PhoenixWright.keys.contains(key) {
            PhoenixWright[key] = value
        }else{
            print("found that Keys in dictionary")
        }
    }
}else{
    print("Dictionary is empty!")
}

findKey = "Atk"
if PhoenixWright.keys.contains(findKey){
    if let oldValue = PhoenixWright.updateValue(101 , forKey: findKey){
        // print(type(of:(oldValue))) // Int
        print(oldValue) // 10
    }
}else{
    print("not found that Keys in dictionary")
}

print(PhoenixWright)
// ["Atk": 101, "Skills": "Objection! 🚀", "HP": 100, "": 0, "Def": 100.0, "Name": "Phoenix Wright", "RNG": 0.59999999999999998]

let PhoenixATK = PhoenixWright["Atk"] as! Int
print(type(of:PhoenixATK)) // Int
let EmiyaHP = emiya["HP"] as! Int
print(type(of:EmiyaHP)) // Int

// print(type(of:emiya["Def"]!))

if let _ = emiya["HP"] {
    if (PhoenixWright["Atk"] as! Int > emiya["Def"] as! Int)
    && (PhoenixWright["RNG"] as! Int >= emiya["RNG"] as! Int){
        if let oldValue =
        emiya.updateValue(
        (emiya["HP"] as! Int) - (PhoenixWright["Atk"] as! Int),
        forKey: "HP"){
            if (emiya["HP"] as! Int) <= 0 {
                print("Emiya HP = \(emiya["HP"]!)")
                print("Emiya is Dead \u{1F571}")
            }
        }
    }
}
// Emiya HP = -1
// Emiya is Dead 🕱


// Swift’s Dictionary type doesn’t have a defined ordering.
// To iterate over the keys or values of a dictionary in a specific order,
// use the sorted() method on its keys or values property.

