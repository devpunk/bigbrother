import UIKit

class VCreate:View
{
    private let kBarHeight:CGFloat = 120
    
    required init(controller:UIViewController)
    {
        super.init(controller:controller)
        
        guard
            
            let cCreate:CCreate = controller as? CCreate
        
        else
        {
            return
        }
        
        let viewBar:VCreateBar = VCreateBar(controller:cCreate)
        
        addSubview(viewBar)
        
        NSLayoutConstraint.bottomToBottom(
            view:viewBar,
            toView:self)
        NSLayoutConstraint.height(
            view:viewBar,
            constant:kBarHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBar,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
