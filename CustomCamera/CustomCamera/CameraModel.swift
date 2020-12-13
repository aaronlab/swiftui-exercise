//
//  CameraModel.swift
//  CustomCamera
//
//  Created by Aaron Lee on 2020-12-13.
//

import SwiftUI
import AVFoundation

class CameraModel: NSObject, ObservableObject, AVCapturePhotoCaptureDelegate {
    
    @Published var isTaken = false
    
    @Published var session =  AVCaptureSession()
    
    @Published var alert = false
    
    @Published var output = AVCapturePhotoOutput()
    
    @Published var preview: AVCaptureVideoPreviewLayer!
    
    @Published var isSaved = false
    
    @Published var picData = Data(count: 0)
    
    func checkPermission() {
        
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            setup()
            return
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { status in
                
                if status {
                    self.setup()
                }
            }
        case .denied:
            self.alert.toggle()
            return
        default:
            return
        }
    }
    
    func setup() {
        
        do {
            
            self.session.beginConfiguration()
            let device = AVCaptureDevice.default(.builtInDualCamera, for: .video, position: .back)
            let input = try AVCaptureDeviceInput(device: device!)
            
            if self.session .canAddInput(input) {
                self.session.addInput(input)
            }
            
            if session.canAddOutput(self.output) {
                self.session.addOutput(self.output)
            }
            
            self.session.commitConfiguration()
            
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func takePic() {
        
        DispatchQueue.global(qos: .background).async {
            
            self.output.capturePhoto(with: AVCapturePhotoSettings(), delegate: self)
            self.session.stopRunning()
            
            DispatchQueue.main.async {
                
                withAnimation { self.isTaken.toggle() }
            }
        }
    }
    
    func reTake() {
        
        DispatchQueue.global(qos: .background).async {
            
            self.session.startRunning()
            
            DispatchQueue.main.async {
                withAnimation { self.isTaken.toggle() }
                self.isSaved = false
            }
        }
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        
        if error != nil {
            return
        }
        
        guard let imageData = photo.fileDataRepresentation() else { return }
        
        self.picData = imageData
        
    }
    
    func savePic() {
        
        let image = UIImage(data: self.picData)!
        
        self.isSaved = true
        
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }
    
}
