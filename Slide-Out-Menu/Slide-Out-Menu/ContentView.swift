//
//  ContentView.swift
//  Slide-Out-Menu
//
//  Created by Aaron Lee on 2020-11-01.
//

import SwiftUI

struct HomePage: View {
    
    @Binding var x: CGFloat
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Button(action: {
                    
                    withAnimation {
                        
                        x = 0
                    }
                    
                }) {
                    
                    Image(systemName: "line.horizontal.3")
                        .font(.system(size: 24))
                        .foregroundColor(Color("twitter"))
                    
                }
                
                Spacer(minLength: 0)
                
                Text("Twitter")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Spacer(minLength: 0)
            }
            .padding()
            .background(Color.white)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
            
            Spacer()
            
        }
        // For Gesture
        .contentShape(Rectangle())
        .background(Color.white)
        
    }
}

struct ContentView: View {

    @State var width = UIScreen.main.bounds.width - 50
    // To Hide
    @State var x = -UIScreen.main.bounds.width + 50

    var body: some View {

        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
            HomePage(x: $x)

            SlideMenu()
                .shadow(color: Color.black.opacity(x != 0 ? 0.1 : 0), radius: 5, x: 5, y: 0)
                .offset(x: x)
                .background(Color.black.opacity(x == 0 ? 0.5 : 0)
                        .ignoresSafeArea(.all, edges: .vertical).onTapGesture {
                            
                            // Hide On Tap
                            
                            withAnimation {
                                
                                x = -width
                            }
                    })
        }

        // Add gesture or Drag feature
        .gesture(DragGesture().onChanged({ value in

                withAnimation {

                    if value.translation.width > 0 {

                        if x < 0 {
                            x = -width + value.translation.width
                        }
                    } else {

                        x = value.translation.width
                    }

                }

            }).onEnded({ (value) in
                withAnimation {

                    if -x < width / 2 {
                        x = 0
                    } else {
                        x = -width
                    }

                }
            }))

    }
}

struct SlideMenu: View {

    var edges = UIApplication.shared.windows.first?.safeAreaInsets

    @State var show = true

    var body: some View {

        HStack(spacing: 0) {

            VStack(alignment: .leading) {

                Image("logo")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())

                HStack(alignment: .top, spacing: 12) {

                    VStack(alignment: .leading, spacing: 12) {

                        Text("Dua Lipa")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)

                        Text("@_DuaLipa")
                            .foregroundColor(.gray)

                        // Follow Counts

                        HStack(spacing: 20) {

                            FollowView(count: 10, title: "Following")
                                .onTapGesture {

                            }

                            FollowView(count: 108, title: "Followers")
                                .onTapGesture {

                            }
                        }
                            .padding(.top, 10)

                    }

                    Spacer(minLength: 0)

                    Button(action: {
                        withAnimation {
                            show.toggle()
                        }
                    }) {
                        Image(systemName: show ? "chevron.down" : "chevron.up")
                            .foregroundColor(Color("twitter"))

                    }
                        .padding(.top, 10)

                }

                Divider()
                    .padding(.top)

                // Different View When up or down buttons pressed
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading) {

                        // Menu Buttons

                        ForEach(menuButtons, id: \.self) { menu in
                            Button(action: {
                                // Switch Action
                            }) {
                                MenuButton(title: menu)
                            }
                        }

                        Divider()
                            .padding(.top, 10)

                        Button(action: { }) {
                            MenuButton(title: "Twitter Ads")
                        }

                        Divider()

                        Button(action: { }) {
                            Text("Settings and Privacy")
                                .foregroundColor(.black)

                        }
                            .padding(.top)

                        Button(action: { }) {
                            Text("Help Centre")
                                .foregroundColor(.black)

                        }
                            .padding(.vertical)

                        Spacer(minLength: 0)

                        Divider()
                            .padding(.bottom)

                        HStack {
                            Button(action: { }) {

                                Image("help")
                                    .resizable()
                                    .frame(width: 26, height: 26)
                                    .foregroundColor(Color("twitter"))
                            }

                            Spacer(minLength: 0)

                            Button(action: { }) {

                                Image("barcode")
                                    .resizable()
                                    .frame(width: 26, height: 26)
                                    .foregroundColor(Color("twitter"))
                            }
                        }

                    }
                    // Hiding this view when down arrow pressed
                    .opacity(show ? 1 : 0)
                        .frame(height: show ? nil : 0)

                    // Alternative View for Up Arrow
                    HStack {
                        VStack(alignment: .leading) {
                            Button(action: { }) {
                                Text("Create a new account")
                                    .foregroundColor(Color("twitter"))
                            }
                                .padding(.bottom)

                            Button(action: { }) {
                                Text("Add an existing account")
                                    .foregroundColor(Color("twitter"))
                            }

                            Spacer(minLength: 0)
                        }
                            .opacity(show ? 0 : 1)
                            .frame(height: show ? 0 : nil)
                        Spacer()
                    }
                }



            }
                .padding(.horizontal, 20)
            // Vertical Edges are ignored
            .padding(.top, edges!.top == 0 ? 15 : edges?.top)
                .padding(.bottom, edges!.bottom == 0 ? 15 : edges?.bottom)
            // Default Width
            .frame(width: UIScreen.main.bounds.width - 50)
                .background(Color.white)
                .ignoresSafeArea(.all, edges: .vertical)

            Spacer(minLength: 0)
        }
    }

}

struct FollowView: View {

    var count: Int
    var title: String

    var body: some View {

        HStack {

            Text("\(count)")
                .fontWeight(.bold)
                .foregroundColor(.black)

            Text(title)
                .foregroundColor(.gray)

        }

    }
}

var menuButtons = ["Profile", "Lists", "Topics", "Bookmarks", "Moments"]

struct MenuButton: View {
    var title: String
    var body: some View {

        HStack(spacing: 15) {

            Image(title)
                .resizable()
                .renderingMode(.template)
                .frame(width: 24, height: 24)
                .foregroundColor(.gray)

            Text(title)
                .foregroundColor(.black)

            Spacer(minLength: 0)

        }
            .padding(.vertical, 12)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
