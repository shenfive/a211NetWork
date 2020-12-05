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
            let json = JSON(data)
            print(json)
        }
        
    }


}

