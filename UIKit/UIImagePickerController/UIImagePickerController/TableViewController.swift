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
                self.presentImagePickerController(with: .savedPhotosAlbum)
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
        guard isSourceTypeAvailable else {
            alert(with: "Warning", message: "Source type is not available for current device")
            return
        }
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = sourceType
        imagePickerController.allowsEditing = true
        if #available(iOS 11.0, *) {
            imagePickerController.imageExportPreset = .current
            imagePickerController.videoExportPreset = AVAssetExportPreset960x540
        }
        print("mediaTypes:\(imagePickerController.mediaTypes)")
        //获取可用的medie types
        if let availableMediaTypes = UIImagePickerController.availableMediaTypes(for: sourceType) {
            print("avaliableMediaTypes:\(availableMediaTypes)")
            //设置imagePickerController的mediaTypes,默认里面包含pulic.image,没有包含pulic.video
            imagePickerController.mediaTypes = availableMediaTypes
        }
        
        
        if sourceType == .camera {
            //判断前后摄像头是否可用
            let cameraDeviceRearIsAvailable = UIImagePickerController.isCameraDeviceAvailable(.rear)
            let cameraDeviceFrontIsAvailable = UIImagePickerController.isCameraDeviceAvailable(.front)
            print("cameraDeviceRearIsAvailable:\(cameraDeviceRearIsAvailable), cameraDeviceFrontIsAvailable:\(cameraDeviceFrontIsAvailable)");
            if cameraDeviceFrontIsAvailable {
                //设置imagePickerController的摄像头
                imagePickerController.cameraDevice = .front
                //设置imagePickerController的闪光灯模式
                imagePickerController.cameraFlashMode = .auto
                //设置cameraView的transform
//                imagePickerController.cameraViewTransform = CGAffineTransform(rotationAngle: CGFloat.pi / 4)
                //设置录制视频的质量,默认值为medium
                imagePickerController.videoQuality = .type640x480
                //设置录制视频的最长时间,默认为10分钟
                imagePickerController.videoMaximumDuration = 30
                if let availableCaptureModes = UIImagePickerController.availableCaptureModes(for: .front) {
                    print("availableCaptureModes:\(availableCaptureModes)")
                    if availableCaptureModes.contains(UIImagePickerControllerCameraCaptureMode.video.rawValue as NSNumber) {
                        imagePickerController.mediaTypes = ["public.image", "public.movie"]
                        imagePickerController.cameraCaptureMode = .video
                    }
                }
                
                
            }
            
            
            
            
//            imagePickerController.showsCameraControls = false
//            imagePickerController.cameraOverlayView = nil
        }
        present(imagePickerController, animated: true, completion: nil)
    }
}

extension TableViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print("info:\(info)")
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("image picker controller cancel")
        picker.dismiss(animated: true, completion: nil)
    }
}
