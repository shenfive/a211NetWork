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

    @IBOutlet weak var cont: UIView!
    @IBOutlet weak var headImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cont.clipsToBounds = false
        cont.backgroundColor = UIColor.clear
        cont.layer.shadowRadius = 20         //陰影
        cont.layer.shadowOpacity = 0.6;
        cont.layer.shadowColor = UIColor.red.cgColor
        cont.layer.shadowOffset = CGSize(width: 10, height: 10)

        headImageView.clipsToBounds = true
        headImageView.layer.cornerRadius = headImageView.frame.width / 2
        headImageView.layer.borderColor = UIColor.blue.cgColor
        headImageView.layer.borderWidth = 3
        
        
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
        }
    }

    @IBAction func updagteAction(_ sender: Any) {
        updateUser()
    }
    
    
    
}
