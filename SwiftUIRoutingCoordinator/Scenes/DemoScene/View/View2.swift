//
//  View2.swift
//  SwiftUIRoutingCoordinator
//
//  Created by tasneem .. on 03/02/2023.
//

import SwiftUI

struct View2: View {
    @State var route : RouteTree = .none

    var body: some View {
        AppContainer<VStack,DemoRouter>(destination: $route) {
            
            VStack(spacing:10){
                Text("Hello, Iam View2")
                Button {
                    route = .anotherView
                } label: {
                    Text("Go to Another View")
                }
                
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

struct View2_Previews: PreviewProvider {
    static var previews: some View {
        View2()
    }
}
