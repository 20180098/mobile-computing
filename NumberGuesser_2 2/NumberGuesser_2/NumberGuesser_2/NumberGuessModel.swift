import Foundation
import UIKit

class NumberGuessModel {
    
    var target = 0
    var guessCount = 0
    
    func compare(to: Int) -> Int {
        return target - to
    }
    
    func isValid(string: String?) -> Bool {
        var isValid = false
        if let str = string, let guess = Int(str) {
            if guess >= 1 && guess <= 99 {
                isValid = true
            }
        }
        return isValid
    }
    
    func getImage() -> String {
        var picture: String = ""
        
        if (guessCount < 6) {
            picture = "normal"
        } else if (guessCount < 10) {
            picture = "1f974"
        } else {
            picture = "1200px-Noto_Emoji_Pie_1f4a9"
        }
        return picture
    }
    
}
