//
//  TableViewController.swift
//  UIImagePickerController
//
//  Created by pantosoft on 2018/4/17.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

import UIKit
import AVFoundation
import Photos

enum AccessLevel: String {
    case notDetermined = "not determined"
    case restricted = "restricted"
    case denied = "denied"
    case authorized = "authorized"
}



extension UIViewController {
    func alert(with title: String?, message: String?) {
        let alertController = UIAlertController(title: title, message:message, preferredStyle: .alert)
        let action = UIAlertAction(title: "确定", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
}



class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let sourceType = UIImagePickerControllerSourceType(rawValue: indexPath.row) {
            switch sourceType {
            case .photoLibrary:
                requestAccessPhotoLibary { (accessLevel) in
                    if(accessLevel == .authorized) {
                        self.presentImagePickerController(with: .photoLibrary)
                    }else {
                        self.alert(with: "authorization status", message: accessLevel.rawValue)
                    }
                }
            case .camera:
                requestAccessCamera { (accessLevel) in
                    if(accessLevel == .authorized) {
                        self.presentImagePickerController(with: .camera)
                    }else {
                        self.alert(with: "authorization status", message: accessLevel.rawValue)
                    }
                }
            case .savedPhotosAlbum:
                return
            }
        }
    }
    
    
    private func requestAccessPhotoLibary(completionHandler: @escaping (AccessLevel) -> Void) {
        PHPhotoLibrary.requestAuthorization { (authorizationStatus) in
            DispatchQueue.main.async {
                switch authorizationStatus {
                case .notDetermined:
                    completionHandler(.notDetermined)
                case .restricted:
                    completionHandler(.restricted)
                case .denied:
                    completionHandler(.denied)
                case .authorized:
                    completionHandler(.authorized)
                }
            }
        }
    }
    
    
    private func requestAccessCamera(completionHandler: @escaping (AccessLevel) -> Void) {
        AVCaptureDevice.requestAccess(for: .video) { (_) in
            let authorizationStatus = AVCaptureDevice.authorizationStatus(for: .video)
            DispatchQueue.main.async {
                switch authorizationStatus {
                case .notDetermined:
                    completionHandler(.notDetermined)
                case .restricted:
                    completionHandler(.restricted)
                case .denied:
                    completionHandler(.denied)
                case .authorized:
                    completionHandler(.authorized)
                }
            }
        }
    }
    
    private func presentImagePickerController(with sourceType: UIImagePickerControllerSourceType) {
        //判断某个sourceType是否可用
        //sourceType类型: photoLibrary,相册, camera:相机, savedPhotesAlbum,保存图片到相册
        let isSourceTypeAvailable = UIImagePickerController.isSourceTypeAvailable(sourceType)
        //获取可用的medie types
        if let availableMediaTypes = UIImagePickerController.availableMediaTypes(for: sourceType) {
            print("avaliableMediaTypes:\(availableMediaTypes)")
        }
        
        if sourceType == .camera {
            //判断前后摄像头是否可用
            let cameraDeviceRearIsAvailable = UIImagePickerController.isCameraDeviceAvailable(.rear)
            let cameraDeviceFrontIsAvailable = UIImagePickerController.isCameraDeviceAvailable(.front)
            print("cameraDeviceRearIsAvailable:\(cameraDeviceRearIsAvailable), cameraDeviceFrontIsAvailable:\(cameraDeviceFrontIsAvailable)");
        }
        
        
        
        guard isSourceTypeAvailable else {
            alert(with: "Warning", message: "Source type is not available for current device")
            return
        }
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = sourceType
        imagePickerController.allowsEditing = true 
        present(imagePickerController, animated: true, completion: nil)
    }
}

extension TableViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("image picker controller cancel")
        picker.dismiss(animated: true, completion: nil)
    }
}
