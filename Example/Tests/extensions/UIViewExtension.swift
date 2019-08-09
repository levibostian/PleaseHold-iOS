import Foundation
import UIKit

extension UIView {
    var autoLayoutConfigured: Bool {
        return translatesAutoresizingMaskIntoConstraints == false
    }
}
