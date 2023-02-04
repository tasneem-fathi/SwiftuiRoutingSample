//
//  AnotherRouter.swift
//  SwiftUIRoutingCoordinator
//
//  Created by tasneem .. on 04/02/2023.
//

import Foundation
import SwiftUI

class AnotherRouter :  AppRouteProtocol{

    static func transitionType(_ view: RouteTree) -> TransitionStyle{
        switch(view){
            case .anotherView            : return .push
            default                      : return .none
        }
    }

    @ViewBuilder
    static func destination(_ view: RouteTree) -> some View{
        switch(view){
            case .anotherView            : AnotherView()
            default                      : ZStack{} // empty view
        }
    }


}

