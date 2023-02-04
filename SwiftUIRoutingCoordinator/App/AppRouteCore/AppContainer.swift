//
//  ContainerView.swift
//  SwiftUIRoutingCoordinator
//
//  Created by tasneem .. on 03/02/2023.
//

import SwiftUI
import Combine

struct AppContainer<Content:View,Router:AppRouteProtocol>: View {
    @Environment(\.dismiss) var dismiss
    let content : Content

    @Binding var destination: RouteTree

    @State var isActive:Bool = false
    @State var presentSheet:Bool = false
    @State var presentFullSheet:Bool = false
    @State var popBack:Bool = false
    @State var popRoot:Bool = false

    init(destination:Binding<RouteTree>, @ViewBuilder content:() -> Content){
        self._destination   = destination
        self.content = content()

    }

    var body: some View {
        VStack{
            content
            NavigationLink("", destination: Router.destination(destination), isActive: $isActive)
        }
        .sheet(isPresented: $presentSheet , onDismiss: {destination = .none}, content: {
            Router.destination(destination)
        })
        .fullScreenCover(isPresented: $presentFullSheet, onDismiss: {destination = .none}) {
            NavigationView {
                Router.destination(destination)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Image(systemName: "arrow.backward")
                                .foregroundColor(.black)
                                .onTapGesture {
                                    presentFullSheet = false
                                }
                        }
                    }
            }
        }
        .onChange(of: destination, perform: { newValue in
            isActive            = typeEqual(route: destination, transType: .push)
            presentSheet        = typeEqual(route: destination, transType: .present)
            presentFullSheet    = typeEqual(route: destination, transType: .presentFull)
            popBack             = destination == .back
            popRoot             = destination == .root


        })
        .onChange(of: isActive, perform: { isActive in
            if(!isActive){
                destination = .none
            }
        })
        .onChange(of: popBack) { newValue in
            if(newValue){
                dismiss()
            }
        }
        .onChange(of: popRoot) { newValue in
            if(newValue){
                AppRoute.popRoot()
            }
        }
       
    }

    func typeEqual(route: RouteTree, transType:TransitionStyle ) -> Bool {
           return Router.transitionType(route) == transType
   }
}

struct ContainerView_Previews: PreviewProvider {
    static var previews: some View {
        AppContainer<EmptyView, DemoRouter>(destination: Binding.constant(RouteTree.root), content: {

        })
    }
}
