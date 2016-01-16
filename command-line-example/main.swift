//
//  main.swift
//  reducing-radicals
//
//  Created by Maxym Dubczak on 2015-12-16.
//  Copyright © 2015 Royal St. George's College. All rights reserved.
//

//imprts platform
import Foundation

//counter variable to find factors of inputed number
var counter = Float(0.00)

//prints "welcome line"
print("What radical would you like to reduce?")

//allows space for input
print("√", terminator:"")

//reads inputed line as a string
var inputString = readLine(stripNewline: true)

//converts input to an Int
var inputNumber: Float = NSString(string: inputString!).floatValue

//creates array of factors
var factorCounts = [Int]()

//array of numbers that are square rooted out of the radical
var outsideNumber = [Int]()

//final number outside of radical
var outsideFinal = 1

//array of factors that are left inside the radical
var insideNumber = [Int]()

//final number inside the radical
var insideFinal = 1

// prints error line if non-number is inputed
if (inputNumber == 0.0){
    print("Sorry this isn't factorable")
    exit(0)
}

//prints a "statement of clarification"
print("\nOK reducing √\(Int(inputNumber))")

//breaks down number into factors
while (counter <= sqrt(inputNumber)) {
    
    //checks if the counter divides perfectly into large number
    if (inputNumber%counter == 0 && counter > 1) {
        
        //divides out counter
        inputNumber = inputNumber/counter
        
        //adds number to factor array
        factorCounts += [Int(counter)]
        
        //resets counter
        counter = 0
    }
    
    //adds one to counter
    ++counter
}

//adds remaining factor to factor array
factorCounts += [Int(inputNumber)]

//creates a dictionary to count how many times each factor appears
var factorDictionary: [Int:Int] = [:]

//itterates over elements in the array
for factors in factorCounts {
    
    //checks if the factor doesn't already exist in the dictionary
    if factorDictionary[factors] == nil {
        
        //adds count to the dictionary value
        factorDictionary[factors] = 1
        
        //if the count of the factor is at 0
    } else if(factorDictionary[factors] == 0){
        
        //already in dictionary
        //adding one into current count
        factorDictionary[factors]! = factorDictionary[factors]! + 1
        
        //if there is exactly on value in the dictionary index
        //already in dictionary
    }else if(factorDictionary[factors] == 1){
        
        //adding the factor to an array of numbers that have been factored out of the radical
        outsideNumber.append(factors)
        
        //sets the count for the factor at 0
        factorDictionary[factors]! = factorDictionary[factors]! - 1
        
    }
}

//mutiplies together the factors in the outsideNumber array
for number in outsideNumber {
    outsideFinal = outsideFinal * number
}

//adds the remaining facotrs inside the radical into an array
for factors in factorCounts {
    if factorDictionary[factors] == 1 {
        
        //adding value to the array
        insideNumber.append(factors)
    }
}

//multiplies together the factors in the insideNumber array
for number in insideNumber {
    insideFinal = insideFinal * number
}

//checks whether to print the outside number, the inside number, or both (if they're not == 1)
if (insideFinal > 1 && outsideFinal > 1){
    print("Factors down to \(outsideFinal)√\(insideFinal)")
} else if insideFinal == 1 {
    print("Factors down to \(outsideFinal)")
} else {
    print("Factors down to √\(insideFinal)")
}

