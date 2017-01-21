//
//  ViewController.swift
//  ImagePickerAssignment
//
//  Created by LimJaemin on 2017. 1. 19..
//  Copyright © 2017년 LimJaemin. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    let imageView = UIImageView()
    let imageView2 = UIImageView()
    
    var selectedImageView = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(imageView)
        self.view.addSubview(imageView2)
        
        self.imageView.backgroundColor = UIColor.lightGray
        self.imageView2.backgroundColor = UIColor.orange
        
        self.imageView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.view).offset(25)
            make.left.equalTo(self.view).offset(20)
            make.bottom.equalTo(self.view).offset(-350)
            make.right.equalTo(self.view).offset(-20)
        }
        
        self.imageView2.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(imageView.snp.bottom).offset(20)
            make.left.equalTo(self.view).offset(20)
            make.size.equalTo(self.imageView)
        }
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.openAlertView))
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(ViewController.openAlertView))
        
        imageView.addGestureRecognizer(tap)
        imageView.isUserInteractionEnabled = true
        imageView.tag = 1
        
        imageView2.addGestureRecognizer(tap2)
        imageView2.isUserInteractionEnabled = true
        imageView2.tag = 2
    }
    
    func openAlertView(sender: UITapGestureRecognizer) { // imageView를 tap하면 alertView가 나타난다
        
        let tapLocation = sender.view
        print(tapLocation?.tag ?? 1) // 1은 default value
        
        // 변수에 어떤 이미지뷰가 tap 되었는지 정보를 넣어준다
        selectedImageView = (tapLocation?.tag)!
        
        let controller = UIAlertController(title: "사진 소스 선택", message: "사진을 가져올 소스를 선택해 주세요",
                                           preferredStyle: UIAlertControllerStyle.actionSheet)
        
        let photoLibraryAction = UIAlertAction(title: "라이브러리", style: UIAlertActionStyle.default) { action in
            self.pickImageFromPhotoLibrary()
        }
        let photoAlbumAction = UIAlertAction(title: "사진앨범", style: UIAlertActionStyle.default) { action in
            self.pickImageFromSavedPhotoAlbum()
        }
        let cameraAction = UIAlertAction(title: "카메라", style: UIAlertActionStyle.default) { action in
            self.pickImageFromCamera()
        }
        let cancelAction = UIAlertAction(title: "취소", style: UIAlertActionStyle.cancel) { action in
            self.dismiss(animated: true, completion: nil)
        }
        
        controller.addAction(photoLibraryAction)
        controller.addAction(photoAlbumAction)
        controller.addAction(cameraAction)
        controller.addAction(cancelAction)
        
        self.present(controller, animated: true, completion: nil)
    }
    
    func pickImageFromPhotoLibrary() {
        let picker = UIImagePickerController()
        
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        
        // delegate 지정
        picker.delegate = self
        
        self.present(picker, animated: false)
    }
    
    func pickImageFromSavedPhotoAlbum() {
        let picker = UIImagePickerController()
        
        picker.sourceType = .savedPhotosAlbum
        picker.allowsEditing = true
        
        // delegate 지정
        picker.delegate = self
        
        self.present(picker, animated: false)
    }
    
    func pickImageFromCamera() {
        let picker = UIImagePickerController()
        
        picker.sourceType = .camera
        picker.allowsEditing = true
        
        // delegate 지정
        picker.delegate = self
        
        self.present(picker, animated: false)
    }
    
    // ImagePicker에서 이미지를 선택하지 않고 취소했을 때 호출되는 메소드
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: false) {
            // 알림창
            let alert = UIAlertController(title: "", message: "이미지 선택이 취소되었습니다", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .cancel))
            self.present(alert, animated: true)
        }
    }
    
    // ImagePicker에서 이미지를 선택했을 때 호출되는 메소드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: false) { () in
            // 선택된 이미지를 imageView에 표시
            let image = info[UIImagePickerControllerEditedImage] as? UIImage
            
            switch(self.selectedImageView) {
            case 1:
                self.imageView.image = image
                let alert = UIAlertController(title: "", message: "이미지를 성공적으로 가져왔습니다", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .cancel))
                self.present(alert, animated: true)
                break
            case 2:
                self.imageView2.image = image
                let alert = UIAlertController(title: "", message: "이미지를 성공적으로 가져왔습니다", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .cancel))
                self.present(alert, animated: true)
                break
            default:
                let alert = UIAlertController(title: "", message: "이미지를 불러오지 못했습니다", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .cancel))
                self.present(alert, animated: true)
                break
            }
        }
    }
    
}

