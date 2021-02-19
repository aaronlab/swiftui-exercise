//
//  SceneDelegate.swift
//  URLSchemeExample
//
//  Created by Aaron Lee on 2021-02-19.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    /// Environment Obj for DeepLink
    let schemeState = SchemeState()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = scene as? UIWindowScene else { return }
        self.window = UIWindow(windowScene: scene)
        self.scene(scene, openURLContexts: connectionOptions.urlContexts)
    }
    
    /// Check URL Scheme
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        
        if let url = URLContexts.first?.url,
           let scheme = url.scheme,
           let view = url.host,
           scheme == "aaronlab" {
            
            // Params
            var params = [String: String]()
            URLComponents(url: url, resolvingAgainstBaseURL: false)?.queryItems?.forEach {
                params[$0.name] = $0.value
            }
            
            redirect(to: view, with: params)
        } else {
            goToMainView()
        }
    }
    
    /// Redirect View
    private func redirect(to scene: String, with params: [String: String]) {
        /*
         e.g.
         aaronlab://product?id=12345
         */
        if scene == "product" {
            if let productId = params["id"] {
                
                moveToProductView(with: productId)
            }
        }
    }
    
    // Go to Product Scene
    private func moveToProductView(with id: String) {
        schemeState.productId = id
        setupMainScene()
    }
    
    /// Go to Main View
    private func goToMainView() {
        setupMainScene()
    }
    
    /// Setup Main Scene
    private func setupMainScene() {
        guard let window = self.window else { return }
        
        let contentView = ContentView()
            .environmentObject(schemeState)
        
        window.rootViewController = UIHostingController(rootView: contentView)
        window.makeKeyAndVisible()
    }
    
}

