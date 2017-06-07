import UIKit
import ReplayKit

class CCreate:Controller<VCreate>, RPPreviewViewControllerDelegate, RPScreenRecorderDelegate
{
    private weak var timer:Timer?
    
    override init()
    {
        super.init()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: actions
    
    func actionTimer(sender timer:Timer)
    {
        print("\(Date().timeIntervalSince1970)")
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
        RPScreenRecorder.shared().delegate = self
        
        if RPScreenRecorder.shared().isRecording
        {
            print("is recording")
            
            RPScreenRecorder.shared().discardRecording
            {
                print("recording discarded")
            }
        }
        
        RPScreenRecorder.shared().startRecording
        { (error:Error?) in
        
            if let error:Error = error
            {
                print("error")
                print(error)
            }
            else
            {
                print("start no error")
                self.timer = Timer.scheduledTimer(
                    timeInterval:1,
                    target:self,
                    selector:#selector(self.actionTimer(sender:)),
                    userInfo:nil,
                    repeats:true)
            }
        }
    }
    
    func stopRecording()
    {
        timer?.invalidate()
        
        RPScreenRecorder.shared().stopRecording
        { [weak self] (preview:RPPreviewViewController?, error:Error?) in
            
            if let error:Error = error
            {
                print("error: \(error)")
            }
            else
            {
                print("stop no error")
            }
            
            if let preview:RPPreviewViewController = preview
            {
                preview.previewControllerDelegate = self
                self?.present(preview, animated:true, completion:nil)
            }
            else
            {
                print("no preview")
            }
        }
    }
    
    //MARK: preview delegate
    
    func previewControllerDidFinish(_ previewController: RPPreviewViewController)
    {
        self.dismiss(animated:true, completion:nil)
    }
    
    func previewController(_ previewController: RPPreviewViewController, didFinishWithActivityTypes activityTypes: Set<String>)
    {
        print("asd")
    }
    
    //MARK: recorder delegate
    
    func screenRecorderDidChangeAvailability(_ screenRecorder: RPScreenRecorder)
    {
        print("available: \(screenRecorder.isAvailable)")
    }
    
    func screenRecorder(_ screenRecorder: RPScreenRecorder, didStopRecordingWithError error: Error, previewViewController: RPPreviewViewController?)
    {
        print("did stop recording")
    }
}
