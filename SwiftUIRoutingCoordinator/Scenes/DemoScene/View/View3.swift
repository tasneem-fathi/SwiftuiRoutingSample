//
//  View3.swift
//  SwiftUIRoutingCoordinator
//
//  Created by tasneem .. on 03/02/2023.
//

import SwiftUI

struct View3: View {
    @State var route : RouteTree = .none

    var body: some View {
        AppContainer<VStack,DemoRouter>(destination: $route) {
            
            VStack{
                Text("Hello, Iam View 3")
                
                Button {
                    route = .back
                } label: {
                    Text("Pop Back")
                        .foregroundColor(.red)
                }
                Button {
                    route = .root
                } label: {
                    Text("Pop Root")
                        .foregroundColor(.red)
                }
            }
        }
    }
}

struct View3_Previews: PreviewProvider {
    static var previews: some View {
        View3()
    }
}
