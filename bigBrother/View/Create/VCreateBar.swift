import UIKit

class VCreateBar:UIView
{
    private weak var controller:CCreate!
    private let kStartSize:CGFloat = 60
    
    init(controller:CCreate)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let buttonStart:UIButton = UIButton()
        buttonStart.translatesAutoresizingMaskIntoConstraints = false
        buttonStart.clipsToBounds = true
        buttonStart.backgroundColor = UIColor.black
        buttonStart.addTarget(
            self,
            action:#selector(actionStart(sender:)),
            for:UIControlEvents.touchUpInside)
        
        addSubview(buttonStart)
        
        NSLayoutConstraint.topToTop(
            view:buttonStart,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:buttonStart,
            toView:self)
        NSLayoutConstraint.size(
            view:buttonStart,
            constant:kStartSize)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: actions
    
    func actionStart(sender button:UIButton)
    {
        controller.startRecording()
    }
}
