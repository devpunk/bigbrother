import UIKit
import ReplayKit

class CCreate:Controller<VCreate>, RPPreviewViewControllerDelegate
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
            else
            {
                print("start no error")
            }
        }
    }
    
    func stopRecording()
    {
        let rpPreview:RPPreviewViewController = RPPreviewViewController()
        rpPreview.previewControllerDelegate = self
        
        RPScreenRecorder.shared().stopRecording( handler: { previewViewController, error in
            if let error = error {
                print("\(error.localizedDescription)")
            }
            /*
            if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad {
                rpPreview.modalPresentationStyle = UIModalPresentationStyle.popover
                rpPreview.popoverPresentationController?.sourceRect = CGRect.zero
                rpPreview.popoverPresentationController?.sourceView = self.view
            }*/
            self.present(rpPreview, animated: true, completion: nil)
        })
    }
}
