import UIKit

class CCreate:Controller<VCreate>
{
    let model:MCreate
    
    override init()
    {
        model = MCreate()
        super.init()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: public
    
    func refreshFrame()
    {
        UIApplication.shared.keyWindow!.endEditing(true)
        
        guard
        
            let view:VCreate = self.view as? VCreate
        
        else
        {
            return
        }
        
        view.collectionView.reloadData()
    }
    
    func cancel()
    {
        guard
        
            let parent:ControllerParent = self.parent as? ControllerParent
        
        else
        {
            return
        }
        
        parent.pop(horizontal:ControllerParent.Horizontal.right)
    }
    
    func done()
    {
        
    }
    
    func addFrame()
    {
        model.addFrame()
    }
}
