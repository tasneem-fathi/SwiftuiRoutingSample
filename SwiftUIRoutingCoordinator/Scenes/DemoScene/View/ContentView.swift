//
//  ContentView.swift
//  SwiftUIRoutingCoordinator
//
//  Created by tasneem .. on 03/02/2023.
//

import SwiftUI

struct ContentView: View {
    @State var route : RouteTree = .none

    var body: some View {
        NavigationView {
            AppContainer<VStack, DemoRouter>(destination: $route) {

                    VStack(spacing:10) {
                        Button {
                            route = .view2(DemoViewModel())
                        } label: {
                            Text("Go View2")
                        }

                        Button {
                            route = .view3
                        } label: {
                            Text("Go View3")
                        }

                        Button {
                            route = .sheetView
                        } label: {
                            Text("PresentSheet")
                        }
                        Button {
                            route = .fullSheetView
                        } label: {
                            Text("PresentFullSheet")
                        }
                    }

            }.navigationTitle("Home View")

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
