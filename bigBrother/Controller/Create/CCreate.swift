import UIKit
import ReplayKit

class CCreate:Controller<VCreate>, RPPreviewViewControllerDelegate, RPScreenRecorderDelegate
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
