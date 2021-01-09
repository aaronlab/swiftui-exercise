//
//  CustomNavigationView.swift
//  CustomSearchNavBar
//
//  Created by Aaron Lee on 2020-12-05.
//

import SwiftUI

struct CustomNavigationView: UIViewControllerRepresentable {
    func makeCoordinator() -> Coordinator {
        CustomNavigationView.Coordinator(parent: self)
    }
    
    var view: AnyView
    var largeTitle: Bool
    var title: String
    var placeHolder: String
    var onSearch: (String) -> Void
    var onCancel: () -> Void
    
    init(view: AnyView, placeHolder: String? = "Search", largeTitle: Bool? = true, title: String, onSearch: @escaping (String) -> Void, onCancel: @escaping () -> ()) {
        self.title = title
        self.largeTitle = largeTitle!
        self.placeHolder = placeHolder!
        self.view = view
        self.onSearch = onSearch
        self.onCancel = onCancel
    }
    
    func makeUIViewController(context: Context) -> UINavigationController {
        
        let childView = UIHostingController(rootView: view)
        
        let controller = UINavigationController(rootViewController: childView)
        
        controller.navigationBar.topItem?.title = title
        controller.navigationBar.prefersLargeTitles = largeTitle
        
        let searchController = UISearchController()
        searchController.searchBar.placeholder = placeHolder
        searchController.searchBar.delegate = context.coordinator
        
        searchController.obscuresBackgroundDuringPresentation = false
        
        controller.navigationBar.topItem?.hidesSearchBarWhenScrolling = false
        controller.navigationBar.topItem?.searchController = searchController
        
        return controller
        
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        uiViewController.navigationBar.topItem?.title = title
        uiViewController.navigationBar.topItem?.searchController?.searchBar.placeholder = placeHolder
        uiViewController.navigationBar.prefersLargeTitles = largeTitle
    }
    
    class Coordinator: NSObject, UISearchBarDelegate {
        
        var parnet: CustomNavigationView
        
        init(parent: CustomNavigationView) {
            self.parnet = parent
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            self.parnet.onSearch(searchText)
        }
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            self.parnet.onCancel()
        }
        
    }
    
}
