import UIKit

class VGradient:UIView
{
    private static let kLocationTop:NSNumber = 0
    private static let kLocationBottom:NSNumber = 1
    
    class func diagonal(colorLeftBottom:UIColor, colorTopRight:UIColor) -> VGradient
    {
        let colors:[CGColor] = [
            colorLeftBottom.cgColor,
            colorTopRight.cgColor]
        let locations:[NSNumber] = [
            kLocationTop,
            kLocationBottom]
        let startPoint:CGPoint = CGPoint(x:0, y:1)
        let endPoint:CGPoint = CGPoint(x:1, y:0)
        
        let gradient:VGradient = VGradient(
            colors:colors,
            locations:locations,
            startPoint:startPoint,
            endPoint:endPoint)
        
        return gradient
    }
    
    private init(
        colors:[CGColor],
        locations:[NSNumber],
        startPoint:CGPoint,
        endPoint:CGPoint)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = false
        
        guard
            
            let gradientLayer:CAGradientLayer = self.layer as? CAGradientLayer
            
        else
        {
            return
        }
    
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        gradientLayer.locations = locations
        gradientLayer.colors = colors
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override open class var layerClass:AnyClass
    {
        get
        {
            return CAGradientLayer.self
        }
    }
}
