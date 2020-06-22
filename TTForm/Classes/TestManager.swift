
import Foundation

class TestManager: NSObject {
    func testPrint(text:String) {
        print("test print ! - \(text)")
    }
}

enum TTFormStyle {
    case normal
    case animation1WhenInput
    case none
}
