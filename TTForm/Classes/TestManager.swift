
import Foundation

open class TestManager: NSObject {
    func testPrint(text:String) {
        print("test print ! - \(text)")
    }
}

public enum TTFormStyle {
    case normal
    case animation1WhenInput
    case none
}
