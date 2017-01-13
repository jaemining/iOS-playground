//
//  ViewController.swift
//  Delegate-ImagePicker
//
//  Created by LimJaemin on 2017. 1. 13..
//  Copyright © 2017년 LimJaemin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var imageView: UIImageView!

    @IBAction func pick(_ sender: Any) {
        
        // 이미지 피커 컨트롤러 인스턴스 생성
        let picker = UIImagePickerController()
        
        picker.sourceType = .photoLibrary // 이미지 소스로 사진 라이브러리 선택
        picker.allowsEditing = true // 이미지 편집 기능 On
        
        // Delegate 지정
        picker.delegate = self
        
        self.present(picker, animated: false) // 이미지 피커 컨트롤러 실행     
    }

    // 이미지 피커에서 이미지를 선택하지 않고 취소했을 때 호출되는 메소드
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        picker.dismiss(animated: false) // 이미지 피커 컨트롤러 창 닫기
        
        let alert = UIAlertController(title: "",
                                      message: "이미지 선택이 취소되었습니다",
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "확인", style: .cancel))
        self.present(alert, animated: false)
        
    }
    
    // 이미지 피커에서 이미지를 선택했을 때 호출되는 메소드 
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        picker.dismiss(animated: false) { () in
            
            let img = info[UIImagePickerControllerEditedImage] as? UIImage
            self.imageView.image = img
            
        }// 이미지 피커 컨트롤러 창 닫기
    }
}

