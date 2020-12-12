//
//  ViewController.swift
//  a211NetWork
//
//  Created by 申潤五 on 2020/12/5.
//

import UIKit
import SwiftyJSON
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var headImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch getNetworkStatus() {
        case true:
            self.updateUser()
        case false:
            message(title: "通知", message: "網路不通，請檢查後再試")
        }
    }

    func updateUser(){
        let apiModel = APIModel.share
        apiModel.queryRandomUserAlamofire { (data, error) in
            if error != nil{
                print(error?.localizedDescription)
                self.message(title:"錯誤",message: error?.localizedDescription ?? "")
                return
            }
            let json = JSON(data)
            print(json["results"][0]["picture"]["large"].stringValue)
            let imageUrlString = json["results"][0]["picture"]["large"].stringValue
            self.headImageView.kf.setImage(with: URL(string: imageUrlString))
            
            
//            self.message(title:"成功",message: json["results"][0]["picture"]["large"].stringValue)
            
            
            
            
            
        }
    }

    
    
    
}
