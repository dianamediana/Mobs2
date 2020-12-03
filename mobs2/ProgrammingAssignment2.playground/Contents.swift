
import Foundation

// Part 1

// Given string with format "Student1 - Group1; Student2 - Group2; ..."

// TOGGLE THIS TO SWITCH TASKS
let isFirstTask = false

if isFirstTask {
    let studentsStr = "Бортнік Василь - ІВ-72; Чередніченко Владислав - ІВ-73; Гуменюк Олександр - ІВ-71; Корнійчук Ольга - ІВ-71; Киба Олег - ІВ-72; Капінус Артем - ІВ-73; Овчарова Юстіна - ІВ-72; Науменко Павло - ІВ-73; Трудов Антон - ІВ-71; Музика Олександр - ІВ-71; Давиденко Костянтин - ІВ-73; Андрющенко Данило - ІВ-71; Тимко Андрій - ІВ-72; Феофанов Іван - ІВ-71; Гончар Юрій - ІВ-73"
    
    // Task 1
    // Create dictionary:
    // - key is a group name
    // - value is sorted array with students
    
    var studentsGroups: [String: [String]] = [:]
    
    // Your code begins
    
    if true {
        // using if true blocks in order not to create global variables
        
        let studentAndGroupStrs = studentsStr.components(separatedBy: "; ")
        let pairs = studentAndGroupStrs.map{ $0.components(separatedBy: " - ") }
        
        
        for pair in pairs {
            if studentsGroups[pair[1]] == nil {
                studentsGroups[pair[1]] = [pair[0]]
            } else {
                studentsGroups[pair[1]]!.append(pair[0])
            }
            
        }
        
        let keys = studentsGroups.keys
        
        for key in keys {
            studentsGroups[key]!.sort()
        }
    }
    
    // Your code ends
    
    print(studentsGroups)
    print()
    
    // Given array with expected max points
    
    let points: [Int] = [5, 8, 12, 12, 12, 12, 12, 12, 15]
    
    // Task 2
    // Create dictionary:
    // - key is a group name
    // - value is dictionary:
    //   - key is student
    //   - value is array with points (fill it with random values, use function `randomValue(maxValue: Int) -> Int` )
    
    func randomValue(maxValue: Int) -> Int {
        switch(arc4random_uniform(6)) {
        case 1:
            return Int(ceil(Float(maxValue) * 0.7))
        case 2:
            return Int(ceil(Float(maxValue) * 0.9))
        case 3, 4, 5:
            return maxValue
        default:
            return 0
        }
    }
    
    var studentPoints: [String: [String: [Int]]] = [:]
    
    // Your code begins
    if true {
        
        for groupId in studentsGroups.keys {
            
            studentPoints[groupId] = [:]
            
            for student in studentsGroups[groupId]! {
                
                studentPoints[groupId]![student] = []
                
                for maxPoints in points {
                    
                    studentPoints[groupId]![student]!.append(randomValue(maxValue: maxPoints))
                    
                }
                
            }
        }
    }
    // Your code ends
    
    print(studentPoints)
    print()
    
    // Task 3
    // Create dictionary:
    // - key is a group name
    // - value is dictionary:
    //   - key is student
    //   - value is sum of student's points
    
    var sumPoints: [String: [String: Int]] = [:]
    
    // Your code begins
    if true {
        
        for groupId in studentsGroups.keys {
            
            sumPoints[groupId] = [:]
            
            for (student, marks) in studentPoints[groupId]! {
                
                sumPoints[groupId]![student] = marks.reduce(0, +)
                
            }
        }
    }
    
    
    // Your code ends
    
    print(sumPoints)
    print()
    
    // Task 4
    // Create dictionary:
    // - key is group name
    // - value is average of all students points
    
    var groupAvg: [String: Float] = [:]
    
    // Your code begins
    if true {
        
        for groupId in studentsGroups.keys {
            
            let studentsInGroup = sumPoints[groupId]!.values.count
            
            groupAvg[groupId] = Float(sumPoints[groupId]!.values.reduce(0, +)) / Float(studentsInGroup)
            
        }
        
    }
    
    
    // Your code ends
    
    print(groupAvg)
    print()
    
    // Task 5
    // Create dictionary:
    // - key is group name
    // - value is array of students that have >= 60 points
    
    var passedPerGroup: [String: [String]] = [:]
    
    // Your code begins
    
    if true {
        for groupId in studentsGroups.keys {
            
            passedPerGroup[groupId] = []
            
            for (student, mark) in sumPoints[groupId]! {
                if mark > 60 {
                    passedPerGroup[groupId]?.append(student)
                }
            }
        }
    }
    
    // Your code ends
    
    print(passedPerGroup)
    
    // Example of output. Your results will differ because random is used to fill points.
    //
    //["ІВ-73": ["Гончар Юрій", "Давиденко Костянтин", "Капінус Артем", "Науменко Павло", "Чередніченко Владислав"], "ІВ-72": ["Бортнік Василь", "Киба Олег", "Овчарова Юстіна", "Тимко Андрій"], "ІВ-71": ["Андрющенко Данило", "Гуменюк Олександр", "Корнійчук Ольга", "Музика Олександр", "Трудов Антон", "Феофанов Іван"]]
    //
    //["ІВ-73": ["Давиденко Костянтин": [5, 8, 9, 12, 11, 12, 0, 0, 14], "Капінус Артем": [5, 8, 12, 12, 0, 12, 12, 12, 11], "Науменко Павло": [4, 8, 0, 12, 12, 11, 12, 12, 15], "Чередніченко Владислав": [5, 8, 12, 12, 11, 12, 12, 12, 15], "Гончар Юрій": [5, 6, 0, 12, 0, 11, 12, 11, 14]], "ІВ-71": ["Корнійчук Ольга": [0, 0, 12, 9, 11, 11, 9, 12, 15], "Музика Олександр": [5, 8, 12, 0, 11, 12, 0, 9, 15], "Гуменюк Олександр": [5, 8, 12, 9, 12, 12, 11, 12, 15], "Трудов Антон": [5, 0, 0, 11, 11, 0, 12, 12, 15], "Андрющенко Данило": [5, 6, 0, 12, 12, 12, 0, 9, 15], "Феофанов Іван": [5, 8, 12, 9, 12, 9, 11, 12, 14]], "ІВ-72": ["Киба Олег": [5, 8, 12, 12, 11, 12, 0, 0, 11], "Овчарова Юстіна": [5, 8, 12, 0, 11, 12, 12, 12, 15], "Бортнік Василь": [4, 8, 12, 12, 0, 12, 9, 12, 15], "Тимко Андрій": [0, 8, 11, 0, 12, 12, 9, 12, 15]]]
    //
    //["ІВ-72": ["Бортнік Василь": 84, "Тимко Андрій": 79, "Овчарова Юстіна": 87, "Киба Олег": 71], "ІВ-73": ["Капінус Артем": 84, "Науменко Павло": 86, "Чередніченко Владислав": 99, "Гончар Юрій": 71, "Давиденко Костянтин": 71], "ІВ-71": ["Корнійчук Ольга": 79, "Трудов Антон": 66, "Андрющенко Данило": 71, "Гуменюк Олександр": 96, "Феофанов Іван": 92, "Музика Олександр": 72]]
    //
    //["ІВ-71": 79.333336, "ІВ-72": 80.25, "ІВ-73": 82.2]
    //
    //["ІВ-72": ["Бортнік Василь", "Киба Олег", "Овчарова Юстіна", "Тимко Андрій"], "ІВ-73": ["Давиденко Костянтин", "Капінус Артем", "Чередніченко Владислав", "Гончар Юрій", "Науменко Павло"], "ІВ-71": ["Музика Олександр", "Трудов Антон", "Гуменюк Олександр", "Феофанов Іван", "Андрющенко Данило", "Корнійчук Ольга"]]
}

// Part 2

class CoordinateAB {
    
    enum Direction {
        case latitude
        case longitude
    }
    
    var direction: Direction
    var degree: Int
    var minutes: UInt
    var seconds: UInt
    
    init() {
        self.direction = .latitude
        self.degree = 0
        self.minutes = 0
        self.seconds = 0
    }
    
    convenience init(degree: Int, minutes: UInt, seconds: UInt, direction: Direction) {
        if (0...59).contains(minutes) && (0...59).contains(seconds) {
            
            if  direction == .latitude {
                if (-90...90).contains(degree) {
                    self.init(degree, minutes, seconds, .latitude)
                    
                } else {
                    self.init()
                }
                
            } else if direction == .longitude {
                if (-180...180).contains(degree) {
                    self.init(degree, minutes, seconds, .longitude)
                } else {
                    self.init()
                }
                
            } else {
                
                self.init()
            }
            
        } else {
            
            self.init()
        }
        
    }
    
    private init(_ degree: Int, _ minutes: UInt, _ seconds: UInt, _ direction: Direction) {
        self.direction = direction
        self.degree = degree
        self.minutes = minutes
        self.seconds = seconds
    }
    
}

extension CoordinateAB {
    
    func stringed() -> String {
        return "\(degree)°​​\(minutes)′\(seconds)\" ​" + stringedDirection()
    }
    
    func stringedDecimal() -> String {
        let res = Double(degree * 3600  + Int(minutes) * 60 + Int(seconds)) / 3600
        return String(res) + " " + stringedDirection()
    }
    
    // Додаткова функція, що визначає бкуву напрямку
    func stringedDirection() -> String {
        switch direction {
        case .latitude:
            return degree >= 0 ? "N" : "S"
        case .longitude:
            return degree >= 0 ? "E" : "W"
        }
    }
    
    
    
    func midCoordinate(to coordinate: CoordinateAB) -> CoordinateAB? {
        guard self.direction == coordinate.direction else {
            return nil
        }
        let midDeg = (self.degree + coordinate.degree) / 2
        let midMin = (self.minutes + coordinate.minutes) / 2
        let midSec = (self.seconds + coordinate.seconds) / 2
        return CoordinateAB(degree: midDeg, minutes: midMin, seconds: midSec, direction: self.direction)
    }
    
    class func mid(from startingCooedinate: CoordinateAB, to endCoordinate: CoordinateAB) -> CoordinateAB? {
        return startingCooedinate.midCoordinate(to: endCoordinate)
    }
    
}


if !isFirstTask {
    let firstCoordinate = CoordinateAB()
    print(firstCoordinate.stringed(), firstCoordinate.stringedDecimal())
    print()
    
    let secondCoordinate = CoordinateAB(degree: 999999, minutes: 00, seconds: 99999, direction: .latitude)
    print(secondCoordinate.stringed(), secondCoordinate.stringedDecimal())
    print()
    
    let thirdCoordinate = CoordinateAB(degree: 60, minutes: 30, seconds: 20, direction: .latitude)
    print(thirdCoordinate.stringed(), thirdCoordinate.stringedDecimal())
    print()
    
    let fourthCoordinate = CoordinateAB(degree: 179, minutes: 50, seconds: 21, direction: .longitude)
    print(fourthCoordinate.stringed(), fourthCoordinate.stringedDecimal())
    print()
    
    print(CoordinateAB.mid(from: thirdCoordinate, to: fourthCoordinate)?.stringed() as Any)
    print()
    
    let fifthCoordinate = CoordinateAB(degree: -109, minutes: 50, seconds: 21, direction: .longitude)
    print(fifthCoordinate.stringed(), fifthCoordinate.stringedDecimal())
    print()
    
    print(CoordinateAB.mid(from: fourthCoordinate, to: fifthCoordinate)?.stringed() as Any)
    print()
}

