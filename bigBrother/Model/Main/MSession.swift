import Foundation

class MSession
{
    static let sharedInstance:MSession = MSession()
    
    private init()
    {
    }
    
    //MARK: public
    
    func loadSession()
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        {
        }
    }
}
