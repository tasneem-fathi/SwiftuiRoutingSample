//
//  DemoRoute.swift
//  SwiftUIRoutingCoordinator
//
//  Created by tasneem .. on 03/02/2023.
//

import Foundation
import SwiftUI



class DemoRouter :  AppRouteProtocol{

    static func transitionType(_ view: RouteTree) -> TransitionStyle{
        switch(view){
            case .view2                  : return .push
            case .view3                  : return .push
            case .sheetView              : return .present
            case .fullSheetView          : return .presentFull
            case .anotherView            : return .push
            default                      : return .none

        }
    }
    
    @ViewBuilder
    static func destination(_ view: RouteTree) -> some View{
        switch(view){
            case .view2(let demoVm)      : View2().environmentObject(demoVm)
            case .view3                  : View3()
            case .sheetView              : SheetView()
            case .fullSheetView          : FullSheetView()
            case .anotherView            : AnotherView()
            default                      : ZStack{} // empty view
        }
    }

}

