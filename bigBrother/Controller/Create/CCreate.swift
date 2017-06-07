import UIKit
import ReplayKit

class CCreate:Controller<VCreate>
{
    override init()
    {
        super.init()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: public
    
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
    
    func startRecording()
    {
        RPScreenRecorder.shared().startRecording
        { [weak self] (error:Error?) in
        
            if let error:Error = error
            {
                print("error")
                print(error)
            }
        }
    }
}
