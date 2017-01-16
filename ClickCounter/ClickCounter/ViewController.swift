//
//  ViewController.swift
//  ClickCounter
//
//  Created by LimJaemin on 2017. 1. 16..
//  Copyright © 2017년 LimJaemin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Label
        let label = UILabel()
        label.frame = CGRect.init(x:150, y:150, width:60, height:60)
        label.text = "0"
        self.view.addSubview(label)
        
        // Button
        let button = UIButton()
        button.frame = CGRect.init(x:150, y:250, width:60, height:60)
        button.setTitle("Click", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        self.view.addSubview(button)
        
    }


}

