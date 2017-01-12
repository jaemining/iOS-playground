//
//  ViewController.swift
//  DelegatePractice
//
//  Created by LimJaemin on 2017. 1. 12..
//  Copyright © 2017년 LimJaemin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var selectedResult: UILabel!
    
    @IBAction func didAlert(_ sender: Any) {
        // 알림창 인스턴스 생성
        let alert = UIAlertView(title: "선택",
                                message: "항목을 선택해주세요",
                                delegate: nil,
                                cancelButtonTitle: "취소",
                                otherButtonTitles: "선택 A", "선택 B", "선택 C")
        // 알림창 표시
        alert.show()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

