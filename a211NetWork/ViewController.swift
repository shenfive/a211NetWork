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
        let apiModel = APIModel.share
        
        apiModel.queryRandomUserAlamofire { (data, error) in
            if error != nil{
                print(error?.localizedDescription)
                self.message(message: error?.localizedDescription ?? "")
                return
            }
            let json = JSON(data)
            print(json["results"][0]["picture"]["large"].stringValue)
            self.message(message: json["results"][0]["picture"]["large"].stringValue)
        }
        
    }
    func message(message:String){
        let alert = UIAlertController(title: "錯誤", message: message, preferredStyle: .alert)
        let okBut = UIAlertAction.init(title: "我知道了", style: .default, handler: nil)
        alert.addAction(okBut)
        present(alert, animated: true, completion: nil)
    }

}

