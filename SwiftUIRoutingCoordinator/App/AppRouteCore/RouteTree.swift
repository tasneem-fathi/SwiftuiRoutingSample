//
//  RouteTree.swift
//  SwiftUIRoutingCoordinator
//
//  Created by tasneem .. on 04/02/2023.
//

import Foundation
import SwiftUI

enum RouteTree :  Equatable{
    static func == (lhs: RouteTree, rhs: RouteTree) -> Bool {
        lhs.value == rhs.value
    }
    var value: String? {
         return String(describing: self)
    }
    case back
    case root
    case none

    // app cases
    case view2(DemoViewModel)
    case view3
    case sheetView
    case fullSheetView
    case anotherView


}
