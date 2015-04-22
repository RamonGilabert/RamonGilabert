import UIKit

class CustomView: UIView {

	var ovalShape = CAShapeLayer()
    var arcWidth = 0 as CGFloat
    var arcEnd = 0 as CGFloat
    var arcColor = UIColor.clearColor()

    // MARK: Initializers

    override func drawRect(rect: CGRect) {
        setupLayers()
    }

    // MARK: Layout methods
	
	func setupLayers() {
		self.ovalShape = CAShapeLayer()
		self.ovalShape.frame = CGRectMake(15, 15, 120, 120)
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
		var strokeStartAnimation = CABasicAnimation(keyPath:"strokeStart")
		strokeStartAnimation.fromValue = 1
		strokeStartAnimation.toValue = 1 - self.arcEnd
		strokeStartAnimation.duration = 1.2
		strokeStartAnimation.fillMode = kCAFillModeForwards
		strokeStartAnimation.removedOnCompletion = false

		return strokeStartAnimation;
	}
	
	// MARK: Bezier Path
	
	func ovalPath() -> UIBezierPath {
		var ovalPath = UIBezierPath()
		ovalPath.moveToPoint(CGPointMake(60, 0))
		ovalPath.addCurveToPoint(CGPointMake(60, 0), controlPoint1:CGPointMake(60, 0), controlPoint2:CGPointMake(60, 0))
		ovalPath.addCurveToPoint(CGPointMake(0, 60), controlPoint1:CGPointMake(26.863, 0), controlPoint2:CGPointMake(0, 26.863))
		ovalPath.addCurveToPoint(CGPointMake(60, 120), controlPoint1:CGPointMake(0, 93.137), controlPoint2:CGPointMake(26.863, 120))
		ovalPath.addCurveToPoint(CGPointMake(120, 60), controlPoint1:CGPointMake(93.137, 120), controlPoint2:CGPointMake(120, 93.137))
		ovalPath.addCurveToPoint(CGPointMake(60, 0), controlPoint1:CGPointMake(120, 26.863), controlPoint2:CGPointMake(93.137, 0))
		
		return ovalPath;
	}
}
