//
//  HomeView.swift
//  SQLiteExample
//
//  Created by Aaron Lee on 2021-01-03.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - PROPERTIES
    
    @StateObject private var viewModel: HomeViewModel
    
    // MARK: - INIT
    
    init() {
        self._viewModel = StateObject(wrappedValue: HomeViewModel())
    }
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            
            VStack(alignment: .leading, spacing: 4) {
                
                HStack {
                    Spacer(minLength: 0)
                    
                    NavigationLink(
                        destination: viewModel.destination
                            .onDisappear {
                                self.viewModel.navigationStatus = .ready
                            },
                        tag: .pop,
                        selection: self.$viewModel.navigationStatus,
                        label: {EmptyView()})
                    
                    Button(action: {
                        self.viewModel.destination = AnyView(AddView())
                        self.viewModel.navigationStatus = .pop
                    }, label: {
                        Text("Add")
                    })
                    .padding()
                } //: H
                
                List {
                    
                    Section(header: Text("Saved List")) {
                        
                        ForEach(self.viewModel.users, id: \.id) { user in
                            
                            self.makeRow(user: user)
                        }
                    } //: S
                    
                } //: L
                .listStyle(PlainListStyle())
            } //: V
            .navigationBarTitle("Home View", displayMode: .inline)
            .onAppear {
                self.viewModel.loadUsers()
            }
        } //: N
    }
    
    private func makeRow(user: User) -> some View {
        return HStack {
            
            Text(user.name)
                .lineLimit(1)
            Spacer(minLength: 0)
            Text(user.email)
                .lineLimit(1)
            Spacer(minLength: 0)
            Text(user.mobileNo)
                .lineLimit(1)
        } //: H
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
