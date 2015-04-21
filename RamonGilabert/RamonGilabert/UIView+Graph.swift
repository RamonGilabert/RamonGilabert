import UIKit

class UIView_Graph: UIView {
    
    var endArc = 0 as CGFloat
    var arcWidth = 0 as CGFloat
    var arcColor = UIColor()
    var initialRect = CGRect()

    // MARK: Initializers

    override func drawRect(rect: CGRect) {

        let fullCircle = 2 * CGFloat(M_PI)
        let start: CGFloat = -0.25 * fullCircle
        let end: CGFloat = self.endArc * fullCircle + start
        let centerPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect))
        let radius = (CGRectGetWidth(rect) - self.arcWidth) / 2 as CGFloat
        let context = UIGraphicsGetCurrentContext()

        self.initialRect = rect

        CGContextSetLineWidth(context, self.arcWidth)
        CGContextSetLineCap(context, kCGLineCapRound)

        CGContextSetStrokeColorWithColor(context, self.arcColor.CGColor)
        CGContextSetLineWidth(context, self.arcWidth * 0.8 )

        CGContextAddArc(context, centerPoint.x, centerPoint.y, radius, start, end, 0)
        CGContextStrokePath(context)
    }

    // MARK: Helper methods

    func setArcEnd(endValue: CGFloat) {
        let fullCircle = 2 * CGFloat(M_PI)
        let start: CGFloat = -0.25 * fullCircle
        let end: CGFloat = self.endArc * fullCircle + start
        let centerPoint = CGPointMake(CGRectGetMidX(self.initialRect), CGRectGetMidY(self.initialRect))
        let radius = (CGRectGetWidth(self.initialRect) - self.arcWidth) / 2 as CGFloat
        let context = UIGraphicsGetCurrentContext()

        CGContextSetLineWidth(context, self.arcWidth)
        CGContextSetLineCap(context, kCGLineCapRound)

        CGContextSetStrokeColorWithColor(context, self.arcColor.CGColor)
        CGContextSetLineWidth(context, self.arcWidth * 0.8 )

        CGContextAddArc(context, centerPoint.x, centerPoint.y, radius, start, end, 0)
        CGContextStrokePath(context)
    }
}
