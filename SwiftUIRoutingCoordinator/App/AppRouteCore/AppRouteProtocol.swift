//
//  AppRouteProtocol.swift
//  SwiftUIRoutingCoordinator
//
//  Created by tasneem .. on 03/02/2023.
//

import Foundation
import SwiftUI

protocol AppRouteProtocol{
    associatedtype V: View
    
    static func transitionType(_ view: RouteTree) -> TransitionStyle
    static func destination(_ view: RouteTree) -> V
    
}
