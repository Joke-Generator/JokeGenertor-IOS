

import Foundation
import UIKit

struct Theme {

    static var backgroundColor:UIColor?
    static var buttonTextColor:UIColor?
    static var buttonBackgroundColor:UIColor?

    static public func defaultTheme() {
        self.backgroundColor = UIColor.white
        self.buttonTextColor = UIColor.blue
        self.buttonBackgroundColor = UIColor.white
        updateDisplay()
    }

    static public func darkTheme() {
        self.backgroundColor = UIColor.darkGray
        self.buttonTextColor = UIColor.white
        self.buttonBackgroundColor = UIColor.black
        updateDisplay()
    }

    static public func updateDisplay() {
        let proxyButton = UIButton.appearance()
        proxyButton.setTitleColor(Theme.buttonTextColor, for: .normal)
        proxyButton.backgroundColor = Theme.buttonBackgroundColor

        let proxyView = UIView.appearance()
        proxyView.backgroundColor = backgroundColor
    }
}
