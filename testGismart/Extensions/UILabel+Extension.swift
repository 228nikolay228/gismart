import UIKit

extension UILabel {
    func setupModalWindowShadow(color: UIColor, radius: CGFloat, opacity: Float, offset: CGSize) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offset
        self.layer.masksToBounds = false
    }
}
