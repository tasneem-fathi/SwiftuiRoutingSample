//
//  UIApplication.swift
//  SwiftUIRoutingCoordinator
//
//  Created by tasneem .. on 04/02/2023.
//

import Foundation
import UIKit



extension UIApplication {
    
    var keyWindow: UIWindow? {
        return UIApplication.shared.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .map { $0 as? UIWindowScene }
            .compactMap { $0 }
            .first?.windows
            .filter { $0.isKeyWindow }
            .first
    }

    func getNavigationControllers() -> [UIViewController] {
        guard let window = keyWindow else { return [] }
        guard let rootViewController = window.rootViewController else { return [] }
        return rootViewController.children
    }
    
    func getNavigationController() -> UINavigationController? {
        guard let window = keyWindow else { return nil }
        guard let rootViewController = window.rootViewController else { return nil }
        guard let navigationController = findNavigationController(viewController: rootViewController) else { return nil }

        return navigationController
    }
    
    private func findNavigationController(viewController: UIViewController?) -> UINavigationController? {
        guard let viewController = viewController else {
            return nil
        }
        
        if let navigationController = viewController as? UINavigationController {
            return navigationController
        }
        
        for childViewController in viewController.children {
            return findNavigationController(viewController: childViewController)
        }
        
        return nil
    }
}
