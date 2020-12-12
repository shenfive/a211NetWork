//
//  UIViewControllerExt.swift
//  a211NetWork
//
//  Created by 申潤五 on 2020/12/12.
//

import Foundation
import UIKit

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

