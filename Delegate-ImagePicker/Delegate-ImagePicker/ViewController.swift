//
//  ViewController.swift
//  Delegate-ImagePicker
//
//  Created by LimJaemin on 2017. 1. 13..
//  Copyright © 2017년 LimJaemin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!

    @IBAction func pick(_ sender: Any) {
        
        // 이미지 피커 컨트롤러 인스턴스 생성
        let picker = UIImagePickerController()
        
        picker.sourceType = .photoLibrary // 이미지 소스로 사진 라이브러리 선택
        picker.allowsEditing = true // 이미지 편집 기능 On
        
        self.present(picker, animated: false) // 이미지 피커 컨트롤러 실행     
    }


}

