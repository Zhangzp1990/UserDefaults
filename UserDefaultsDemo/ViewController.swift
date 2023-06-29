//
//  ViewController.swift
//  UserDefaultsDemo
//
//  Created by zhangzp on 2023/6/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        UserPreference.intValue = 2
        print("UserPreference1 = ", UserPreference.intValue)
        
        UserPreference.dictValue = ["1": "1"]
        print("UserPreference2 = ", UserPreference.dictValue)
        
        UserPreference.test = TestModel.init(intValue: 11, strValue: "11")
        print("UserPreference2 = ", UserPreference.test?.intValue)
        
        UserPreference.arrayValue = ["0", "1", "2"]
        print("UserPreference2 = ", UserPreference.arrayValue)
        
        UserPreference.URLValue = URL(string: "www.baidu.com")
        print("UserPreference2 = ", UserPreference.URLValue)
    }
}

