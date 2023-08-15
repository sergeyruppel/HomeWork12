import Foundation

/*:
 ## Упражнение - приведение типов и их контроль
 
 Создайте коллекцию типа [Any], включающую несколько вещественных чисел, целых, строк и булевых значений.  Распечатайте содержимое коллекции.
 */

let anyArray: [Any] = [23, true, 3.14, 42, "hello", false, 1.23, "world", Float(33.44)]

//for element in anyArray {
//    print(element)
//}

/*:
 Пройдите по всем элементам коллекции.  Для каждого целого, напечайте "Целое число " и его значение.  Повторите то же самое для вещественных чисел, строк и булевых значений.
 */

//for element in anyArray {
//    switch element {
//        case let value as Int:
//            print("Int: \(value)")
//        case let value as Float:
//            print("Float: \(value)")
//        case let value as Double:
//            print("Double: \(value)")
//        case let value as String:
//            print("String: \(value)")
//        case let value as Bool:
//            print("Bool: \(value)")
//        default:
//            print("Unknown value of element")
//    }
//}

/*:
 Создайте словарь [String : Any], где все значения — это смесь вещественных и целых чисел, строк и булевых значений.  Выведите крассиво на консоль пары ключ/значения для всех элементов коллекции.
 */

let anyDict: [String: Any] = ["integerValueOne": 42,
                              "doubleValueOne": 3.14,
                              "stringValueOne": "hello",
                              "boolValueOne": true,
                              "integerValueTwo": 17,
                              "stringValueTwo": "world",
                              "stringValueThree": "99",
                              "boolValueTwo": false,
                              "doubleValueTwo": 21.02,
                              "characterValue": Character("X")]

//for (key, value) in anyDict {
//    switch value {
//        case let value as Int:
//            print("\(key): \(value)")
//        case let value as Float:
//            print("\(key): \(value)")
//        case let value as Double:
//            print("\(key): \(value)")
//        case let value as String:
//            print("\(key): \(value)")
//        case let value as Bool:
//            print("\(key): \(value)")
//        default:
//            print("\(key): unknown value")
//    }
//}
/*:
 Создайте переменную `total` типа `Double`, равную 0.  Переберите все значения словаря, и добавьте значение каждого целого и вещественного числа к значению вашей переменной.  Для каждой строки добавьте 1.  Для каждого булева значения, добавьте 2, в случае, если значение равно `true`, либо вычтите 3, если оно `false`.  Напечатайте значение `total`.
 */

var total = Double(0.0)

//for (_, value) in anyDict {
//    if let intValue = value as? Int {
//        total += Double(intValue)
//    } else if let doubleValue = value as? Double {
//        total += doubleValue
//    } else if let stringValue = value as? String {
//        total += 1.0
//    } else if let boolValue = value as? Bool {
//        total += boolValue ? 2.0 : -3.0
//    }
//}

//print("Total: \(total)")
/*:
 Обнулите переменную `total` и снова пройдите по всей коллекции, прибавляя к ней все целые и вещественные числа.  Для каждой строки, встретившейся на пути, попробуйте сконвертировать её в число, и добавьте это значение к общему.  Игнорируйте булевы значения.  Распечатайте итог.
 */

//total = 0.0

//for (_, value) in anyDict {
//    if let intValue = value as? Int {
//        total += Double(intValue)
//    } else if let doubleValue = value as? Double {
//        total += doubleValue
//    } else if let stringValue = value as? String {
//        if let number = Double(stringValue) { total += number }
//    }
//}

//print("Total: \(total)")


struct AnyConverter {
    
    private var total = Double(0.0)
    
    func printAnyArray(_ anyArray: [Any]) {
        for element in anyArray {
            switch element {
                case let value as Int:
                    print("Int: \(value)")
                case let value as Float:
                    print("Float: \(value)")
                case let value as Double:
                    print("Double: \(value)")
                case let value as String:
                    print("String: \(value)")
                case let value as Bool:
                    print("Bool: \(value)")
                default:
                    print("Unknown value of element")
            }
        }
    }
    
    func printAnyDict(_ anyDict: [String: Any]) {
        for (key, value) in anyDict {
            switch value {
                case let value as Int:
                    print("\(key): \(value)")
                case let value as Float:
                    print("\(key): \(value)")
                case let value as Double:
                    print("\(key): \(value)")
                case let value as String:
                    print("\(key): \(value)")
                case let value as Bool:
                    print("\(key): \(value)")
                default:
                    print("\(key): unknown value")
            }
        }
    }
    
    mutating func convertToDoubleValues(_ anyDict: [String: Any]) {
        for (_, value) in anyDict {
            if let intValue = value as? Int {
                self.total += Double(intValue)
            } else if let doubleValue = value as? Double {
                self.total += doubleValue
            } else if let stringValue = value as? String {
                self.total += 1.0
            } else if let boolValue = value as? Bool {
                self.total += boolValue ? 2.0 : -3.0
            }
        }
        print("Total: \(self.total)")
    }
    
    mutating func sumDoubleValues(_ anyDict: [String: Any]) {
        self.total = 0.0
        for (_, value) in anyDict {
            if let intValue = value as? Int {
                self.total += Double(intValue)
            } else if let doubleValue = value as? Double {
                self.total += doubleValue
            } else if let stringValue = value as? String {
                if let number = Double(stringValue) { self.total += number }
            }
        }
        print("Total: \(self.total)")
    }
}

var anyConverter = AnyConverter()

anyConverter.printAnyArray(anyArray)
anyConverter.printAnyDict(anyDict)
anyConverter.convertToDoubleValues(anyDict)
anyConverter.sumDoubleValues(anyDict)
