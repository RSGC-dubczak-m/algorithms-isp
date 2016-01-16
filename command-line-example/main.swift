//
//  main.swift
//  reducing-radicals
//
//  Created by Maxym Dubczak on 2015-12-16.
//  Copyright © 2015 Royal St. George's College. All rights reserved.
//

import Foundation

var counter = Float(0.00)

print("What radical would you like to reduce?")

print("√", terminator:"")

var inputString = readLine(stripNewline: true)

var inputNumber: Float = NSString(string: inputString!).floatValue

var factorCounts = [Int]()

var outsideNumber = [Int]()

var outsideFinal = 1

var insideNumber = [Int]()

var insideFinal = 1

if (inputNumber == 0.0){
    print("Sorry this isn't factorable")
    exit(0)
}

print("\nOK reducing √\(Int(inputNumber))")


while (counter <= sqrt(inputNumber)) {
    
    if (inputNumber%counter == 0 && counter > 1) {
        inputNumber = inputNumber/counter
        factorCounts += [Int(counter)]
        counter = 0
    }
    ++counter
}
factorCounts += [Int(inputNumber)]
print(factorCounts)

var factorDictionary: [Int:Int] = [:]

for factors in factorCounts {
    if factorDictionary[factors] == nil {
        
        factorDictionary[factors] = 1 //first time


    } else if(factorDictionary[factors] == 0){
        //already in dictionary
        //adding one into current count

        factorDictionary[factors]! = factorDictionary[factors]! + 1
    }else if(factorDictionary[factors] == 1){
        //already in dictionary
        //adding one into current count
        outsideNumber.append(factors)

        factorDictionary[factors]! = factorDictionary[factors]! - 1

    }
}
for number in outsideNumber {
    outsideFinal = outsideFinal * number
}

for factors in factorCounts {
    if factorDictionary[factors] == 1 {
        insideNumber.append(factors)
    }
}

for number in insideNumber {
    insideFinal = insideFinal * number
}

//print(outsideNumber)
//print(outsideFinal)
//print(factorDictionary)

print("Factors down to \(outsideFinal)√\(insideFinal)")
/*
for count in factorCounts{
if (factorDictionary[count]!%2 == 0 && factorDictionary[count] > 0){

factorDictionary[count] = factorDictionary[count]! - 2

//var outsideNumber = [Int](factorDictionary.keys)
//print(outsideNumber)
print(factorDictionary[count])
}
}
*/
