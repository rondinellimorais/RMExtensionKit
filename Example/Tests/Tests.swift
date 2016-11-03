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
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
}

// ==============================
// NSDate Test
// ==============================
// MARK: NSDate Test
extension Tests {
    
    private func birthDate() -> NSDate? {
        return NSDate(year: 1987, month: 10, day: 08)
    }
    
    func testIsToday(){
        let now = NSDate()
        XCTAssert( now.isToday, "'now' is not today!")
    }
    
    func testCreateDate() {
        XCTAssert(self.birthDate() != nil, "date created is not valid!")
    }
    
    func testCheckTimeInterval() {
        let birthDateTimeInterval:Int64 = 560660400000
        XCTAssert(birthDateTimeInterval == self.birthDate()!.timeInterval(), "time interval is not valid!")
    }
}