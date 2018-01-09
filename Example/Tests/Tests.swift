import UIKit
import XCTest
import RMExtensionKit

class Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure() {
            // Put the code you want to measure the time of here.
        }
    }
}

// ==============================
// NSDate Test
// ==============================
// MARK: NSDate Test
extension Tests {
    
    fileprivate func birthDate() -> Date? {
        return Date(year: 1987, month: 10, day: 08)
    }
    
    func testIsToday(){
        let now = Date()
        XCTAssert( now.isToday, "'now' is not today!")
    }
    
    func testCreateDate() {
        XCTAssert(self.birthDate() != nil, "date created is not valid!")
    }
    
    func testCheckTimeInterval() {
        let birthDateTimeInterval:Int64 = 560660400000
        XCTAssert(birthDateTimeInterval == self.birthDate()!.timeInterval(), "time interval is not valid!")
    }
    
    func testCustomFormatters() {
        
        var now = Date()
        
        /* Formatters */
        
        // EEEE, MMMM d, yyyy
        print("\(now.weekDayString), \(now.monthString) \(now.day), \(now.year)")
        
        // MM/dd/yyyy
        print("\(now.month)/\(now.day)/\(now.year)")
        
        
        
        
        /* change Locale */
        now.locale = Locale(identifier: "pt-BR")
        
        print("\(now.weekDayString), \(now.day) de \(now.monthString) de \(now.year)")
    }
}

// ==============================
// String Test
// ==============================
// MARK: String Test
extension Tests {
    
    func testArrayString(){
        let name:String = "Rondinelli Morais"
        
        let array = name.toArray()
        
        XCTAssert(array != nil, "Array String is not valid")
        
        XCTAssert(name.toArray()?.count == 17, "Array String not contains a valid length")
    }
    
    func testStringRegex(){
        let email:String = "rondinellimorais@gmail.com"
        
        let emailRegex = "^([\\w-]+(?:\\.[\\w-]+)*)@((?:[\\w-]+\\.)*\\w[\\w-]{0,66})\\.([a-z]{2,6}(?:\\.[a-z]{2})?)$"
        
        XCTAssert(email.test(emailRegex), "String regex is not working!")
    }
    
    func testStringTrunc(){
        
        let name:String = "Rondinelli"
        
        let trunced = name.trunc(4)

        XCTAssert(trunced == "Rond", "String trunc is not working!")
    }
}















