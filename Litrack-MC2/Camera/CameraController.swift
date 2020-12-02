//
//  CameraController.swift
//  Litrack-MC2
//
//  Created by Sufiandy Elmy on 28/05/20.
//  Copyright © 2020 Sufiandy Elmy. All rights reserved.
//

import UIKit
import AVFoundation

class CameraController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

        @IBOutlet weak var cameraButton: UIButton!
        @IBOutlet weak var LibraryBtn: UIButton!
    
         let speechService = SpeechService()
         var captureSession = AVCaptureSession()
         var backCamera: AVCaptureDevice?
         var frontCamera: AVCaptureDevice?
         var currentDevice: AVCaptureDevice?
         
         var photoOutput: AVCapturePhotoOutput?
         
         var cameraPreviewLayer:AVCaptureVideoPreviewLayer?
         
         var image: UIImage?
         
         var toggleCameraGestureRecognizer = UISwipeGestureRecognizer()
         
         var zoomInGestureRecognizer = UISwipeGestureRecognizer()
         var zoomOutGestureRecognizer = UISwipeGestureRecognizer()
         var flashMode = AVCaptureDevice.FlashMode.off
      
    override func viewDidLoad() {
        super.viewDidLoad()
        styleCaptureButton()
             }
             
    // add voice over
    override func viewDidAppear(_ animated: Bool) {
        
        
        setupCaptureSession()
        setupDevice()
        setupInputOutput()
        setupPreviewLayer()
        captureSession.startRunning()
             
        toggleCameraGestureRecognizer.direction = .up
        toggleCameraGestureRecognizer.addTarget(self, action: #selector(self.switchCamera))
        view.addGestureRecognizer(toggleCameraGestureRecognizer)
             
        // Zoom In recognizer
        zoomInGestureRecognizer.direction = .right
        zoomInGestureRecognizer.addTarget(self, action: #selector(zoomIn))
        view.addGestureRecognizer(zoomInGestureRecognizer)
             
        // Zoom Out recognizer
        zoomOutGestureRecognizer.direction = .left
        zoomOutGestureRecognizer.addTarget(self, action: #selector(zoomOut))
        view.addGestureRecognizer(zoomOutGestureRecognizer)
        
        let cameraVoiceOver = "Add your waste".localized
        speechService.speaking(cameraVoiceOver)
        accessibilityActivate()
    }
             
             func styleCaptureButton() {
                 cameraButton.layer.borderColor = UIColor.white.cgColor
                 cameraButton.layer.borderWidth = 5
                 cameraButton.clipsToBounds = true
                 cameraButton.layer.cornerRadius = min(cameraButton.frame.width, cameraButton.frame.height) / 2
             }
             
             func setupCaptureSession() {
                 captureSession.sessionPreset = AVCaptureSession.Preset.photo
             }
             
             func setupDevice() {
                 let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [AVCaptureDevice.DeviceType.builtInWideAngleCamera], mediaType: AVMediaType.video, position: AVCaptureDevice.Position.unspecified)
                 let devices = deviceDiscoverySession.devices
                 
                 for device in devices {
                     if device.position == AVCaptureDevice.Position.back {
                         backCamera = device
                     } else if device.position == AVCaptureDevice.Position.front {
                         frontCamera = device
                     }
                 }
                 currentDevice = backCamera
             }
             
             func setupInputOutput() {
                 do {
                     
                     let captureDeviceInput = try AVCaptureDeviceInput(device: currentDevice!)
                     captureSession.addInput(captureDeviceInput)
                     photoOutput = AVCapturePhotoOutput()
                     photoOutput!.setPreparedPhotoSettingsArray([AVCapturePhotoSettings(format: [AVVideoCodecKey : AVVideoCodecType.jpeg])], completionHandler: nil)
                     captureSession.addOutput(photoOutput!)
                     
                     
                 } catch {
                     print(error)
                 }
             }
             
             func setupPreviewLayer() {
                 self.cameraPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                 self.cameraPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
                 self.cameraPreviewLayer?.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
                 self.cameraPreviewLayer?.frame = view.frame
                 
                 self.view.layer.insertSublayer(self.cameraPreviewLayer!, at: 0)
             }
             
             
             @objc func switchCamera() {
                 captureSession.beginConfiguration()
                 
                 // Change the device based on the current camera
                 let newDevice = (currentDevice?.position == AVCaptureDevice.Position.back) ? frontCamera : backCamera
                 
                 // Remove all inputs from the session
                 for input in captureSession.inputs {
                     captureSession.removeInput(input as! AVCaptureDeviceInput)
                 }
                 
                 // Change to the new input
                 let cameraInput:AVCaptureDeviceInput
                 do {
                     cameraInput = try AVCaptureDeviceInput(device: newDevice!)
                 } catch {
                     print(error)
                     return
                 }
                 
                 if captureSession.canAddInput(cameraInput) {
                     captureSession.addInput(cameraInput)
                 }
                 
                 currentDevice = newDevice
                 captureSession.commitConfiguration()
             }
             
             @objc func zoomIn() {
                 if let zoomFactor = currentDevice?.videoZoomFactor {
                     if zoomFactor < 5.0 {
                         let newZoomFactor = min(zoomFactor + 1.0, 5.0)
                         do {
                             try currentDevice?.lockForConfiguration()
                             currentDevice?.ramp(toVideoZoomFactor: newZoomFactor, withRate: 1.0)
                             currentDevice?.unlockForConfiguration()
                         } catch {
                             print(error)
                         }
                     }
                 }
             }
             
             @objc func zoomOut() {
                 if let zoomFactor = currentDevice?.videoZoomFactor {
                     if zoomFactor > 1.0 {
                         let newZoomFactor = max(zoomFactor - 1.0, 1.0)
                         do {
                             try currentDevice?.lockForConfiguration()
                             currentDevice?.ramp(toVideoZoomFactor: newZoomFactor, withRate: 1.0)
                             currentDevice?.unlockForConfiguration()
                         } catch {
                             print(error)
                         }
                     }
                 }
             }
    
    
    @IBAction func LibraryBtn(_ sender: Any) {
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.success)
            let picker : UIImagePickerController = UIImagePickerController()
            picker.sourceType = UIImagePickerController.SourceType.photoLibrary
            picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
            picker.delegate = self
            picker.allowsEditing = false
            self.present(picker, animated: true, completion: nil)
    }
        
    @IBAction func cameraButton(_ sender: Any) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
        let settings = AVCapturePhotoSettings()
               self.photoOutput?.capturePhoto(with: settings, delegate: self)
        
           }
           
           override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
               if segue.identifier == "PreviewPhoto" {
                   let previewViewController = segue.destination as! PreviewViewController
                   previewViewController.image = self.image
               }
           }
       }

       extension CameraController: AVCapturePhotoCaptureDelegate {
           func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
               if let imageData = photo.fileDataRepresentation() {
                   self.image = UIImage(data: imageData)
                   performSegue(withIdentifier: "PreviewPhoto", sender: nil)
               }
           }

        }

   

