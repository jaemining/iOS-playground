//
//  ViewController.swift
//  Delegate-TextField
//
//  Created by LimJaemin on 2017. 1. 13..
//  Copyright © 2017년 LimJaemin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
//class ViewController: UIViewController {

    @IBOutlet var tf: UITextField!
    
    override func viewDidLoad() {
        /**
         * 입력값 속성 설정
         */
        self.tf.placeholder = "값을 입력하세요"
        self.tf.keyboardType = UIKeyboardType.alphabet
        self.tf.keyboardAppearance = UIKeyboardAppearance.dark
        self.tf.returnKeyType = UIReturnKeyType.join // 리턴키 타입은 "Join"
        self.tf.enablesReturnKeyAutomatically = true // 리턴키 자동 활성화 "On"
    
        /**
         * 스타일 설정
         */
        self.tf.borderStyle = UITextBorderStyle.line // 테두리 스타일 - 직선
        self.tf.backgroundColor = UIColor(white:0.87, alpha:1.0) // 배경 색상
        self.tf.contentVerticalAlignment = .center // 수직 방향 텍스트 배열 위차 - 가운데
        self.tf.contentHorizontalAlignment = .center // 수평 방향 텍스트 배열 위치 - 가운데
        self.tf.layer.borderColor = UIColor.darkGray.cgColor // 테두리 색상 - 회색
        self.tf.layer.borderWidth = 2.0 // 테두리 두께 - 1.0 픽셀
        
        //텍스트 필드를 최초 응답자로 지정
        self.tf.becomeFirstResponder()
        
        // Delegate 지정
        self.tf.delegate = self
        
    }
    
    @IBAction func confirm(_ sender: Any) {
        self.tf.resignFirstResponder()
    }

    @IBAction func input(_ sender: Any) {
        self.tf.becomeFirstResponder()
    }
    
    /**
     * 델리게이트 메소드 추가
     */
    
    // 텍스트 필드의 편집을 시작할 때 호출
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldBeginEditing execute")
        return true
    }
    
    // 텍스트필드의 편집이 시작된 후 호출
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("텍트스 필드의 편집이 시작되었습니다")
    }
    
    // 텍스트 필드의 내용이 삭제될 때 호출
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("텍스트 필드의 내용이 삭제됩니다")
        return true
    }
    
    // 텍스트 필드의 내용이 변경될 때 호출
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("텍스트 필드의 내용이 \(string)으로 변경됩니다")
        
        if Int(string) == nil { // 입력된 값이 숫자가 아니라면 true를 리턴 
            // 현재 텍스트 필드에 입력된 길이와 더해질 문자열 길이의 합이 10을 넘는다면 반영하지 않음
            if (textField.text?.characters.count)! + string.characters.count > 10 {
                return false
            } else {
                return true
            }
        } else {
            return false
        }
    }
    
    // 텍스트 필드의 리턴키가 눌러졌을 때 호출
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        print("텍트스 필드의 리턴키가 눌러졌습니다")
        return true
    }
    
    // 텍스트 필드 편집이 종료될 때 호출
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("텍스트 필드의 편집이 종료됩니다")
        return true
    }
    
    // 텍스트 필드의 편집이 종료되었을 때 호출
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("텍스트 필드의 편집이 종료되었습니다")
    }
 
}

