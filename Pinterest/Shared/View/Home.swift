//
//  Home.swift
//  Pinterest (iOS)
//
//  Created by Aaron Lee on 2020-12-08.
//

import SwiftUI
import SDWebImageSwiftUI

struct Home: View {
    
    private var window = NSScreen.main?.visibleFrame
    @State private var search = ""
    
    private var columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 4)
    
    @StateObject var imageData = ImageViewModel()
    
    var body: some View {
        HStack {
            
            SideBar()
            
            VStack {
                
                HStack(spacing: 12) {
                    
                    // Search Bar
                    
                    HStack(spacing: 15) {
                        
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        
                        TextField("Search", text: $search)
                            .textFieldStyle(PlainTextFieldStyle())
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(BlurWindow())
                    .cornerRadius(10)
                    
                    Button(action: {}, label: {
                        
                        Image(systemName: "slider.vertical.3")
                            .foregroundColor(.black)
                            .padding(10)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: -5, y: -5)
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    Button(action: {}, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color.black)
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: -5, y: -5)
                    })
                    .buttonStyle(PlainButtonStyle())
                }
                
                GeometryReader { geometry in
                    
                    // Scroll View
                    
                    ScrollView {
                        
                        LazyVGrid(columns: columns, spacing: 15) {
                            
                            ForEach(imageData.images.indices, id: \.self) { index in
                                
                                ZStack {
                                    
                                    WebImage(url: URL(string: imageData.images[index].download_url)!)
                                        .placeholder(content: {
                                            ProgressView()
                                        })
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: (geometry.frame(in: .global).width - 45) / 4, height: 150)
                                        .cornerRadius(15)
                                    
                                    Color.black.opacity(imageData.images[index].onHover ?? false ? 0.2 : 0)
                                        .cornerRadius(15)
                                    
                                    VStack {
                                        HStack {
                                            Spacer(minLength: 0)
                                            
                                            Button(action: {}, label: {
                                                Image(systemName: "hand.thumbsup.fill")
                                                    .foregroundColor(.yellow)
                                                    .padding(8)
                                                    .background(Color.white)
                                                    .cornerRadius(10)
                                            })
                                            .buttonStyle(PlainButtonStyle())
                                            
                                            Button(action: { saveImage(index: index) }, label: {
                                                Image(systemName: "folder.fill")
                                                    .foregroundColor(.blue)
                                                    .padding(8)
                                                    .background(Color.white)
                                                    .cornerRadius(10)
                                            })
                                            .buttonStyle(PlainButtonStyle())
                                            
                                        }
                                        .padding(10)
                                        
                                        Spacer()
                                    }
                                    .opacity(imageData.images[index].onHover ?? false ? 1 : 0)
                                }
                                .onHover(perform: { hovering in
                                    withAnimation {
                                        imageData.images[index].onHover = hovering
                                    }
                                })
                                
                            }
                            // Images
                        }
                        .padding(.vertical)
                    }
                }
                
                Spacer()
            }
            .padding()
            
        }
        .ignoresSafeArea(.all, edges: .all)
        .frame(width: window!.width / 1.5, height: window!.height - 40)
        .background(Color.white.opacity(0.6))
        .background(BlurWindow())
    }
    
    func saveImage(index: Int) {
        
        let manager = SDWebImageDownloader(config: .default)
        manager.downloadImage(with: URL(string: imageData.images[index].download_url)!) { (image, _, _, _) in
            
            guard let imageoriginal = image else { return }
            
            let data = imageoriginal.sd_imageData(as: .JPEG)
            
            let pannel = NSSavePanel()
            pannel.canCreateDirectories = true
            pannel.nameFieldStringValue = "\(imageData.images[index].id).jpg"
            
            pannel.begin { (response) in
                
                if response.rawValue == NSApplication.ModalResponse.OK.rawValue {
                    
                    do {
                        
                        try data?.write(to: pannel.url!, options: .atomicWrite)
                        
                        print("success")
                    } catch {
                        print("Handle error: \(error.localizedDescription)")
                    }
                }
                
            }
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct SideBar: View {
    
    @State private var selected = "Home"
    @Namespace private var animation
    
    var body: some View {
        HStack(spacing: 0) {
            
            VStack(spacing: 22) {
                
                Group {
                    HStack {
                        
                        Image("logo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 45, height: 45)
                        
                        Text("Pinterest")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        
                        Spacer(minLength: 0)
                    }
                    .padding(.top, 35)
                    .padding(.leading, 10)
                    
                    
                    TabButton(image: "house.fill", title: "Home", selected: $selected, animation: animation)
                    
                    TabButton(image: "clock.fill", title: "Recents", selected: $selected, animation: animation)
                    
                    TabButton(image: "person.2.fill", title: "Following", selected: $selected, animation: animation)
                    
                    HStack {
                        
                        Text("Insights")
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                        
                        Spacer()
                    }
                    .padding()
                    
                    TabButton(image: "message.fill", title: "Messages", selected: $selected, animation: animation)
                    
                    TabButton(image: "bell.fill", title: "Notifications", selected: $selected, animation: animation)
                }
                
                Spacer(minLength: 0)
                
                VStack(spacing: 8) {
                    
                    Image("business")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.horizontal, 10)
                    
                    Button(action: {
                        
                    }, label: {
                        Text("Business Tools")
                            .fontWeight(.semibold)
                            .foregroundColor(.blue)
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    Text("Hurry! Up Now you can unlock our new business tools at your convenience")
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 10)
                }
                
                Spacer(minLength: 0)
                
                // PROFILE
                
                HStack(spacing: 10) {
                    
                    Image("profile")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 35, height: 35)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("iJustine")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        
                        Text("Last Login 06/12/20")
                            .font(.caption2)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer(minLength: 0)
                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 8)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: -5, y: -5)
                .padding(.horizontal)
                .padding(.bottom, 20)
                
                
            }
            
            Divider()
                .offset(x: -2)
            
        } //: SIDE BAR
        .frame(width: 240)
    }
}

extension NSTextField {
    
    // REMOVE FOCUS RING
    open override var focusRingType: NSFocusRingType {
        get { .none }
        set {}
    }
    
}
