//
//  AnotherView.swift
//  SwiftUIRoutingCoordinator
//
//  Created by tasneem .. on 03/02/2023.
//

import SwiftUI

struct AnotherView: View {
    @State var route : RouteTree = .none

    var body: some View {
        AppContainer<VStack,AnotherRouter>(destination: $route) {

            VStack(spacing:10){
                Text("Hello, World I am Another View")
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

struct AnotherView_Previews: PreviewProvider {
    static var previews: some View {
        AnotherView()
    }
}
