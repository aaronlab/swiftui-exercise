//
//  ContentView.swift
//  DropDownMenu
//
//  Created by Aaron Lee on 2020-11-28.
//

import SwiftUI

struct ContentView: View {
    
    @State var menu = MyMenu.menu1.rawValue
    
    var body: some View {
        NavigationView {
            VStack {
                
                Text("Selected Menu: \(menu)")
                
            } //: VSTACK
            .navigationBarTitle("Drop Box Menu", displayMode: .inline)
            .navigationBarItems(trailing: dropDownMenubar)
            
        } //: NAVIGATION

    }
    
    var dropDownMenubar: some View {
        Menu {
            Button(action: {
                    self.menu = MyMenu.menu1.rawValue
            }, label: {
                HStack {
                    Text(MyMenu.menu1.rawValue)
                    if menu == MyMenu.menu1.rawValue {
                        Image(systemName: "checkmark")
                    }
                }
            })
            
            Button(action: {
                    self.menu = MyMenu.menu2.rawValue
            }, label: {
                HStack {
                    Text(MyMenu.menu2.rawValue)
                    if menu == MyMenu.menu2.rawValue {
                        Image(systemName: "checkmark")
                    }
                }
            })
            
            Button(action: {
                    self.menu = MyMenu.menu3.rawValue
            }, label: {
                HStack {
                    Text(MyMenu.menu3.rawValue)
                    if menu == MyMenu.menu3.rawValue {
                        Image(systemName: "checkmark")
                    }
                }
            })
            
        } label: {
            Label(
                title: {
                    Text(menu)
                        .foregroundColor(.white)
                },
                icon: {}
            )
        } //: MENU
        .menuStyle(DefaultMenuStyle())
    }
    
    enum MyMenu: String {
        case menu1 = "Menu 1"
        case menu2 = "Menu 2"
        case menu3 = "Menu 3"
    }
    
}

struct DefaultMenuStyle: MenuStyle {
    func makeBody(configuration: Configuration) -> some View {
        Menu(configuration)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.black)
            .clipShape(Capsule())
            .frame(width: UIScreen.main.bounds.size.width / 4)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
