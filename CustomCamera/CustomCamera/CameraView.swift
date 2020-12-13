//
//  CameraView.swift
//  CustomCamera
//
//  Created by Aaron Lee on 2020-12-13.
//

import SwiftUI
import AVFoundation

struct CameraView: View {
    
    @StateObject private var camera = CameraModel()
    
    var body: some View {
        
        ZStack {
            
            CameraPreview(camera: camera)
                .ignoresSafeArea()
            
            VStack {
                
                if camera.isTaken {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: camera.reTake) {
                            
                            Image(systemName: "arrow.triangle.2.circlepath.camera")
                                .foregroundColor(.black)
                                .padding()
                                .background(Color.white)
                                .clipShape(Circle())
                        } //: B
                        .padding(.trailing)
                    } //: H
                }
                
                Spacer()
                
                HStack {
                    
                    if camera.isTaken {
                        
                        Button(action: {
                            if !camera.isSaved {
                                camera.savePic()
                            }
                        }) {
                            
                            Text(camera.isSaved ? "Saved" : "Save")
                                .foregroundColor(.black)
                                .fontWeight(.semibold)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 20)
                                .background(Color.white)
                                .clipShape(Capsule())
                        } //: B
                        .padding(.leading)
                        
                        Spacer()
                    } else {
                        
                        Button(action: camera.takePic) {
                            
                            ZStack {
                                
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 65, height: 65)
                                
                                Circle()
                                    .stroke(Color.white, lineWidth: 2)
                                    .frame(width: 75, height: 75)
                            } //: Z
                        } //: B
                    }
                } //: H
                .frame(height: 75)
            } //: V
        } //: Z
        .onAppear {
            camera.checkPermission()
        }
    }
}

struct CameraPreview: UIViewRepresentable {
    
    @ObservedObject var camera: CameraModel
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIView(frame: UIScreen.main.bounds)
        camera.preview = AVCaptureVideoPreviewLayer(session: camera.session)
        camera.preview.frame = view.frame
        camera.preview.videoGravity = .resizeAspectFill
        view.layer.addSublayer(camera.preview)
        camera.session.startRunning()
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) { }
}
