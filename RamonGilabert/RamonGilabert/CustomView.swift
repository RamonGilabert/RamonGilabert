import UIKit

class CustomView: UIView {

	var ovalShape = CAShapeLayer()
    var arcWidth = 0 as CGFloat
    var arcEnd = 0 as CGFloat
    var arcColor = UIColor.clearColor()

    // MARK: Initializers

    override func drawRect(rect: CGRect) {
        self.clipsToBounds = true
        self.transform = CGAffineTransformMakeRotation(-3.14/2)
        setupLayers()
    }

    // MARK: Layout methods
	
	func setupLayers() {
		self.ovalShape = CAShapeLayer()
		self.ovalShape.lineCap = kCALineCapRound
		self.ovalShape.strokeColor = self.arcColor.CGColor
        self.ovalShape.fillColor = UIColor.clearColor().CGColor
		self.ovalShape.lineWidth = self.arcWidth
		self.ovalShape.path = ovalPath().CGPath;
		self.layer.addSublayer(self.ovalShape)
        startAllAnimations()
	}

    // MARK: Animation methods
	
    func startAllAnimations() {
        self.ovalShape.addAnimation(ovalAnimation(), forKey:"ovalAnimation")
	}
	
    func ovalAnimation() -> CABasicAnimation {
		var strokeStartAnimation = CABasicAnimation(keyPath:"strokeEnd")
		strokeStartAnimation.fromValue = 0
		strokeStartAnimation.toValue = self.arcEnd
		strokeStartAnimation.duration = 1.2
		strokeStartAnimation.fillMode = kCAFillModeForwards
		strokeStartAnimation.removedOnCompletion = false

		return strokeStartAnimation;
	}
	
	// MARK: Bezier Path
	
	func ovalPath() -> UIBezierPath {
        var ovalPath = UIBezierPath(ovalInRect: CGRectMake(self.arcWidth, self.arcWidth, self.frame.width - self.arcWidth*2, self.frame.height - self.arcWidth*2))

        return ovalPath;
	}
}
