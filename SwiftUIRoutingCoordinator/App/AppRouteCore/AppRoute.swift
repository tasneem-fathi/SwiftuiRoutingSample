//
//  AppRoute.swift
//  SwiftUIRoutingCoordinator
//
//  Created by tasneem .. on 04/02/2023.
//

import Foundation
import SwiftUI
import UIKit

class AppRoute{

    static func popRoot(){
        UIApplication.shared.getNavigationController()?.popToRootViewController(animated: true)
    }


}
