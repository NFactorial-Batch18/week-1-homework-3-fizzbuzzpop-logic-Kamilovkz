//
//  main.swift
//  homework3
//
//  Created by Nail Kamilov on 01.05.2022.
//

import Foundation

protocol Rules {
    func solve() -> String
}

// Main illuastration of program
struct gameMassive: Rules {
    var elements: [Rules]
    func solve() -> String {
        return elements.map { $0.solve() }.joined(separator: "")
    }
}

//Checking number
struct Number: Rules {
    //let input = readLine()
    var number: Int
    init(_ number: Int) {
        self.number = number
    }
    func solve() -> String {
        if (number % 3 == 0 && number % 5 == 0) {
            return "fizz buzz - \(String(number))"
        } else if (number % 3 == 0 && number % 7 == 0){
            return "fizz pop - \(String(number))"
        } else if (number % 3 == 0) {
            return "fizz - \(String(number))"
        } else if (number % 5 == 0) {
            return "buzz - \(String(number))"
        } else if (number % 7 == 0) {
            return "pop - \(String(number))"
        } else {
            return "Just usual number, Broooo:)"
        }
    }
}

//Create resultBuilder Go --> 78 line
@resultBuilder struct gameMassiveBuilder {
    static func buildBlock(_ components: Rules...) -> Rules {
        return gameMassive(elements: components)
    }
    static func buildEither(first: Rules) -> Rules {
        return first
    }
    static func buildEither(second: Rules) -> Rules {
        return second
    }
}

func solve(@gameMassiveBuilder elements: () -> Rules) -> Rules {
    return elements()
}

func makeGame(for name: String? = nil) -> Rules {
    let solving = solve { Number(22) }
    return solving
}

//Entering numbers....
print("Enter number: ")

if let enterNumb = Int(readLine() ?? "") {
    print(Number(enterNumb).solve())
}

//Additional information

//without @result builder it look's like below
//let manualNumber = gameMassive(elements: [
//    Number(15), Space()])
//print(manualNumber.solve())
