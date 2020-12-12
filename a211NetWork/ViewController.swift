//
//  ViewController.swift
//  a211NetWork
//
//  Created by 申潤五 on 2020/12/5.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch getNetworkStatus() {
        case true:
            let apiModel = APIModel.share
            apiModel.queryRandomUserAlamofire { (data, error) in
                if error != nil{
                    print(error?.localizedDescription)
                    self.message(title:"錯誤",message: error?.localizedDescription ?? "")
                    return
                }
                let json = JSON(data)
                print(json["results"][0]["picture"]["large"].stringValue)
                self.message(title:"成功",message: json["results"][0]["picture"]["large"].stringValue)
            }
        case false:
            message(title: "通知", message: "網路不通，請檢查後再試")
        }
    }


}
extension UIViewController{
    func getNetworkStatus()->Bool{
        if Reachability(hostName: "www.apple.com")?.currentReachabilityStatus().rawValue == 0 {
            return false
        }else{
            return true
        }
    }
    
    func message(title:String,message:String){
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okBut = UIAlertAction.init(title: "我知道了", style: .default, handler: nil)
            alert.addAction(okBut)
            self.present(alert, animated: true, completion: nil)
        }

    }
}
