//
//  main.swift
//  FirstCourseSecondTask
//
//  Copyright © 2017 E-Legion. All rights reserved.
//

import Foundation
import FirstCourseSecondTaskChecker


let checker = Checker()

func firstFunction(mixedArray: [Int]) -> (Int, Int) {
    
    var numbersCount: (evenNumbers: Int, oddNumbers: Int) = (evenNumbers: 0, oddNumbers: 0)
    
    for element in mixedArray {
        if element%2 == 0 {
            numbersCount.evenNumbers += 1
        } else { numbersCount.oddNumbers += 1 }
            
    }
    return numbersCount
}

checker.checkFirstFunction(function: firstFunction(mixedArray:))

func secondFunction(arrayCircles: [Checker.Circle]) -> [Checker.Circle] {

    var notRedCircles: [Checker.Circle] = []
    var blueCircles: [Checker.Circle] = []
    var whiteCircles: [Checker.Circle] = []
    var circlesOrdered: [Checker.Circle] = []
    
    for var circle in arrayCircles {
        switch circle.color {
          case .black:
            circle.radius = circle.radius * 2
            notRedCircles.append(circle)
          case .red:
            continue
          case .green:
            circle.color = .blue
            blueCircles.append(circle)
          case .white:
            whiteCircles.append(circle)
          case .blue:
            blueCircles.append(circle)
            }
    }
    
    circlesOrdered = whiteCircles + notRedCircles + blueCircles
    
    return  circlesOrdered
}
checker.checkSecondFunction(function: secondFunction(arrayCircles:))

func thirdFunction(employeesArray: [Checker.EmployeeData]) -> [Checker.Employee] {
    
    var employesStructs: [Checker.Employee] = []
    let formatChecker = ["fullName": "", "salary": "", "company": ""]
    
    for employee in employeesArray {
        if employee.keys == formatChecker.keys {
            if let name = employee["fullName"],
               let sal = employee["salary"],
               let com = employee["company"] {
            let employee1 = Checker.Employee(fullName: name, salary: sal, company: com)
            employesStructs.append(employee1)
        }
     }
    }
    return employesStructs
}

checker.checkThirdFunction(function: thirdFunction(employeesArray:))

func forthFunctionT(names: [String]) -> [String : [String]] {
    
    var nameGroupsSorted: [String : [String]] = [:]
    
    for name in names {
        var group: [String] = []
        group.append(name)
        if nameGroupsSorted.keys.contains(String(name.first!)) {
            nameGroupsSorted[String(name.first!)] = nameGroupsSorted[String(name.first!)]! + group
        } else {
        nameGroupsSorted.updateValue(group, forKey: String(name.first!))
        }
    }
    
    for (key, names) in nameGroupsSorted {
        if names.count < 2 {
            nameGroupsSorted.removeValue(forKey: key)
        } else {
            nameGroupsSorted.updateValue(names.sorted(by: >) , forKey: key)
        }
    }
    return nameGroupsSorted
}

checker.checkFourthFunction(function: forthFunctionT(names:))
